import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/order_declined.dart';
import 'package:squeeky/screens/success_payment_reciept.dart';
import 'package:squeeky/style/textstyles.dart';

class PlacingOrderSreen extends StatefulWidget {
  List<dynamic> paidOrders ; String total, subtotal, serviceFee, businessName;
  PlacingOrderSreen({Key? key, required this.paidOrders, required this.total, required this.subtotal, required this.businessName, required this.serviceFee}) : super(key: key);

  @override
  State<PlacingOrderSreen> createState() => _PlacingOrderSreenState();
}

class _PlacingOrderSreenState extends State<PlacingOrderSreen> {
  void initState() {
    // TODO: implement initState
    Timer(
      Duration(seconds: 5),
      (){
        Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SucessPaymentReceiptScreen( successPayment: widget.paidOrders, businessName: widget.businessName, serviceFee: widget.serviceFee, subtotal: widget.subtotal, total: widget.total,)),
      );
      }    
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // remove the back botton from appbar
        automaticallyImplyLeading: false,
      ),
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
                // ListTile(
                //   leading: Icon(Icons.done, size: 16,),
                //   title: Text('Standard delivery:'),
                //   subtitle: Text('10:30AM - Jan 22. 2023'),
                // ),
                ListTile(
                  leading: Icon(Icons.done, size: 16,),
                  title: Text('Your order, {}'),
                ),
                // Text('1 Deck Cleaning'),
                // Text('10 Window Cleaning.')
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.paidOrders[0]['services'].length,
                  itemBuilder: (context, index){
                    var services =widget.paidOrders[0]['services'][index];
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
                          title: Text(services['service_name'], style:text17L),
                          trailing: Text('\$ ${services['price']}', style: text17L,),
                        );
                  }
                
                ),
              ],
            )
            ),
            // ElevatedButton(
            //   onPressed: ()=>Get.to(()=>OrderDeclined()), 
            //   child: Text('Undo {Note: i felt this button is not neccessary}'),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Color(0xFFEFECF0)
            //   ),
            // )
        ],
      ),
    );
  }
}

