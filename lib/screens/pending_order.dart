import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/controllers/pending_orders_controller.dart';
import 'package:squeeky/style/textstyles.dart';

class PendingOrdersList extends StatelessWidget {
  PendingOrdersList({super.key});
  PendingOrdersController pendingOrderController = Get.put(PendingOrdersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
            ElevatedButton.icon(
              onPressed: null,
              icon: Icon(Icons.file_open),
              label: Text('Orders', style: text15B,)
              )
          ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            // SizedBox(height: 30,),
            // Image.asset('assets/Subtract.png', width: Get.width * 0.2),

            // Text("No pending orders yet", style: titleText,),
            // SizedBox(height: 10,),
            // Text("When you place your first order, it will appear here" , style: textInfoLG, textAlign: TextAlign.center,),
            // SizedBox(height: 10,),
            
            Obx(() {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: pendingOrderController.pendingOrders.length,
                  itemBuilder:   (BuildContext, index){
                      var pendingOrders = pendingOrderController.pendingOrders[index];
                      return ListTile(
                        leading: CircleAvatar(
                                radius: 30.0,
                                backgroundImage: pendingOrders.businessLogo !='' &&  pendingOrders.businessLogo !=''.isNotEmpty ? NetworkImage('https://squeeky.org/dashboard/businessfiles/${pendingOrders.businessLogo}') : null,
                                backgroundColor: const Color(0xFFD9D9D9),
                              ),
                        title: Text(pendingOrders.businessName, style: text17B,),
                        subtitle: Column(
                          children: [
                            Text("${pendingOrders.servicesOfferedList.length}"),

                          ],
                        ),
                      );
                  }          
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}