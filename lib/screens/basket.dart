import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:squeeky/controllers/cart_contrroller.dart';
import 'package:squeeky/screens/checkout.dart';
import 'package:squeeky/screens/pending_order.dart';
import 'package:squeeky/widgets.dart';

import '../controllers/business_controllers.dart';
import '../style/textstyles.dart';

class Basket extends StatefulWidget {
  
  Basket({super.key});

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  CartController cartController = Get.put(CartController());
  BusinessController businessController = Get.find();

  @override
  void initState() {
    super.initState();
    cartController.getOrders();
  }

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
  Widget build(BuildContext context) {
    return  Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Order List'),

          actions: [
            ElevatedButton.icon(
              onPressed: ()=>Get.to(()=>PendingOrdersList()),
              icon: Icon(Icons.pending_actions),
              label: Text('Pending Orders', style: text15B,)
              )
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(() {
                  if(cartController.isLoading.value){
                    return  ShimmerLoader(); 
                  }else if(cartController.ordersList.isEmpty){
                    return Container(
                      width: Get.width,
                      height: Get.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/cart.png"),
                          SizedBox(height: 20,),
                          Text("Empty Basket", style: text18,),
                        ],
                      ),
                    );
                  }                  
                  else{
                    return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: cartController.ordersList.length, 
                    itemBuilder: (context, index) {
                      var ordersData = cartController.ordersList[index]; 
                      int servicePrice = ordersData.servicePrice;
                      subtotal += servicePrice; 
                      return Dismissible(
                        key: Key(ordersData.hashCode.toString()),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red[900],
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) {
                        
                      },
                      
                      confirmDismiss: (direction) async {
                          if (direction == DismissDirection.startToEnd) {
                            // Show a confirmation dialog
                            return await showDialog(
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
                          }
                          return false;
                          },
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  trailing: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network("https://squeeky.org/dashboard/businessfiles/${ordersData.imagePath}"),
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
                        ),
                      );
                    },
                  );  
                  }
                   
                }
              ),
            ),
            
            Obx(() {
                return !cartController.isLoading.value && !cartController.ordersList.isEmpty ? ListTile(
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
                                        SizedBox(height: 25,),
                                        Text('Get your first promotion code'),
                                        SizedBox(height: 25,),
                                        Text('Invite a friend and save xyz on your first order')
                                      ],
                                    )
                                    ),
                                  
                                  ElevatedButton(onPressed: ()=>Share.share("Hey there! I just discovered this amazing business on Squeeky that offers ${cartController.serviceName}. I've had a fantastic experience, and I thought you might find it useful too. Check it out on Squeeky!", subject:'Join Squeeky'), child: Text('Invite a friend')),
                                  SizedBox(height: Get.height *0.15,)
                                ],
                              ),
                            );
                          }
                        );
                      }
                    );
                  
                  },
                ):
                Container();
              }
            ),
            
            Obx(() {
                return !cartController.isLoading.value && !cartController.ordersList.isEmpty ? ListTile(
                  leading: Text("Subtotal", style: text21,),
                  trailing: Text("\$${calculateSubtotal()}", style: text21,),
                ):
                Text('');
              }
            ),
            Obx(() {
                return !cartController.isLoading.value && !cartController.ordersList.isEmpty ? TextButton(
                  onPressed: ()=>Get.to(()=>CheckOutScreen(services: cartController.ordersList, subtotal: calculateSubtotal(), )),
                  child: Text('Go to checkout', style: btnBoldLight,),
                  style: TextButton.styleFrom(
                    minimumSize: const Size.fromHeight(60),
                    backgroundColor: const Color(0xFF87CEEB),
                  ),
                ):
                Text('');
              }
            ),
            ]
          
        ),
    );
  }
}