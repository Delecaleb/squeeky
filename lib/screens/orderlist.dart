import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/checkout.dart';
import 'package:squeeky/style/textstyles.dart';

class OrderListScreen extends StatefulWidget {
  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int itemCount = 1; // Initial quantity

  void incrementItem() {
    setState(() {
      itemCount++;
    });
  }

  void decrementItem() {
    if (itemCount > 1) {
      setState(() {
        itemCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Order List'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: 3, // Replace with the number of order items you have
                itemBuilder: (context, index) {
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
                              child: Image.network('https://picsum.photos/250?image=1'),
                            ),
                            title: const Text('Item Title'),
                            subtitle: const Text('Item Subtitle'),
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
                                        IconButton(
                                          icon: const Icon(Icons.remove, size: 15,),
                                          onPressed: decrementItem,
                                        ),
                                        Text('$itemCount', style: text14,),
                                        IconButton(
                                          icon: const Icon(Icons.add, size: 15,),
                                          onPressed: incrementItem,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 15,),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text('Remove', style: text14,),
                                    style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.all(20),
                                      backgroundColor: const Color(0xFFEFECF0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              const Text('\$60')
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
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
                               Expanded(
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
                              
                              ElevatedButton(onPressed: (){}, child: Text('Invite a friend')),
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
              trailing: Text("\$2300", style: text21,),
            ),
            TextButton(
              onPressed: ()=>Get.to(()=>CheckOutScreen()),
              child: Text('Go to checkout', style: btnBoldLight,),
              style: TextButton.styleFrom(
                minimumSize: const Size.fromHeight(60),
                backgroundColor: const Color(0xFF87CEEB),
              ),
            )
          ],
        ),
      ),
    );
  }
}
