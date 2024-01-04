import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/create_account.dart';
import 'package:squeeky/screens/signup.dart';
import 'package:squeeky/style/textstyles.dart';

import '../controllers/login_to_account_controller.dart';
import '../widgets.dart';

class LoginScreen extends StatelessWidget {
  
  LoginScreen({super.key});

  var loginToAccount = Get.put(LoginAccountController());

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text('Enter Your Login Details', style: text20,),
                
                SizedBox(height: 10,),

                InputWidget(label: 'User ID e.g name@example.com', input_controller: loginToAccount.userController, inputIcon: Icon(Icons.mail_outline), obscureText:false),
                SizedBox(height: 10,),
                InputWidget(label: 'password', input_controller: loginToAccount.passwordController, inputIcon: Icon(Icons.lock_outline_rounded), obscureText:true),
                
                SizedBox(height: 10,),
                
                Obx(() {
                    return Text(loginToAccount.errorMsg.value, style: TextStyle(color: Colors.red),);
                  }
                ),

                SizedBox(height: 10,),

                Obx(() {
                    return loginToAccount.isLoading.value ? 
                    Center(child: CircularProgressIndicator()) 
                    :
                     TextButton(
                      onPressed: (){
                        if(loginToAccount.userController.text=='' || loginToAccount.passwordController.text=='' ){
                            Get.snackbar('All fields are required','');
                        }else{
                          loginToAccount.SignIn();
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
                      );
                  }
                ),
                SizedBox(height: 20,),
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
                  onPressed: ()=>Get.to(()=>SignUp()), 
                  child: Text('Create Account'),
                  
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