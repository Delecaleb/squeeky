import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/placing_order.dart';
import 'package:squeeky/style/textstyles.dart';

class CheckOutScreen extends StatefulWidget {
  CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final scaffoldKey = GlobalKey <ScaffoldState>();
 bool getInvoice = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(''),
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Checkout', style: text34, textAlign: TextAlign.left,),
          
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.location_on, color: Colors.black,),
                    title: Text('Home', style: text16,),
                    subtitle: Text('Smallfield Avenue & Dolcombe Avenue,179, Brixton, London, England,SW9'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15,),
                    onTap: (){
                      scaffoldKey.currentState!.showBottomSheet((context){
                          return Container(
                            color: Colors.white,
                            height: Get.height,
                            width: Get.width,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('Order details')
                                  ],
                                ),
                                Text('Nearby'),
          
                                ListTile(
                                  // contentPadding: EdgeInsets.zero,
                                  leading: Icon(Icons.location_on_outlined),
                                  title: Text('Current location', style: text16,),
                                  subtitle: Text('200 Lonsdale Rd, Toronto, ON M4V 1W6'),
                                ),
          
                                Text('Recent locations'),
                                
                                Container(
                                  color: Color(0xFFF7F4F8),
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  child: ListTile(
                                    // contentPadding: EdgeInsets.zero,
                                    leading: Icon(Icons.location_on_outlined),
                                    title: Text('Current location', style: text16,),
                                    subtitle: Text('200 Lonsdale Rd, Toronto, ON M4V 1W6'),
                                    trailing: CircleAvatar(child: Icon(Icons.edit)),
                                  ),
                                ),
                              ],
                            ),
                          );
                      } );
                    },
                  ),
                  Divider(
                    indent: Get.width*0.1,
                    color: Colors.grey,
                    thickness:0.5,

                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.person),
                    title: Text('Meet at the door', style: text16,),
                    subtitle: Text('Add delivery note'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15,),
                  ),
                  Divider(
                    indent: Get.width*0.1,
                    color: Colors.grey,
                    thickness:0.5,

                  ),
                  SizedBox(height: 25,),
                  Text('Delivery option', style: text21,),
                  SizedBox(height: 25,),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    
                    child: ListTile(
                      leading: Icon(Icons.delivery_dining_outlined),
                      title: Text('Standard', style: text17B,),
                      subtitle: Text('22/01/2023'),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Selected Services', style: text21,),

                      TextButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFFEFECF0),
                        ),
                        onPressed: (){}, 
                        icon: Icon(Icons.add, color: Color(0xFF87CEEB),), 
                        label: Text('Add items', style: text14,),
                        
                      )
                    ],
                  ),
                  ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    leading: CircleAvatar(),
                    title: Text('Power Washing Business', style: text17B,),
                    subtitle: Text('2'),
                    children: [
                      Text('This is the service')
                    ],
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.bookmark),
                    title: Text('Add promo code', style: text16,),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15,),
                  ),
          
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal'),
                      Text('\$600'),
                    ],
                  ),
                  Row(
                    
                    children: [
                      Text('Fees'),
                      Icon(Icons.help, size: 15, color: Color(0xFFB1B1B1),),
                    ],
                  ),
          
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Service'),
                      Text('\$60'),
                    ],
                  ),
          
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: text21,),
                      Text('\$660', style: titleText,),
                    ],
                  ),

                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.local_offer),
                    title: Text('\$0.0 credits', style: text16,),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15,),
                  ),
                  ListTile(
                    
                    leading: Checkbox(
                      value: getInvoice, 
                      onChanged: (bool ? value){
                        setState(() {
                          getInvoice = value!;
                        });
                    }),
                    title: Text('Request invoice', style: text16,),
                    subtitle: Text('Add tax details'),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15,),
                  ),
                ],
              ),
            ),
          ),
          TextButton(
                    onPressed: ()=>Get.to(()=>PlacingOrderSreen()),
                    child: Text('Next \$xyx', style: titleText,),
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(60),
                      backgroundColor: const Color(0xFF87CEEB),
                    ),
                  )
        ],
      ),
    );
  }
}