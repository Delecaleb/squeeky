import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../style/textstyles.dart';
class Promotions extends StatelessWidget {
  const Promotions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotions'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFFEFECF0),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.label),
                  label: Text("Enter promo code"),
                  border: InputBorder.none
                ),
                
              ),
            ),
            
            ],
        ),
      ),
      bottomSheet: Container(
              height: 110,
              color: Color(0xFFEFECF0),
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFF87CEEB),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    margin: EdgeInsets.only(right: 10, left: 10),
                    width: Get.width *0.85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Invite friends to Squeeky. You get \$10 off when each friend makes their first order.", style: text12,),
                        SizedBox(height: 5,),
                        Container(
                          width: Get.width*0.4,
                          child: ElevatedButton(
                            onPressed: (){}, 
                            child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Text('Start inviting', style: text14,),
                                    Icon(Icons.arrow_forward, size: 15,)
                                  ],
                            )
                            ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Color(0xFF87CEEB),
                    child: Column(
                      children: [
                        Text("Invite friends to Squeeky. You get \$10 off when each friend makes their first order.")
                      ],
                    ),
                  ),
                  Container(
                    color: Color(0xFF87CEEB),
                    child: Column(
                      children: [
                        Text("Invite friends to Squeeky. You get \$10 off when each friend makes their first order.")
                      ],
                    ),
                  )
                ],
              ),
            )
          ,
    );
  }
}