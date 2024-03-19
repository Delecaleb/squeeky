import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:squeeky/controllers/create_account_controller.dart';
import 'package:squeeky/controllers/otp_sender_controller.dart';
import 'package:squeeky/screens/create_account.dart';
import 'package:squeeky/screens/login.dart';
import 'package:squeeky/style/textstyles.dart';
import 'package:squeeky/widgets.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var countryCode = 'Canada';
  var countryCallCode = "+1";
  var createAccount = Get.put(CreateAccountController());
  var otpController = Get.put(OTPcontroller());
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
                SizedBox(height: 15,),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('What is your email address', style: titleText,),
                      SizedBox(height: 35,),
                      InputWidget(label: 'name@example.com', input_controller: createAccount.emailController, inputIcon: Icon(Icons.mail_outline), obscureText:false)
                    ],
                  ),

                // ListTile(
                //   contentPadding: EdgeInsets.zero,                  
                //   leading: CountryCodePicker(
                //           initialSelection: countryCode,
                //           showDropDownButton: true,
                //           padding: EdgeInsets.all(2),
                //           hideMainText: true,
                //           showFlag: true,
                //           onChanged: (value) {
                //             setState(() {
                //              countryCallCode = value.toString();
                //             });
                //           },
                //         ),
                //   title: TextField(
                //           inputFormatters: [
                //             FilteringTextInputFormatter.digitsOnly,
                //           ],
                //           controller: createAccount.phoneNumberController,
                //           keyboardType: TextInputType.phone,
                //           decoration: InputDecoration(
                //             border: InputBorder.none,
                //             focusColor: Color(0xFFEFECF0),
                //             fillColor: Color(0xFFEFECF0),
                //             focusedBorder: OutlineInputBorder(
                //               borderSide: BorderSide(color: Colors.black,)
                //             ),
                //             filled: true,
                //             prefixIcon: Padding(
                //               padding: const EdgeInsets.only(top:10.0, left: 5),
                //               child: Text(countryCallCode, style: text14,),
                //             ),
                //           ),
                //         ),
                // ),
                
                SizedBox(height: 15,),
                
                TextButton(
                  onPressed: ()async{
                    if(createAccount.emailController.text==''){
                        Get.snackbar('Email Address is Compulsory','');
                    }else{
                        Random random = Random();
                        int otp = random.nextInt(9999 - 1000) + 1000;
                        otpController.generateOtp(createAccount.emailController.text, otp);
                        Get.to(()=>CreateAccount(emailAddress: createAccount.emailController.text, otp:otp,));
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
                // TextButton(
                //   onPressed: null, 
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Icon(Icons.apple, color: Colors.black,),
                //       Text('Continue With Apple'),
                //     ],
                //   ),
                //   style: TextButton.styleFrom(
                //     backgroundColor: Color.fromARGB(56, 119, 119, 119),
                //     minimumSize: Size.fromHeight(50),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(5)
                //     ),
                //   ),
                // ),
                            
                // SizedBox(height: 10,),  
                // TextButton(
                //   onPressed: null, 
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Image.asset('assets/google.png', width: 15,),
                //       SizedBox(width: 5,),
                //       Text('Continue With Google'),
                      
                //     ],
                //   ),
                //   style: TextButton.styleFrom(
                //     backgroundColor: Color.fromARGB(56, 119, 119, 119),
                //     minimumSize: Size.fromHeight(50),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(5)
                //     ),
                //   ),
                // ),
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