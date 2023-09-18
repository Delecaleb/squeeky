import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/orders_list.dart';
import 'package:squeeky/style/textstyles.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            ListTile(
              onTap: ()=>Get.to(()=>OrderLists()),
              contentPadding: EdgeInsets.zero,
              trailing: ElevatedButton.icon(
                onPressed:  ()=>Get.to(()=>OrderLists()), 
                icon: Icon(Icons.line_style_rounded), 
                label: Text('Orders')
              ),
            ),

            Text('Basket', style:  titleText,),
            
            SizedBox(height: 20,),

            Image.asset('assets/cart.png', width: Get.width * 0.3),
            SizedBox(height: 40,),
            Text("Add items to start a cart", style: titleText,),
            SizedBox(height: 10,),
            Text("When you select items from a service or store, your cart will be displayed here" , style: textInfoLG, textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            ElevatedButton(
              onPressed: (){}, 
              child: Text('Start Shopping', style: textBtn,),
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