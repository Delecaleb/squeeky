import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:squeeky/models/order_check_out_model.dart';
import 'package:squeeky/screens/checkout.dart';
import 'package:squeeky/style/textstyles.dart';

import '../controllers/cart_contrroller.dart';
import '../widgets.dart';

class OrderListScreen extends StatefulWidget {
  @override
  _OrderListScreenState createState() => _OrderListScreenState();

}

class _OrderListScreenState extends State<OrderListScreen> {
  CartController cartController = Get.put(CartController());
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int itemCount = 1; // Initial quantity
  int subtotal = 0;
  int calculateSubtotal() {
    int subtotal = 0;

    for (var ordersData in cartController.ordersList) {
      int servicePrice = ordersData.servicePrice;
      subtotal += ordersData.quantity * servicePrice;
    }

    return subtotal;
  }

  @override
  void initState() {
    super.initState();
    cartController.getOrders();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Order List'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                  return cartController.isLoading.value ? ShimmerLoader() 
                  
                  : 
                  
                   ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: cartController.ordersList.length, // Replace with the number of order items you have
                    itemBuilder: (context, index) {
                      var ordersData = cartController.ordersList[index]; 
                      int servicePrice = ordersData.servicePrice;
                      subtotal += servicePrice; 
                      return Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  trailing: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "https://squeeky.org/dashboard/businessfiles/${ordersData.imagePath}",
                                      loadingBuilder: (context, child, loadingProgress) {
                                              if(loadingProgress == null){
                                                return child;
                                              }else{
                                                return Container(
                                                      width: Get.width *0.3,
                                                      // child: LinearProgressIndicator(
                                                      //   value: loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!,
                                                      // )
                                                );
                                              }
                                            },
                                    ),
                                  ),
                                  title: Text(ordersData.serviceName),
                                  subtitle: Text("Choice of ${ordersData.extraCategory}: ${ordersData.extraValue} \$${ordersData.extraPrice}"),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFEFECF0),
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Obx(() {
                                                  return IconButton(
                                                    icon: const Icon(Icons.remove, size: 15,),
                                                    onPressed: cartController.loadingQtyRm.value ? null : (){
                                                      cartController.decrementQuantity(ordersData.id);
                                                      setState(() {
                                                        if(ordersData.quantity > 1){
                                                          ordersData.quantity --;
                                                          //change current total price
                                                          ordersData.quantity * servicePrice;
                                                        }
                                                      });
                                                      
                                                    }
                                                  );
                                                }
                                              ),
                                              Text('${ordersData.quantity}', style: text14,),
                                              Obx(() {
                                                  return IconButton(
                                                    icon: const Icon(Icons.add, size: 15,),
                                                    onPressed: cartController.loadingQty.value ? null : (){
                                                      // update quatity in the server
                                                      cartController.incrementQuantity(ordersData.id);
                                                      setState(() {
                                                        ordersData.quantity ++;
                                                        //change current total price
                                                        ordersData.quantity * servicePrice;
                                                       
                                                      });
                                                    },
                                                  );
                                                }
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 15,),
                                        Obx(() {
                                            return ElevatedButton(
                                              onPressed: cartController.removeItemLoading.value
                                              // removing cart item with a dialogue box to continue or not
                                              ? null
                                              : () async {
                                                  bool confirmed = await showDialog(
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text('Delete Item'),
                                                        content: Text('Are you sure you want to delete this item?'),
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

                                                  if (confirmed != null && confirmed) {
                                                    // Remove the item from the list
                                                    cartController.removeItem(ordersData.id);

                                                    cartController.ordersList.removeAt(index);

                                                    // update the total
                                                    setState(() {
                                                      calculateSubtotal();
                                                    });
                                                  }
                                                },
                                              child: Text('Remove', style: text14,),
                                              style: ElevatedButton.styleFrom(
                                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                                backgroundColor: const Color(0xFFEFECF0),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(25),
                                                ),
                                              ),
                                            );
                                          }
                                        )
                                      ],
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(child: Text("\$${ordersData.quantity * servicePrice}", textAlign: TextAlign.end,))
                                  ],
                                ),
                              ],
                            ),
                          ),
                      );
                    },
                  );
                }
              ),
            ),
            
            ListTile(
              leading: const Icon(Icons.bookmark_border),
              title: const Text('Add promo code Popular'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: (){
                
                scaffoldKey.currentState!.showBottomSheet(
                  
                (BuildContext context){
                    return StatefulBuilder(
                      builder: (BuildContext sheetContext, StateSetter setState) {
                        return Container(
                          color: Colors.white,
                          height: Get.height,
                          width: Get.width,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.close), 
                                    onPressed: ()=>Navigator.pop(context),
                                    ),
                                  Text("Enter code"),
                                ],
                              ),
                              const Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.approval_outlined, size: 40,),
                                    const SizedBox(height: 25,),
                                    const Text('Get your first promotion code'),
                                    SizedBox(height: 25,),
                                    const Text('Invite a friend and save xyz on your first order')
                                  ],
                                )
                                ),
                              
                              ElevatedButton(onPressed: ()=>Share.share("Hey there! I just discovered this amazing business on Squeeky that offers ${cartController.serviceName}. I've had a fantastic experience, and I thought you might find it useful too. Check it out on Squeeky!", subject:'Join squeeky'), child: Text('Invite a friend')),
                              SizedBox(height: Get.height *0.15,)
                            ],
                          ),
                        );
                      }
                    );
                  }
                );
              
              },
            ),
            ListTile(
              leading: Text("Subtotal", style: text21,),
              trailing: Text("\$${calculateSubtotal()}", style: text21,),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: TextButton(
                onPressed: ()=>Get.to(()=>CheckOutScreen(services: cartController.ordersList, subtotal: calculateSubtotal(), )),
                child: Text('Go to checkout', style: btnBoldLight,),
                style: TextButton.styleFrom(
                  minimumSize: const Size.fromHeight(60),
                  backgroundColor: const Color(0xFF87CEEB),
                  shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero
                  ),
                ),
              ),
            )
          ],
        ),
    );
  }
}
