import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:squeeky/screens/pay_screen.dart';
import 'package:squeeky/screens/placing_order.dart';
import 'package:squeeky/style/textstyles.dart';

import '../providers/api_data_provider.dart';

class CheckOutScreen extends StatefulWidget {
  List services;
  int subtotal;
  CheckOutScreen({super.key, required this.services, required this.subtotal});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

final box = GetStorage(); 
class _CheckOutScreenState extends State<CheckOutScreen> {
  List<dynamic> businessData = [];
  final apiHandler = ApiDataProvider();

  var userId = box.read('userPhone');
  @override
  void initState() {
    super.initState();
    apiHandler.fetchCheckOut(userId).then((data) {
      setState(() {
        businessData = data;
      });

      print(businessData);
    }).catchError((error) {
      print("Error fetching data: $error");
    });
  }
  final scaffoldKey = GlobalKey <ScaffoldState>();
 bool getInvoice = false;
  @override
  Widget build(BuildContext context) {
  
    double serviceCharge = widget.subtotal * 0.1;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
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
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Text('Order details')
                                  ],
                                ),
                                
                                const TextField(
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search),
                                    labelText: 'Enter a new location',
                                    border: InputBorder.none,
                                    focusColor: Color(0xFFEFECF0),
                                    fillColor: Color(0xFFEFECF0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.black,)
                                    ),
                                    filled: true,
                                  ),
                                ),
                                SizedBox(height: 15,),
                                Text('Nearby', style: text15B,),
                                SizedBox(height: 15,),
                                ListTile(
                                  // contentPadding: EdgeInsets.zero,
                                  leading: Icon(Icons.location_on_outlined),
                                  title: Text('Current location', style: text16,),
                                  subtitle: Text('200 Lonsdale Rd, Toronto, ON M4V 1W6'),
                                ),
                                Divider(),
                                Text('Recent locations', style: text15B,),
                                SizedBox(height: 15,),
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
                                ListTile(
                                  // contentPadding: EdgeInsets.zero,
                                  title: Text('Saved Places', style: text17L,),
                                  trailing: Icon(Icons.arrow_forward_ios_sharp, size: 15, ),
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
                  businessData.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                    :
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: businessData.length,
                    itemBuilder: (context, index){
                       var businessDetails = businessData[index];
                      
                        return ExpansionTile(
                          tilePadding: EdgeInsets.zero,
                          leading: CircleAvatar(),
                          title: Text(businessDetails["business_name"], style: text17B,),
                          subtitle: Text(" ${businessDetails["services"].length.toString()} item(s)"),
                          children: businessDetails["services"].map<Widget>((service) {
                              return Text(
                                  "${service["service_name"]} - \$${service["price"]}");
                            }).toList(),
                        );
                    }
                  ),
                  // ExpansionTile(
                  //   tilePadding: EdgeInsets.zero,
                  //   leading: CircleAvatar(),
                  //   title: Text('Power Washing Business', style: text17B,),
                  //   subtitle: Text('2 items'),
                  //   children: [
                  //     Text('This is the service')
                  //   ],
                  // ),

                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemCount: widget.services.length,
                  //   itemBuilder: (context, index){
                  //     var services =  widget.services[index];
                  //     return Text(services.serviceName);
                  //   }
                  //   ),

                  // GroupedListView(
                  //   elements: widget.services, 
                  //   shrinkWrap: true,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   groupBy: (services)=>Text('widget.services[1]'),
                  //   groupHeaderBuilder: (services)=>SizedBox(),
                  //   itemBuilder: (context, index){
                  //     return ListTile(
                  //   contentPadding: EdgeInsets.zero,
                  //   leading: Icon(Icons.bookmark),
                  //   title: Text('Add promo code', style: text16,),
                  //   trailing: Icon(Icons.arrow_forward_ios, size: 15,),
                  // );
                  //   },
                  // ),

                  Divider(),

                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.bookmark),
                    title: Text('Add promo code', style: text16,),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15,),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal'),
                      Text('\$${widget.subtotal}'),
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
                      Text('\$$serviceCharge'),
                    ],
                  ),
          
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: text21,),
                      Text('\$${widget.subtotal + serviceCharge}', style: titleText,),
                    ],
                  ),

                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(Icons.local_offer),
                    title: Text('\$0.0 credits', style: text16,),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15,),
                  ),
                  Divider(),
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
            onPressed: ()=>Get.to(()=>PaymentScreen(userId: userId,)),
            child: Text('Next \$ ${widget.subtotal + serviceCharge}', style: titleText,),
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero
              ),
              minimumSize: const Size.fromHeight(60),
              backgroundColor: const Color(0xFF87CEEB),
            ),
          )
        ],
      ),
    );
  }
}