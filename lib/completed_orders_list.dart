import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/controllers/completed_orders_controller.dart';
import 'package:squeeky/screens/orderDetails.dart';

class CompletedOrders extends StatelessWidget {
  
  CompletedOrders({Key? key}) : super(key: key);
  
  CompletedOrdersController completedOrdersController = Get.put(CompletedOrdersController());
  
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

            if(completedOrdersController.isloading.value){
                return Container(
                  height: Get.height,
                  width: Get.width,
                  child: Center(child: Text('Loading...'))
                  );            
            }else{
            return completedOrdersController.completedOrders.isEmpty ? 
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
              itemCount: completedOrdersController.completedOrders.length,
              itemBuilder: (context, index){
                var completedOrders =  completedOrdersController.completedOrders[index];
                
                return ListTile(
                  onTap: () => Get.to(()=>OrderDetailsScreen(orderDetails: completedOrders,)),
                  leading: Image.network("https://learncrib.com.ng/squeeky/dashboard/businessfiles/${completedOrders.imagePath}"),
                  title: Text(completedOrders.businessName),
                  subtitle: Text.rich( TextSpan(text: "${completedOrders.servicesOfferedList.length} item(s) \$${completedOrders.total} \n", 
                  children: [
                    TextSpan(
                      text: completedOrders.dateCompleted, style: TextStyle(
                        color:  completedOrders.dateCompleted.toLowerCase() =='pending' ? Color.fromARGB(255, 195, 134, 130) : Colors.green,
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