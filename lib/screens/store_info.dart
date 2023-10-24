import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/models/business_model.dart';
import 'package:squeeky/style/textstyles.dart';
import 'package:squeeky/widgets.dart';

import '../controllers/services_controller.dart';

class StoreInformation extends StatelessWidget {
  BusinessModel business;
  StoreInformation({ required this.business, super.key});
  ServicesController serviceController = Get.put(ServicesController());
  
final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    serviceController.getServices(business.id);
    return Scaffold(
      key: scaffoldKey,
       
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal:20, vertical: 25),
            decoration: const BoxDecoration(
              image: DecorationImage(image: NetworkImage('https://picsum.photos/250?image=1'),
              fit: BoxFit.cover
              ),
            ),
            width: Get.width,
            height: Get.height * 0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(child: IconButton( 
                  onPressed: ()=>Navigator.pop(context), 
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
                              return Column(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.search),
                                    title: Text('Search this store'),
                                  ),
                                  ListTile(
                                    onTap: () {
                                      Get.snackbar(
                                        '', 
                                        '',
                                        titleText: Row(
                                          children: [
                                              Icon(Icons.favorite, color: Colors.white),
                                              SizedBox(width: 10,),
                                              Text('Add to favourites', style: TextStyle(color: Colors.white),),
                                          ],
                                        ),
                                        backgroundColor: Color(0xFF201D21)
                                      );
                                    },
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
      
          SingleChildScrollView(
            physics: ScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 20,),
            child: 
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(business.categoryName, style: titleText,),

                ListTile(
                  contentPadding: EdgeInsets.zero,
                    onTap: (){
                    scaffoldKey.currentState!.showBottomSheet((builder){
                          return Container(
                            height:  Get.height * 0.98,
                            width: Get.width,
                            color: Colors.white,
                            child: SingleChildScrollView(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                               child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   IconButton(onPressed: (){
                                     Navigator.pop(context);
                                   }, icon: Icon(Icons.cancel)),
                                   Text('Lawn Care Service', style: titleText,),
                                   SizedBox(height: 10,),
                                   Text('Edging Standard Trim Full Package Pruning'),
                                   SizedBox(height: 10,),
                                   ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text("107 Broadwater Street East"),
                                    subtitle: Text("Worthing, EMEA BN14 9AW"),
                                    leading: Icon(Icons.location_on_sharp),
                                    trailing: Icon(Icons.filter_none_outlined),
                                   ),
                                   SizedBox(height: 10,),
                                   ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text("107 Broadwater Street East"),
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
                  title: Text('Lawn Maintenance.\$.'),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Open until 11:00 PM"),
                      Text("Tap for hours, info and more")
                    ],
                  ),
                  trailing: Icon(Icons.chevron_right_outlined),
                ),
                Obx(() => serviceController.serviceLoading.value ? CircularProgressIndicator() :
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                  itemCount: serviceController.services.length,
                  itemBuilder: (context, index){
                    var serviceData = serviceController.services[index];
                    return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(serviceData.serviceName),
                        subtitle: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('£ ${serviceData.servicePrice.toString()}'),
                            Text('Trims grass edges for a neat lawn appearance.')
                          ],
                        )
                      );
                  }                  
                ),
                               
                )
                
              ],
            ),
            // Column(
              // crossAxisAlignment: CrossAxisAlignment.start,  
              // children: [
                // Text('Lawn Care Service', ),
                // ListTile(
                //   contentPadding: EdgeInsets.zero,
                //   onTap: (){
                //     showBottomSheet(
                //       context: context, 
                //       builder: (builder){
                //           return Container(
                //             height: 400,
                //             color: Colors.amber,
                //             child: Text('wao'),
                //           );
                //       }
                //     );
                //   },
                //   title: Text('Lawn Maintenance.\$.'),
                //   subtitle: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text("Open until 11:00 PM"),
                //       Text("Tap for hours, info and more")
                //     ],
                //   ),
                //   trailing: Icon(Icons.chevron_right_outlined),
                // ),
                // SizedBox(height: 20,),
                // Text('Picked for you', style: titleText,),
                // SizedBox(height: 20,),
                // ListTile(
                //   contentPadding: EdgeInsets.zero,
                //   title: Text("Edging"),
                //   subtitle: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text('£6.99'),
                //       Text('Trims grass edges for a neat lawn appearance.')
                //     ],
                //   )
                // ),
          
                // ListTile(
                //   contentPadding: EdgeInsets.zero,
                //   title: Text("Standard Trim"),
                //   subtitle: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text('£6.99'),
                //       Text('Regular trim of grass to keep it an even height')
                //     ],
                //   )
                // ),
                
                // ListTile(
                //   contentPadding: EdgeInsets.zero,
                //   title: Text("Full Package"),
                //   subtitle: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text('£7.49'),
                //       Text('Mowing, edging and trim.')
                //     ],
                //   )
                // ),
             
              // ],
            // ),
          ),
        ],
      ),
    );
  }
}