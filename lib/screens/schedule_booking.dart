import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/controllers/cart_contrroller.dart';
import 'package:squeeky/screens/checkout_orderlist.dart';
import 'package:squeeky/style/textstyles.dart';
import 'package:squeeky/widgets.dart';

import '../controllers/services_controller.dart';
import '../models/business_model.dart';
import '../models/services_model.dart';

class ScheduleBooking extends StatelessWidget {

   BusinessModel businessDetails;

   ScheduleBooking({super.key, required this.businessDetails});
   
   ServicesController servicesOffered = Get.put(ServicesController());

   CartController cartController = Get.put(CartController());

final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    servicesOffered.getServices(businessDetails.businessId);
    return Scaffold(
      key: scaffoldKey,
       
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal:20, vertical: 25),
              decoration:  BoxDecoration(
                image: DecorationImage(image: NetworkImage('https://squeeky.org/dashboard/businessfiles/${businessDetails.imagePath}'),
                fit: BoxFit.cover
                ),
              ),
              width: Get.width,
              height: Get.height * 0.23,
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(child: IconButton( 
                      onPressed: ()=>Get.back(), 
                      icon: Icon(Icons.cancel_rounded),)),
                    
                    Row(
                      children: [
                        CircleAvatar(child: IconButton( onPressed: (){}, icon: Icon(Icons.search),)),
                        SizedBox(width: 10,),
                        CircleAvatar(
                          child: IconButton( 
                            onPressed: (){
                              showModalBottomSheet(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.zero
                                ),
                                context: context, 
                                builder: (builder){
                                  return const Column(
                                    children: [
                                      ListTile(
                                        leading: Icon(Icons.search),
                                        title: Text('Search this store'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.favorite_outline),
                                        title: Text('Add to favourite'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.ios_share_rounded),
                                        title: Text('Share'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.info_rounded),
                                        title: Text('Store info'),
                                        subtitle: Text('Address, ratings and more'),
                                      ),
                                    ],
                                  );
                                }
                              );
                            }, 
                            icon: Icon(Icons.more_horiz_sharp),
                            )
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
        
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20,),
              child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(businessDetails.business_name, style: text34B,),
      
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    minVerticalPadding: 0.0,
                      onTap: (){
                      scaffoldKey.currentState!.showBottomSheet((builder){
                            return Container(
                              height:  Get.height * 0.58,
                              width: Get.width,
                              color: Colors.white,
                              child: SingleChildScrollView(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                 child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     IconButton(
                                      alignment: AlignmentDirectional.centerStart,
                                      padding: EdgeInsets.zero,
                                      onPressed: (){
                                       Navigator.pop(context);
                                     }, icon: Icon(Icons.cancel_presentation)),
                                    //  Text(businessDetails.business_name, style: text34B,),
                                     SizedBox(height: 10,),
                                     Text(businessDetails.businessDesc,
                                     maxLines: 1,
                                     ),
                                     SizedBox(height: 10,),
                                     ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(businessDetails.businessAddress),
                                      subtitle: Text("${businessDetails.businessCity}, ${businessDetails.businessPostCode}"),
                                      leading: Icon(Icons.location_on_sharp),
                                      trailing: Icon(Icons.filter_none_outlined),
                                     ),
                                     SizedBox(height: 10,),
                                     ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(businessDetails.businessAddress),
                                      leading: Icon(Icons.access_time),
                                      trailing: Icon(Icons.add),
                                     ),
                                   ],
                                 )
                                ),
                            );
                        }
                      );
                    },
                    title: RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(child: Icon(Icons.star, color: Color(0xFF87CEEB),)),
                          TextSpan(
                              text: "${businessDetails.businessRating} (${businessDetails.businessRatingCount} ratings) ${businessDetails.businessDesc} ",
                              style: text15B
                          )
                        ],
                         
                       
                      ),
                    ),
                    subtitle: Text("Tap for hours, info and more"),
                    trailing: Icon(Icons.chevron_right_outlined),
                  ),
                  
                  SizedBox(height: 10,),
                  Text('Picked for you', style: text26,),
                  SizedBox(height: 15,),
                  Obx(() {
                    if( servicesOffered.serviceLoading.value){
                      return  ShimmerLoader();
                    }else if(servicesOffered.services.isEmpty){
                      return Text('No data found');
                    }else{
                      return  ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: servicesOffered.services.length,
                        itemBuilder: (BuildContext context, index){
                          final serviceData = servicesOffered.services[index];
                          return Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: InkWell(
                                onTap: ()async{
                                  cartController.businessId = serviceData.businessId ;
                                  cartController.serviceName = serviceData.serviceName;
                                  cartController.serviceId = serviceData.serviceId;
                                  cartController.servicePrice = serviceData.servicePrice;
                                  Get.to(()=>ContinueScheduling(serviceExtras: serviceData.extras, serviceData: serviceData,));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: Get.width *0.45,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(serviceData.serviceName, style: text17B,),
                                          Text("\$ ${serviceData.servicePrice}", style: text15L,),
                                          Container(child: Text(''))
                                        ],
                                      ),
                                    ),
                                    Image.network('https://squeeky.org/dashboard/businessfiles/${serviceData.imagePath}', 
                                          loadingBuilder: (context, child, loadingProgress) {
                                              if(loadingProgress == null){
                                                return child;
                                              }else{
                                                return Container(
                                                      width: Get.width *0.3,
                                                      child: LinearProgressIndicator(
                                                        value: loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!,
                                                      )
                                                );
                                              }
                                            },
                                          width: Get.width *0.3,
                                          height: 100,
                                          fit: BoxFit.cover,
                                          )
                                  ],
                                )
                                ),
                          );
                        }
                        );
                    }
                    }
                  ),
                  
                  // InkWell(
                  //   onTap: ()=>Get.to(()=>ContinueScheduling(serviceExtras: [], serviceData: [],)),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Container(
                  //         width: Get.width *0.45,
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Text("Window cleaning", style: textInfoBold,),
                  //             Text("\$20"),
                  //             Container(child: Text('water fed pole, purified RO water, No, home/gutter damage guaranteed, expireinced technicians '))
                  //           ],
                  //         ),
                  //       ),
                  //       Image.network('https://picsum.photos/250?image=1', width: Get.width *0.3,)
                  //     ],
                  //   )
                  //   ),        
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}







class ContinueScheduling extends StatefulWidget {
  List <ExtraModel> serviceExtras;
  ServicesModel serviceData;
  ContinueScheduling({super.key, required this.serviceExtras, required this.serviceData});

  @override
  State<ContinueScheduling> createState() => _ContinueSchedulingState();
}
class _ContinueSchedulingState extends State<ContinueScheduling> {
  CartController cartController = Get.put(CartController());
  String _propertySize= '0-300';
  String _materialType= 'Aluminium';
  String _timeOfArrival = '3:30PM - 4:00PM';
  final scaffoldKey2 = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey2,
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('https://squeeky.org/dashboard/businessfiles/${widget.serviceData.imagePath}', width: Get.width, fit: BoxFit.cover, height: Get.height*0.3,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:5, horizontal: 20),
              child: Text(widget.serviceData.serviceName, style:text26),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: Text("\$ ${widget.serviceData.servicePrice}", style:text20B),
            ),
            SizedBox(height:10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: Text('Power wash decks into beautiful spectacle that will leave your neighbours in awe!  '),
            ),
            const Divider(),
            const SizedBox(height: 20,),
            /// choosing size
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: Row(
                children: [
                  Expanded(child: Text("Choose ${widget.serviceData.extraCategory}", style: text21,)),
                  
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0XFFEFECF0)
                      ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Required', style: text15L,),
                    ),
                  )
                ],
              ),
            ),
            
            // / choosing size ends
             ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: widget.serviceExtras.length,
                  itemBuilder: (BuildContext context, index){
                    var extraDetails = widget.serviceExtras[index];
                    return RadioListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                  title: Text(extraDetails.extraName),
                  
                  value: extraDetails.extraName, 
                  groupValue: _materialType, 
                  onChanged: (value){
                    setState(() {
                      
                      _materialType = value !;
                      cartController.extraPrice = extraDetails.extraPrice;
                      cartController.extraValue = extraDetails.extraName;
                    });
                  },
                  secondary: Text("\$${extraDetails.extraPrice}",)
                );
                  }             
                ),
            /// choosing materials
            
            /// choosing timeframe
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)
                  ),
                  backgroundColor: Color(0xFF87CEEB)
                ),
                onPressed: (){
                  scaffoldKey2.currentState!.showBottomSheet(
                  (BuildContext context){
                      return StatefulBuilder(
                        builder: (BuildContext sheetContext, StateSetter setState) {
                          return Container(
                            color: Colors.white,
                            height: Get.height * 0.85,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                Text('Book a Time', style: text17B,),
                                SizedBox(height: 30,),
                                Row(
                                  children: [
                                    Expanded(child: Text("Choose an Arrival Time", style: text21,)),
                            
                                    Container(
                                      child: Text('Required'),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10,),
                                RadioListTile(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                                  title: Text('10:00AM - 10:30AM'),
                                  value: '10:00AM - 10:30AM', 
                                  groupValue: _timeOfArrival, 
                                  onChanged: (value){
                                        setState(() {
                                          cartController.timeArrival =value!;
                                          _timeOfArrival = value;
                                        });
                                      }
                                  ),
                                RadioListTile(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                                  title: Text('11:30AM - 12:00PM'),
                                  value: '11:30AM - 12:00PM', 
                                  groupValue: _timeOfArrival, 
                                  onChanged: (value){
                                        setState(() {
                                          _timeOfArrival = value!;
                                        });
                                      }
                                  ),
                                RadioListTile(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                                  title: Text('12:30PM - 1:00PM'),
                                  value: '12:30PM - 1:00PM', 
                                  groupValue: _timeOfArrival, 
                                  onChanged: (value){
                                        setState(() {
                                          _timeOfArrival = value!;
                                        });
                                      }
                                  ),
                                RadioListTile(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                                  title: Text('1:30PM - 2:00PM'),
                                  value: '1:30PM - 2:00PM', 
                                  groupValue: _timeOfArrival, 
                                  onChanged: (value){
                                        setState(() {
                                          _timeOfArrival = value!;
                                        });
                                      }
                                  ),
                                RadioListTile(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                                  title: Text('2:30PM - 3:00PM'),
                                  value: '2:30PM - 3:00PM', 
                                  groupValue: _timeOfArrival, 
                                  onChanged: (value){
                                        setState(() {
                                          _timeOfArrival = value!;
                                        });
                                      }
                                  ),
                                RadioListTile(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                                  title: Text('3:30PM - 4:00PM'),
                                  value: '3:30PM - 4:00PM', 
                                  groupValue: _timeOfArrival, 
                                  onChanged: (value){
                                        setState(() {
                                          _timeOfArrival = value!;
                                        });
                                      }
                                  ),
                  
                                  ElevatedButton(
                                    onPressed: (){
                                      cartController.addToOrders();
                                      Get.to(()=>OrderListScreen());
                                    
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size.fromHeight(60),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero
                                      ),
                                      backgroundColor: Color(0xFF87CEEB)
                                    ), 
                                    child: Text("Book", style: textBtn,),
                                  )
                                ],
                              ),
                            ),
                          );
                        }
                      );
                    }
                  );
                }, 
                child: Text('Continue', style: textBtn,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}