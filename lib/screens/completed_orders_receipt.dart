import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/home.dart';
import 'package:squeeky/style/textstyles.dart';

import '../models/paid_order_model.dart';


class ReceiptScreen extends StatelessWidget {
  PaidOrderModel completedOrder;
  ReceiptScreen({Key? key, required this.completedOrder}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon : Icon(Icons.cancel), onPressed: () => Get.offAll(()=>HomeScreen(currentIndex: 0,)),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
            child: Column(
              children: [
                Container(
                  color: Color(0xFF87CEEB),
                  padding: EdgeInsets.only(left: 20, right: 40, top: 40, bottom: 40),
                  child: Text('Here’s your order summary for ${completedOrder.businessName}', style: text34,)
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
                  trailing: Text('\$${completedOrder.total}', style: text34),
                ),
                SizedBox(height: 25,),
                Divider(
                  indent: 25,
                  endIndent: 25,
                ),
                SizedBox(height: 25,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: completedOrder.servicesOfferedList.length,
                  itemBuilder: (context, index){
                    var services = completedOrder.servicesOfferedList[index];
                    return ListTile(
                          leading: Container(
                            height: 26,
                            width: 26,
                            // padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text('${index+1}', textAlign: TextAlign.center, style: text17L,),
                            decoration: BoxDecoration(
                              border: Border.all()
                              ),
                          ),
                          title: Text(services.serviceName, style:text17L),
                          trailing: Text('\$${services.serviceTotal}', style: text17L,),
                        );
                  }
                
                ),
                SizedBox(height: 30,),
                Divider(
                  indent: 25,
                  endIndent: 25,
                ),
                SizedBox(height: 25,),
                ListTile(
                  title: Text("Subtotal", style: text17L,),
                  trailing: Text('\$${completedOrder.subTotal}', style: text17L),
                ),
                SizedBox(height: 25,),
                ListTile(
                  title: Text("Service fee", style: text17L,),
                  trailing: Text('\$ ${completedOrder.serviceCharge}', style: text17L),
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


