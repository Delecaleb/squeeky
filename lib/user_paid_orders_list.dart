import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/controllers/paid_orders_controller.dart';
import 'package:squeeky/screens/orderDetails.dart';

class PaidOrders extends StatelessWidget {
  
  PaidOrders({Key? key}) : super(key: key);
  
  PaidOrdersController paidOrdersController = Get.put(PaidOrdersController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child:         
        Obx((){

            if(paidOrdersController.isloading.value){
                return Container(
                  height: Get.height,
                  width: Get.width,
                  child: Center(child: Text('Loading...'))
                  );            
            }else{
            return paidOrdersController.paidOrders.isEmpty ? 
            Container(
              height: Get.height,
              width: Get.width,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  Image.asset('assets/tool.jpg'),
                  SizedBox(height: 20,),
                  Text('No completed orders yet')
                ],
              ),
            )
            
            :
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: paidOrdersController.paidOrders.length,
              itemBuilder: (context, index){
                var eachPaidOrder =  paidOrdersController.paidOrders[index];
                
                return ListTile(
                  onTap: () => Get.to(()=>OrderDetailsScreen(orderDetails: eachPaidOrder,)),
                  leading: Image.network("https://squeeky.org/dashboard/businessfiles/${eachPaidOrder.imagePath}"),
                  title: Text(eachPaidOrder.businessName),
                  subtitle: Text.rich( TextSpan(text: "${eachPaidOrder.servicesOfferedList.length} item(s) \$${eachPaidOrder.total} \n", 
                  children: [
                    TextSpan(
                      text: eachPaidOrder.dateCompleted, style: TextStyle(
                        color:  eachPaidOrder.serviceStatus.toLowerCase() !='completed' ? Color.fromARGB(255, 195, 134, 130) : Colors.green,
                      )
                    )
                  ]
                  )),
                ); 
            }
            );
            }
          }
        ),
      ),
    );
  }
}