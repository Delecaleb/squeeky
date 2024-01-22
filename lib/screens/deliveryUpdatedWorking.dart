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
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: [
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
          Row(
            children: [
              HomeScreenActionBtnWidget(image: 'assets/house.png', title: 'Deep cleaning', query: '',),
              HomeScreenActionBtnWidget(image: 'assets/car.png', title: 'Car Detailing', query: '',),
            ],
          ),
          Row(
            children: [
            HomeScreenActionBtnWidget(image: 'assets/wash.png', title: 'Pressure Washing', query: '',),
            Expanded(
              child: InkWell(
                  onTap: () => Get.to(() => ServicesScreen(query: '',)),
                  child: Text(
                    'Find Services',
                    style: text17B,
                  ),
                ),
            )
          ],
          ),
          
          Container(
            height: 600,
            child: Obx(
                  () {
            if (serviceController.businessCategories.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              print(serviceController.businessCategories.length);
              return ListView.builder(
                itemCount: serviceController.businessCategories.length,
                itemBuilder: (context, index) {
                  final category = serviceController.businessCategories[index];
                  return BizContainerWidget(
                            businessBanner: 'https://picsum.photos/250?image=1',
                            businessName: category.business_name,
                            bussinessDesc: "\$2.49 Delivery Fee 25-45 min",
                            businessRating: 4.2,
                            actionFunction: () =>
                                Get.to(() => StoreInformation(business: category,)),
                          );
                },
              );
            }
                  },
                ),
          ),
          SizedBox(
            height: 10,
          ),
        ]),
      ),
    );
  }


}
