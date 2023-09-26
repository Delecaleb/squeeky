import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/terms.dart';
import 'package:squeeky/style/textstyles.dart';
import 'package:squeeky/widgets.dart';

class CreateAccount extends StatefulWidget {
   String phoneNumber;
   CreateAccount({required this.phoneNumber, super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  int currentIndex = 0;
  int totalIndex = 4;
  void gotoNext(){
    if(currentIndex < totalIndex -1){
      setState(() {
        currentIndex++;
      });
    }
  }

  void gotoPrevious(){
    if(currentIndex > 0){
      setState(() {
        currentIndex --;
      });
    }
  }

  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Container(
            height: Get.height - 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if(currentIndex==0)...[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Enter the 4-digit code sent to you at ${widget.phoneNumber} ', style: titleText,),
                        SizedBox(height: 30,),
                        OtpTextField(
                          mainAxisAlignment: MainAxisAlignment.start,
                          focusedBorderColor: Colors.black,
                          onCodeChanged: (value) {
                            setState(() {
                              isActive = true;
                            });
                          },
                          numberOfFields: 4,
                          showFieldAsBox: true, 
                          onSubmit: (String verificationCode){
                            gotoNext();
                          }               
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Text('I haven’t received a code (0:05)', style: isActive ? textInfoBold : textInfo,),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 233, 233, 233),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          )
                      ],
                    ),
                     
                ]
                else if(currentIndex==1)...[
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('What is your email address', style: titleText,),
                      SizedBox(height: 35,),
                      InputWidget(label: 'name@example.com', input_controller: emailController, inputIcon: Icon(Icons.mail_outline), obscureText:false)
                    ],
                  ),
                ]
                else if(currentIndex==2)...[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Create your account password', style: titleText,),
                        SizedBox(height: 15,),
                        Text('Your passwords must be at least 8 characters long and contain at least one letter and one digit'),
                        SizedBox(height: 15,),
                        InputWidget(obscureText:true, label: 'Password', input_controller: passwordController, inputIcon: Icon(Icons.lock_outline))
                      ],
                    ),
          
                ]
                else if(currentIndex==3)...[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('What’s your name?', style: titleText,),
                        SizedBox(height: 17,),
                        Text('Let us know how to properly address you'),
                        SizedBox(height: 15,),
                        InputWidget(obscureText:false, label: 'Please enter first name', input_controller: firstNameController, inputIcon: Icon(Icons.person)),
                        SizedBox(height: 5,),
                        InputWidget(obscureText:false, label: 'Please enter Surname', input_controller: lastNameController, inputIcon: Icon(Icons.person))
                      ],
                    ),
                ],
          
                currentIndex >0 ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    currentIndex >1 ? ElevatedButton(
                    onPressed: (){
                      gotoPrevious();
                     
                    }, 
                  child: Icon(Icons.arrow_back)
                  ):
                  Text(''),
                    ElevatedButton(
                        onPressed: (){
                          if(currentIndex < 3){
                              gotoNext();
                          }else{
                            Get.to(()=>TermsAndConditions());
                          }
                         
                        }, 
                      child: Text('Next')
                      ),
                  ],
                ): Text(''),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}