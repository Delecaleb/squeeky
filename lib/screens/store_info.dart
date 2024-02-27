import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/models/business_model.dart';
import 'package:squeeky/screens/schedule_booking.dart';
import 'package:squeeky/style/textstyles.dart';
import 'package:squeeky/widgets.dart';

import '../controllers/add_favourites_controller.dart';
import '../controllers/services_controller.dart';

class StoreInformation extends StatelessWidget {
  BusinessModel business;
  StoreInformation({ required this.business, super.key});
  ServicesController serviceController = Get.put(ServicesController());
  FavouriteController favouriteController = FavouriteController();
final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    serviceController.getServices(business.id);
    return Scaffold(
      key: scaffoldKey,
       
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal:20, vertical: 25),
              decoration:  BoxDecoration(
                image: DecorationImage(image: NetworkImage('https://squeeky.org/dashboard/businessfiles/${business.imagePath}'),
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
                                          favouriteController.addFavourite(business.businessId);
                                          
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
            ),
        
            SingleChildScrollView(
              physics: ScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 20,),
              child: 
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text(business.business_name, style: text34B,),
      
                  ListTile(
                    minVerticalPadding: 0.0,
                    contentPadding: EdgeInsets.zero,
                      onTap: (){
                      scaffoldKey.currentState!.showBottomSheet((builder){
                            return Container(
                              height:  Get.height * 0.60,
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
                                     }, icon: Icon(Icons.cancel_presentation)
                                     ),
                                     SizedBox(height: 10,),
                                     Text(business.businessDesc,),
                                     SizedBox(height: 10,),
                                     ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Text("${business.businessAddress}"),
                                      subtitle: Text(business.businessCity),
                                      leading: Icon(Icons.location_on_sharp),
                                      trailing: Icon(Icons.filter_none_outlined),
                                     ),
                                     SizedBox(height: 10,),
                                     ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(business.businessAddress),
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
                    title: Text("${business.businessRating} (${business.businessRatingCount} ratings) ${business.businessDesc}",
                    maxLines: 1,
      
                    ),
                    subtitle: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Open until 11:00 PM"),
                        Text("Tap for hours, info and more")
                      ],
                    ),
                    trailing: Icon(Icons.chevron_right_outlined),
                  ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       PillBtn(subtitle: '25-45 min \$2.49', title: 'Arriving',),
                  //       SizedBox(width: 10,),
                  //       PillBtn(subtitle: '${business.businessRating} . ${business.businessRatingCount} ratings', title: 'Rating',),
                  //     ],
                  //   ),
                    SizedBox(height: 10,),
                    Text('Picked for you', style: text26,),
                  Obx(() {
                      if (serviceController.serviceLoading.value) {
                        return ShimmerLoader();
                      } else {
                        return serviceController.services.isEmpty
                            ? Center(
                                child: Text('No services found. Check Back'),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: serviceController.services.length,
                                itemBuilder: (context, index) {
                                  var serviceData = serviceController.services[index];
                             return Padding(
                               padding: const EdgeInsets.symmetric(vertical:8),
                               child: InkWell(
                                  onTap: ()=>Get.to(()=>ScheduleBooking(businessDetails: business,)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: Get.width *0.45,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(serviceData.serviceName, style: text18,),
                                            Text("\$ ${serviceData.servicePrice}"),
                                            Container(child: Text('water fed pole, purified RO water, No, home/gutter damage guaranteed, expireinced technicians '))
                                          ],
                                        ),
                                      ),
                                      Image.network(
                                            'https://squeeky.org/dashboard/businessfiles/${serviceData.imagePath}', 
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
                                },
                              );
                      }
                    }),
      
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}