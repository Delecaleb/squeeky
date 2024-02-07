import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/completed_orders_receipt.dart';
import 'package:squeeky/screens/ratingservices.dart';
import 'package:squeeky/style/textstyles.dart';

import '../models/paid_order_model.dart';

class OrderDetailsScreen extends StatelessWidget {
  
  PaidOrderModel orderDetails;
  
  OrderDetailsScreen({super.key, required this.orderDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order #${orderDetails.servicesOfferedList[0].paymentId}'),

        // actions: [Text('Help')],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: Get.height * 0.2,
                  width: Get.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://squeeky.org/dashboard/businessfiles/${orderDetails.imagePath}'),
                      fit: BoxFit.cover
                      )
                  ),
                ),
                
                ListTile(
                   title: Text(orderDetails.businessName),
                
                   subtitle: Text.rich(
                           TextSpan(
                           children: [
                            if(orderDetails.serviceStatus.toLowerCase() !='completed')...[
                              TextSpan(text: "Order ${orderDetails.serviceStatus}", style: TextStyle(color:  Color.fromARGB(255, 195, 134, 130))),
                            ]else...[
                                 TextSpan(text: "Order Completed  ", style: TextStyle(color: Color(0xFF0F984A))),  TextSpan(text: '${orderDetails.dateCompleted}')
                            ],
                             
                           ]
                         )
                         ),
                   ),
                 ListTile(
                   title: Text('Your order', style: text21,),
                   trailing: ElevatedButton(

                    /// if order is pending no rating allow
                    onPressed: orderDetails.serviceStatus.toLowerCase() !='completed' ? null : (){
                    final orderIds = orderDetails.servicesOfferedList.map((service) => service.orderId).toList();
                    final serviceIds = orderDetails.servicesOfferedList.map((e) => e.serviceId).toList();
                      Get.to(()=>RatingServicesScreen(
                        businessId: orderDetails.businessId, 
                        businessName: orderDetails.businessName, 
                        imagePath: orderDetails.imagePath, 
                        orderId: orderIds,  
                        serviceId: serviceIds)
                      ); 
                    },
                      child: Text('Rate service')
                    ),
                 ), 
                
                 ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: orderDetails.servicesOfferedList.length,
                  itemBuilder: (context, index2){
                    var servicesOffered = orderDetails.servicesOfferedList[index2];
                    return ExpansionTile(
                   leading: Container(
                     width: 24,
                     height: 24,
                     color: Color(0xFFEFECF0),
                     child:  Text('${index2+1}', style: text14, textAlign: TextAlign.center,),
                   ),
                   title: Text(servicesOffered.serviceName),
                   subtitle: Text('Read more'),
                   trailing: Text(''),
                   expandedAlignment: Alignment.bottomLeft,
                   childrenPadding: EdgeInsets.all(15),
                   children: [
                     Text('data'),
                   ],
                   );
                  
                  }

                 ),
                //  ExpansionTile(
                //    leading: Container(
                //      width: 24,
                //      height: 24,
                //      color: Color(0xFFEFECF0),
                //      child:  Text('1', style: text14, textAlign: TextAlign.center,),
                //    ),
                //    title: Text('Basic Lawn Mowing'),
                //    subtitle: Text('Read more'),
                //    trailing: Text(''),
                //    expandedAlignment: Alignment.bottomLeft,
                //    childrenPadding: EdgeInsets.all(15),
                //    children: [
                //      Text('data'),
                //    ],
                //    ),
                   
                  //  ListTile(
                  //     leading: Container(
                  //       width: 24,
                  //       height: 24,
                  //       color: Color(0xFFEFECF0),
                  //       child:  Text('1', style: text14, textAlign: TextAlign.center,),
                  //     ),
                  //     title: Text('Basic Lawn Mowing'),
                  //     subtitle: ShowMoreLessWidget(fullText: "Choice of Lawn Size Large ( 20,000-25,000 sqft.) Choice grass height Medium Number of Trees 0"),
                  //  ),
                   
              ],
            ),
            ElevatedButton(
              onPressed: ()=>Get.to(()=>ReceiptScreen(completedOrder: orderDetails,)), child: Text('View receipt'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEFECF0),
                minimumSize: Size.fromHeight(60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
                )
              ),
            ),
            SizedBox(height: 15,),
            ElevatedButton(
              onPressed: (){}, child: Text('Get Help'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEFECF0),
                minimumSize: Size.fromHeight(60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}