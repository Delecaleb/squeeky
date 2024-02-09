import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/controllers/pending_orders_controller.dart';
import 'package:squeeky/style/textstyles.dart';
import 'package:intl/intl.dart';

class PendingOrdersList extends StatefulWidget {
  PendingOrdersList({super.key});

  @override
  State<PendingOrdersList> createState() => _PendingOrdersListState();
}

class _PendingOrdersListState extends State<PendingOrdersList> {
  PendingOrdersController pendingOrderController = Get.put(PendingOrdersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
            // ElevatedButton.icon(
            //   onPressed: null,
            //   icon: Icon(Icons.file_open),
            //   label: Text('Orders', style: text15B,)
            //   )
          // ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recently added', style: text21,),    
            Obx(() {
               if(pendingOrderController.isloading.value){
                return Container(
                  height: Get.height,
                  width: Get.width,
                  child: Center(child: Text('Loading...'))
                  );            
            }else{
            return pendingOrderController.pendingOrders.isEmpty ? 
            Container(
              height: Get.height,
              width: Get.width,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                  Image.asset('assets/tool.jpg'),
                  SizedBox(height: 20,),
                  Text('No orders yet')
                ],
              ),
            )
            :
            ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: pendingOrderController.pendingOrders.length,
                  itemBuilder:   (BuildContext, index){
                      var pendingOrders = pendingOrderController.pendingOrders[index];
                      DateTime rawDate = DateTime.parse(pendingOrders.date.toString());
                      var formatedDate = DateFormat("d MMM, yyyy").format(rawDate);
                      // print(pendingOrders.businessLogo);
                      return Column(
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,

                            leading: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: pendingOrders.serviceImage !='' &&  pendingOrders.serviceImage.isNotEmpty  &&  pendingOrders.serviceImage != null ? NetworkImage('https://squeeky.org/dashboard/businessfiles/${pendingOrders.serviceImage}') : null,
                                    backgroundColor: const Color(0xFFD9D9D9),
                                  ),
                            trailing: IconButton(
                                onPressed: ()async{
                                  var confirmed = await showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: Text('Cancel order'),
                                                            content: Text('Are you sure you want to cancel this order?'),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                onPressed: () {
                                                                  // Dismiss the dialog and confirm deletion
                                                                  Navigator.of(context).pop(true);
                                                                },
                                                                child: Text('Yes'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () {
                                                                  // Dismiss the dialog and cancel deletion
                                                                  Navigator.of(context).pop(false);
                                                                },
                                                                child: Text('No'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                  // action to cancel the order
                                  if (confirmed != null && confirmed){
                                      // Remove the item from the list
                                       await pendingOrderController.cancelOrder(pendingOrders.serviceId).then((respose){
                                      
                                      setState(() {
                                        pendingOrders.status = respose['massage'];
                                      });
                                      });
                                      
                                    }
                                },
                                icon: Icon(Icons.cancel),
                                // label: Text('Cancel', style: text14,)
                                  ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(pendingOrders.businessName, style: text17B,),
                                  Text("${pendingOrders.serviceName} (${pendingOrders.status})", style: text15L,),
                                  Text("\$${pendingOrders.serviceTotal}", style: text15L,),
                                ],
                            ),
                            subtitle: Text(formatedDate),
                           
                          ),

                          Divider(
          color: const Color.fromARGB(255, 200, 200, 200), // Adjust the color as needed
          height: 2.5, // Adjust the height as needed
          thickness: 0.5, // Adjust the thickness as needed
        ),
                        ],
                      );
                  }          
                );
            }
              }
            ),
          ],
        ),
      ),
    );
  }
}