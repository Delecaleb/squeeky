import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/style/textstyles.dart';
class PlacingOrderSreen extends StatefulWidget {
  PlacingOrderSreen({Key? key}) : super(key: key);

  @override
  State<PlacingOrderSreen> createState() => _PlacingOrderSreenState();
}

class _PlacingOrderSreenState extends State<PlacingOrderSreen> {
  void initState() {
    // TODO: implement initState
    Timer(
      Duration(seconds: 4),
      (){
        Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ReceiptScreen()),
      );
      }    
    );
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
                Text('10 Window Cleaning')
              ],
            )
            ),
            ElevatedButton(
              onPressed: (){}, 
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




class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({Key? key}) : super(key: key);

  @override
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total", style: text34,),
                    Text('\$ 600', style: text34)
                  ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal", style: text17L,),
                    Text('\$ 600', style: text17L)
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Service fee", style: text17L,),
                    Text('\$ 600', style: text17L)
                  ],
                ),
              ],
            ),
        )
      ),
    );
  }
}