import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/style/textstyles.dart';

class OrderLists extends StatelessWidget {
  const OrderLists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your orders'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Image.asset('assets/Subtract.png', width: Get.width * 0.2),

            Text("No orders yet", style: titleText,),
            SizedBox(height: 10,),
            Text("When you place your first order, it will appear here" , style: textInfoLG, textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){}, 
              child: Text('Fine Service', style: textBtn,),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF87CEEB)
              ),
            )
          ],
        ),
      ),
    );
  }
}