import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:squeeky/controllers/create_account_controller.dart';
import 'package:squeeky/screens/create_account.dart';
import 'package:squeeky/screens/login.dart';
import 'package:squeeky/style/textstyles.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var countryCode = 'Canada';
  var countryCallCode = "+44";
  var createAccount = Get.put(CreateAccountController());
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Enter your mobile number', style: text20,),
                SizedBox(height: 15,),
                Container(
                  width: Get.width,
                  child: Row(
                    children: [
                      Container(
                        child: CountryCodePicker(
                          initialSelection: countryCode,
                          showDropDownButton: true,
                          padding: EdgeInsets.all(2),
                          hideMainText: true,
                          showFlag: true,
                          onChanged: (value) {
                            setState(() {
                             countryCallCode = value.toString();
                            });
                          },
                        ),
                      ),
                
                      Expanded(
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          controller: createAccount.phoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusColor: Color(0xFFEFECF0),
                            fillColor: Color(0xFFEFECF0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black,)
                            ),
                            filled: true,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(top:10.0, left: 5),
                              child: Text(countryCallCode, style: text14,),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ), 
                SizedBox(height: 15,),
                TextButton(
                  onPressed: (){
                    if(createAccount.phoneNumberController.text==''){
                        Get.snackbar('Mobile number is compulsory','');
                    }else{
                        Get.to(()=>CreateAccount(phoneNumber: countryCallCode+ createAccount.phoneNumberController.text,));
                    }
                  },
                  child: Text('Continue', style: titleTextWhite,),
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF87CEEB),
                    minimumSize: Size.fromHeight(60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)
                    )
                  ),
                  ),
            
                Row(
                      children: [
                        Expanded(
                          child: Divider(),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text('or'),
                        ),
                        Expanded(
                          child: Divider(),
                        ),
                      ],
                    ),
                SizedBox(height: 20,),
                TextButton(
                  onPressed: null, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.apple, color: Colors.black,),
                      Text('Continue With Apple'),
                    ],
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(56, 119, 119, 119),
                    minimumSize: Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                  ),
                ),
                            
                SizedBox(height: 10,),  
                TextButton(
                  onPressed: null, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/google.png', width: 15,),
                      SizedBox(width: 5,),
                      Text('Continue With Google'),
                      
                    ],
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(56, 119, 119, 119),
                    minimumSize: Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                  ),
                ),
                SizedBox(height: 10,),  
                TextButton(
                  onPressed: ()=>Get.to(()=>LoginScreen()), 
                  child: Text("Sign In"),
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(56, 119, 119, 119),
                    minimumSize: Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                  ),
                ),
                SizedBox(height: 70,),
                Text('By continuing, you agree to receive phone calls or text messages, including automated ones, from Squeeky and its affiliated parties at the provided phone number. '),
            
                SizedBox(height: 60,),
            
                ElevatedButton(
                  onPressed: null, 
                  child: Icon(Icons.arrow_back, size: 25,),
            
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: EdgeInsets.symmetric(vertical:20),
                    
                  ),
                ),
                SizedBox(height: 40,),
                Text.rich(
                  TextSpan(
                  children: [
                    TextSpan(text: 'This site is protected by reCAPTCHA and the '),
                    TextSpan(text: 'Google Privacy Policy and Terms of Service apply.')
                  ]
                )
                ),
              ],
            
            ),
          ),
        ),
      ),
    );
  }
}