import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/store_info.dart';
import 'package:squeeky/style/textstyles.dart';
import 'package:squeeky/widgets.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({Key? key}) : super(key: key);

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        ),
      body: SingleChildScrollView(
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
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Image.asset('assets/deal.png',width: 40),
                      SizedBox(height: 5,),
                      Text('Deal', style: text13,)
                    ],
                  ),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Image.asset('assets/rewards.png',width: 40),
                      SizedBox(height: 5,),
                      Text('Rewards', style: text13,)
                    ],
                  ),
                  
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Image.asset('assets/plumb.png',width: 40),
                      SizedBox(height: 5,),
                      Text('Plumbing', style: text13,)
                    ],
                  ),
                  SizedBox(width: 20,),
                  Column(
                    children: [
                      Image.asset('assets/lawn.png',width: 40),
                      SizedBox(height: 5,),
                      Text('Lawn Care', style: text13,)
                    ],
                  ),
                ],
              ),
            ),  
            // BizContainerWidget( 
            //   actionFunction: () => Get.to(()=>StoreInformation()),
            //   businessBanner: 'https://picsum.photos/250?image=1', 
            //   businessName: 'Deep Cleaning Business #1', 
            //   bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
            //   businessRating: 4.2
            // ),
            // SizedBox(height: 20,),
            // BizContainerWidget( 
            //   actionFunction: () => Get.to(()=>StoreInformation()),
            //   businessBanner: 'https://picsum.photos/250?image=1', 
            //   businessName: 'Deep Cleaning Business #1', 
            //   bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
            //   businessRating: 4.2
            // ),
            // SizedBox(height: 20,),
            // BizContainerWidget( 
            //   actionFunction: () => Get.to(()=>StoreInformation()),
            //   businessBanner: 'https://picsum.photos/250?image=1', 
            //   businessName: 'Deep Cleaning Business #1', 
            //   bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
            //   businessRating: 4.2
            // ),
            // SizedBox(height: 20,),
            // BizContainerWidget( 
            //   actionFunction: () => Get.to(()=>StoreInformation()),
            //   businessBanner: 'https://picsum.photos/250?image=1', 
            //   businessName: 'Deep Cleaning Business #1', 
            //   bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
            //   businessRating: 4.2
            // ),
            // SizedBox(height: 20,),
            // BizContainerWidget( 
            //   actionFunction: () => Get.to(()=>StoreInformation()),
            //   businessBanner: 'https://picsum.photos/250?image=1', 
            //   businessName: 'Deep Cleaning Business #1', 
            //   bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
            //   businessRating: 4.2
            // ),
            // SizedBox(height: 20,),
            // BizContainerWidget( 
            //   actionFunction: () => Get.to(()=>StoreInformation()),
            //   businessBanner: 'https://picsum.photos/250?image=1', 
            //   businessName: 'Deep Cleaning Business #1', 
            //   bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
            //   businessRating: 4.2
            // ),
            // SizedBox(height: 20,),
            // BizContainerWidget( 
            //   actionFunction: () => Get.to(()=>StoreInformation()),
            //   businessBanner: 'https://picsum.photos/250?image=1', 
            //   businessName: 'Deep Cleaning Business #1', 
            //   bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
            //   businessRating: 4.2
            // ),
            // SizedBox(height: 20,),
            // BizContainerWidget( 
            //   actionFunction: () => Get.to(()=>StoreInformation()),
            //   businessBanner: 'https://picsum.photos/250?image=1', 
            //   businessName: 'Deep Cleaning Business #1', 
            //   bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
            //   businessRating: 4.2
            // ),
            // SizedBox(height: 20,),
            // BizContainerWidget( 
            //   actionFunction: () => Get.to(()=>StoreInformation()),
            //   businessBanner: 'https://picsum.photos/250?image=1', 
            //   businessName: 'Deep Cleaning Business #1', 
            //   bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
            //   businessRating: 4.2
            // ),
            // SizedBox(height: 20,),
            // BizContainerWidget( 
            //   actionFunction: () => Get.to(()=>StoreInformation()),
            //   businessBanner: 'https://picsum.photos/250?image=1', 
            //   businessName: 'Deep Cleaning Business #1', 
            //   bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
            //   businessRating: 4.2
            // ),
            // SizedBox(height: 20,),
            // BizContainerWidget( 
            //   actionFunction: () => Get.to(()=>StoreInformation()),
            //   businessBanner: 'https://picsum.photos/250?image=1', 
            //   businessName: 'Deep Cleaning Business #1', 
            //   bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
            //   businessRating: 4.2
            // ),
            // SizedBox(height: 20,),
            // BizContainerWidget( 
            //   actionFunction: () => Get.to(()=>StoreInformation()),
            //   businessBanner: 'https://picsum.photos/250?image=1', 
            //   businessName: 'Deep Cleaning Business #1', 
            //   bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
            //   businessRating: 4.2
            // ),
            // SizedBox(height: 20,),
            // BizContainerWidget( 
            //   actionFunction: () => Get.to(()=>StoreInformation()),
            //   businessBanner: 'https://picsum.photos/250?image=1', 
            //   businessName: 'Deep Cleaning Business #1', 
            //   bussinessDesc: "\$2.49 Delivery Fee 25-45 min", 
            //   businessRating: 4.2
            // )
          
          ],
        ),
      ),
      );
  }
}

