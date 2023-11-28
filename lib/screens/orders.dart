import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/controllers/cart_contrroller.dart';
import 'package:squeeky/screens/orders_list.dart';
import 'package:squeeky/widgets.dart';

import '../style/textstyles.dart';

class Orders extends StatelessWidget {
  
  Orders({super.key});
  
  CartController cartController = Get.put(CartController());
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [ElevatedButton.icon(
                    onPressed:  ()=>Get.to(()=>OrderLists()), 
                    icon: Icon(Icons.line_style_rounded), 
                    label: Text('Orders')
                  ),
                  ]
        ),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Obx(() {
              if(cartController.ordersList.isNotEmpty){
                return  ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cartController.ordersList.length,
                itemBuilder: (context, index){
                  var orderlistItem = cartController.ordersList[index];
                  return InkWell(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(orderlistItem.serviceName, style: text17B,),
      
                                    Text("Choice of ${orderlistItem.extraCategory} ${orderlistItem.extraValue}")
                                  ],
                                )),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Image.network('https://learncrib.com.ng/squeeky/dashboard/businessfiles/${orderlistItem.imagePath}', width: Get.width*0.2,)
                                  ],
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      
                                     Container(
                                      decoration: BoxDecoration(
                                      color: const Color(0xFFEFECF0),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                       child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            IconButton(
                                              icon: const Icon(Icons.remove, size: 15,),
                                              onPressed: null,
                                            ),
                                            Text('1', style: text14,),
                                            IconButton(
                                              icon: const Icon(Icons.add, size: 15,),
                                              onPressed: null,
                                            ),
                                          ],
                                        ),
                                     ),
                                    const SizedBox(width: 15,),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text('Remove', style: text14,),
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 17),
                                        backgroundColor: const Color(0xFFEFECF0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                      ),
                                    )
                                    ],
                                  )                              
                                ),
                                Text("\$ ${orderlistItem.servicePrice}", style: text17B,)
                              ],
                            ),
                            Divider(),
                          ],
                        ),
                        
                      ),
                  );
                }
              );
              }else{
              return EmptyBasket();
              }
            }
          ),
        ),
      ),
    );
  }
}