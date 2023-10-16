import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/home.dart';
import 'package:squeeky/style/textstyles.dart';
class PlacingOrderSreen extends StatefulWidget {
  PlacingOrderSreen({Key? key}) : super(key: key);

  @override
  State<PlacingOrderSreen> createState() => _PlacingOrderSreenState();
}

class _PlacingOrderSreenState extends State<PlacingOrderSreen> {
  void initState() {
    // TODO: implement initState
    // Timer(
    //   Duration(seconds: 20),
    //   (){
    //     Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => ReceiptScreen()),
    //   );
    //   }    
    // );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Placing Order', style: text34,),
                    CircularProgressIndicator(
                      
                    ),
                  ],
                ),
                ListTile(
                  leading: Icon(Icons.done, size: 16),
                  title: Text('Home'),
                ),
                ListTile(
                  leading: Icon(Icons.done, size: 16,),
                  title: Text('Standard delivery:'),
                  subtitle: Text('10:30AM - Jan 22. 2023'),
                ),
                ListTile(
                  leading: Icon(Icons.done, size: 16,),
                  title: Text('Your order, Dolly'),
                ),
                Text('1 Deck Cleaning'),
                Text('10 Window Cleaning.')
              ],
            )
            ),
            ElevatedButton(
              onPressed: ()=>Get.to(()=>OrderDeclined()), 
              child: Text('Undo'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEFECF0)
              ),
            )
        ],
      ),
    );
  }
}


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


class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({Key? key}) : super(key: key);

  @override
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon : Icon(Icons.cancel), onPressed: () => Get.offAll(()=>HomeScreen()),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Color(0xFF87CEEB),
                  padding: EdgeInsets.only(left: 20, right: 40, top: 40, bottom: 40),
                  child: Text('Here’s your order summary for xyz Business', style: text34,)
                ),
                Container(
                  height: Get.height*0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/receipt_icon.png'),
                      fit: BoxFit.cover
                      )
                  ),
                  ),
                  SizedBox(height: 25,),
                
                ListTile(
                  title: Text("Total", style: text34,),
                  trailing: Text('\$ 600', style: text34),
                ),
                SizedBox(height: 25,),
                Divider(
                  indent: 25,
                  endIndent: 25,
                ),
                SizedBox(height: 25,),
                ListTile(
                  leading: Container(
                    height: 26,
                    width: 26,
                    // padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text('1', textAlign: TextAlign.center, style: text17L,),
                    decoration: BoxDecoration(
                      border: Border.all()
                      ),
                  ),
                  title: Text('Deck Cleaning', style:text17L),
                  trailing: Text('\$200', style: text17L,),
                ),
                ListTile(
                  leading: Container(
                    height: 26,
                    width: 26,
                    // padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Text('10', textAlign: TextAlign.center, style: text17L,),
                    decoration: BoxDecoration(
                      border: Border.all()
                      ),
                  ),
                  title: Text('Deck Cleaning', style:text17L),
                  trailing: Text('\$200', style: text17L,),
                ),
                SizedBox(height: 30,),
                Divider(
                  indent: 25,
                  endIndent: 25,
                ),
                SizedBox(height: 25,),
                ListTile(
                  title: Text("Subtotal", style: text17L,),
                  trailing: Text('\$ 600', style: text17L),
                ),
                SizedBox(height: 25,),
                ListTile(
                  title: Text("Service fee", style: text17L,),
                  trailing: Text('\$ 600', style: text17L),
                ),
                SizedBox(height: 15,),
                Text('Payments', style: text18,),
                ListTile(
                  leading: Image.asset('assets/msc.png'),
                  title: Text('Mastercard **** 2345', style: text18,),
                  subtitle: Text('01/11/2022 15:31'),
                  trailing: Text('\$298.03'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Text('Switch payment method', style: text18,),
                ),
                Divider(
                  indent: 40,
                ),
                ListTile(
                  leading: Icon(Icons.mail),
                  title: Text('Resend Email', style: text18,),
                ),
              ],
            ),
        )
      ),
    );
  }
}