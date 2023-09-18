import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/address.dart';
import 'package:squeeky/style/textstyles.dart';

class TermsAndConditions extends StatefulWidget {
  TermsAndConditions({Key? key}) : super(key: key);

  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  int currentIndex = 0;
  bool _agreeMent = false;
  
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
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
          height: Get.height -100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if(currentIndex == 0)...[
                Container(
                  height: Get.height -100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.edit_square),
                            title: Text(
                              "Accept Squeeky's Terms & Review Privacy Notice", style: termsTitle,
                            ),
                          ),

                          const Text.rich(
                        TextSpan(
                          text: "By selecting 'I Agree' below, I have reviewed and agree to the ",
                          children: [
                            TextSpan(
                              text: "Terms of Use "
                            ),
                            TextSpan(
                              text: "and acknowledge the "
                            ),
                            TextSpan(
                              text: "Privacy Notice."
                            ),
                            TextSpan(text: "I am at least 18 years of age.")
                          ]
                          )
                      ),
                        ],
                      ),
                      
                          
                      Column(
                        children: [
                          Divider(),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('I agree'),
                              Checkbox(
                                value: _agreeMent, 
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    _agreeMent = newValue!;
                                  });
                                },
                              )
                            ],
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const ElevatedButton(
                                onPressed: null, 
                                child: Icon(Icons.arrow_back_sharp)
                              ),
                              ElevatedButton.icon(
                                onPressed: _agreeMent ? ()=>gotoNext() : null, 
                                icon: Icon(Icons.arrow_forward), 
                                label:Text("Next")
                              )
                            ],
                            )
                        ],
                      ),
                      
                          
                      
                    ],
                  ),
                )
              ]

              else if(currentIndex == 1)...[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: Get.width,
                        height: Get.height*0.3,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/gift.png'), fit: BoxFit.cover),
                          
                        ),
                      ),
                      SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Text('Discounts, updates and more', style: text34,),
                              Text("You’re all set to receive special offers, personalised recommendations and essential product updates for all Squeeky services. This may include related services like Rides, Eats, Grocery, Scooters/Bikes and more. To manage your communication or marketing peferences, just go to:"),
                              Text('Marketing preferences settings')
                          ],
                        ),
                      ),
                      
                    ],
                  ),

                  ElevatedButton(
                        onPressed: ()=>gotoNext(), 
                        child: Text('Next')
                      ),
              ]

              else if(currentIndex==2)...[
                  SizedBox(height: Get.height *0.1,),
                  Image.asset('assets/location.png', width: Get.width *0.4,),
                  SizedBox(height: Get.height *0.1,),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Allow location access', style: titleText,),
                        SizedBox(height: 10,),
                        Text('This lets us show you which restaurants and stores you can order from'),
                        SizedBox(height: 10,),
                        
                        ElevatedButton(
                          onPressed: ()=>Get.to(()=>Address()), 
                          child: Text('Allow', style: titleTextWhite,),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            backgroundColor: Color(0xFF87CEEB)
                          ),
                        ),
                        SizedBox(height: 10,),
                        ElevatedButton(
                          onPressed: null, 
                          child: Text('Close', style: titleText,),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )
                          ),
                        ),
                      ],
                    ),
                  ),

                  

                  
              ]
            ],
          ),
        ),
      ),
    );
  }
}