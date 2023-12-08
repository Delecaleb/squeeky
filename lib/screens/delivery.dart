import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/models/business_category.dart';
import 'package:squeeky/screens/custom.dart';
import 'package:squeeky/screens/search_screen.dart';
import 'package:squeeky/screens/services.dart';
import 'package:squeeky/screens/store_info.dart';
import 'package:squeeky/style/textstyles.dart';
import 'package:squeeky/widgets.dart';

import '../controllers/business_controllers.dart';

class Delivery extends StatelessWidget {
  Delivery({Key? key}) : super(key: key);

  final BusinessController serviceController = Get.put(BusinessController());

  TextEditingController searchController = TextEditingController();

  // late Future<List<BusinessCategory>> dummyServicePro;

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Delivery'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Schedule'),
                )
              ],
            ),
            Text(
              'Now 200 Lonsdale Rd, Toronto',
              style: textInfoBold,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFEFECF0),
                borderRadius: BorderRadius.circular(40)),
            child: ListTile(
              onTap: () => Get.to(() => SearchScreen()),
              leading: Icon(Icons.search),
              title: Text("What job ?"),
              subtitle: Text('Any job . Any day'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                mainAxisExtent: Get.width * 0.20),
            shrinkWrap: true,
            children: [
              Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Color(0xFFF7F4F8),
                      borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    onTap: () => Get.to(() => CustomScreen()),
                    trailing: Image.asset(
                      'assets/house.png',
                      fit: BoxFit.cover,
                      width: (Get.width * 0.2) / 3,
                    ),
                    title: Text(
                      'Deep cleaning',
                      style: text17B,
                    ),
                  )),
              Container(
                  // padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Color(0xFFF7F4F8),
                      borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    onTap: () => Get.to(() => ServicesScreen()),
                    trailing: Image.asset(
                      'assets/car.png',
                      fit: BoxFit.cover,
                      width: (Get.width * 0.2) / 3,
                    ),
                    title: Text(
                      'Car Detailing',
                      style: text17B,
                    ),
                  )),
              Container(
                  // padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Color(0xFFF7F4F8),
                      borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    onTap: () => Get.to(() => ServicesScreen()),
                    trailing: Image.asset(
                      'assets/wash.png',
                      fit: BoxFit.cover,
                      width: (Get.width * 0.2) / 3,
                    ),
                    title: Text(
                      'Pressure Washing',
                      style: text17B,
                    ),
                  )),
              ListTile(
                onTap: () => Get.to(() => ServicesScreen()),
                title: Text(
                  'Find Services',
                  style: text17B,
                ),
              )
            ],
          ),
          
          SizedBox(height: 20,),
          Divider(
            thickness: 5,
          ),
          SizedBox(
            height: 10,
          ),

          Obx(
                () {
          if (serviceController.businessCategories.isEmpty) {
            return Center(
              child: ShimmerLoader(),
            );
          } else {
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
              itemCount: serviceController.businessCategories.length,
              itemBuilder: (context, index) {
                final category = serviceController.businessCategories[index];
                return BizContainerWidget(
                          businessBanner: 'https://learncrib.com.ng/squeeky/dashboard/businessfiles/${category.imagePath}',
                          businessName: category.business_name,
                          bussinessDesc: category.businessDesc,
                          businessRating: 4,
                          actionFunction: () =>
                              Get.to(() => StoreInformation(business: category,)),
                        );
              },
            );
          } 
                },
              ),
          SizedBox(
            height: 10,
          ),
          
        ]),
      ),
    );
  }


}
