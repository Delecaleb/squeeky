import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/create_account.dart';
import 'package:squeeky/style/textstyles.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var countryCode = 'NG';
  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Enter your mobile number'),
          Row(
            children: [
              CountryCodePicker(
                // showCountryOnly: true,
                showFlag: true,
                onChanged: (value) {
                  setState(() {
                    print(value);
                  });
                },
              ),


              // IntlPhoneField(
              //   keyboardType: TextInputType.phone,
              //   initialCountryCode: 'NG',
              //   showCountryFlag: false,
              //   onChanged: null,
              // ),
            ],
          ),
          TextButton(
            onPressed: ()=>Get.to(()=>CreateAccount()), 
            child: Text('Continue', style: btnBold,),
            style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(0, 135, 206, 235),
              minimumSize: Size.fromHeight(50),
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
    );
  }
}