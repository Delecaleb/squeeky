import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/store_info.dart';
import 'package:squeeky/style/textstyles.dart';
import 'package:squeeky/widgets.dart';

import '../controllers/business_controllers.dart';

class ServicesScreen extends StatefulWidget {
  String query; 
  ServicesScreen({Key? key, required this.query}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  BusinessController businessController = Get.put(BusinessController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    businessController.fetchBusinessBaseOnInput(widget.query);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Services', style: text34,),
            Container(
              height: Get.height *0.1,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Image.asset('assets/car.png',width: 40,),
                      SizedBox(height: 5,),
                      Text('Car Detailing', style: text13,)
                    ],
                  ),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Image.asset('assets/house.png', width: 40,),
                      SizedBox(height: 5,),
                      Container(child: Text('House Cleaning', style: text13,),)
                    ],
                  ),
                  SizedBox(width: 20,),
                        Column(
                          children: [
                            Image.asset('assets/wash.png',width: 40),
                            SizedBox(height: 5,),
                            Text('Power Washing', style: text13,)
                          ],
                        ),
                  // SizedBox(width: 20,),
                  // Column(
                  //   children: [
                  //     Image.asset('assets/deal.png',width: 40),
                  //     SizedBox(height: 5,),
                  //     Text('Deal', style: text13,)
                  //   ],
                  // ),
                  // SizedBox(width: 20,),
                  // Column(
                  //   children: [
                  //     Image.asset('assets/rewards.png',width: 40),
                  //     SizedBox(height: 5,),
                  //     Text('Rewards', style: text13,)
                  //   ],
                  // ),
                  
                  // SizedBox(width: 20,),
                  // Column(
                  //   children: [
                  //     Image.asset('assets/plumb.png',width: 40),
                  //     SizedBox(height: 5,),
                  //     Text('Plumbing', style: text13,)
                  //   ],
                  // ),
                  // SizedBox(width: 20,),
                  // Column(
                  //   children: [
                  //     Image.asset('assets/lawn.png',width: 40),
                  //     SizedBox(height: 5,),
                  //     Text('Lawn Care', style: text13,)
                  //   ],
                  // ),
                ],
              ),
            ),  
            
            Obx(() {
              if(businessController.isloading.value){
                return ShimmerLoader();
              }else{
                if(businessController.businessSearchResult.isEmpty){
                  return Container(
                    child: Text('No service Available'),
                  );
                }else
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: businessController.businessSearchResult.length, // Replace with your actual list size
                itemBuilder: (BuildContext context, int index) {
                    var businessData = businessController.businessSearchResult[index];
                    return BizContainerWidget(
                          businessBanner: 'https://squeeky.org/dashboard/businessfiles/${businessData.imagePath}',
                          businessName: businessData.business_name,
                          bussinessDesc: businessData.businessDesc,
                          businessRating: 4,
                          actionFunction: () =>
                              Get.to(() => StoreInformation(business: businessData,)),
                        );
                  },
                
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

