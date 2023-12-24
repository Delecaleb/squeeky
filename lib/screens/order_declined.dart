import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/style/textstyles.dart';

class OrderDeclined extends StatelessWidget {
  const OrderDeclined({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/connecting.png', width: Get.width,),
            Container(
              child: Text('Oh, Your Order Was Declined', style: text26,),
            ),
            Container(
              child: Text('It seems that your order request for PestControl was declined. You will be directed to another similar service near you. ', style: text17B,),
            )
          ],
        ),
      ),
    );
  }
}

