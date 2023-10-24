import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/store_info.dart';
import 'package:squeeky/style/textstyles.dart';
import 'package:squeeky/widgets.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFEFECF0)
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
          title: TextField(
            
            autocorrect: true,
            autofocus: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 18),
              border: InputBorder.none,
              labelText: 'car washing, home cleaning, etc.',
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
              ),
          ),
        ), 
        preferredSize: Size.fromHeight(70),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Top Categories', style: titleText,),

            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: (){},
              leading: CircleAvatar(
                backgroundColor: Color(0xFFEFECF0),
                child: Icon(Icons.search),
              ),
              title: Text('Plumbing'),
            ),

            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: (){},
              leading: CircleAvatar(
                backgroundColor: Color(0xFFEFECF0),
                child: Icon(Icons.search),
              ),
              title: Text('Plumbing'),
            ),

            ListView(
              shrinkWrap: true,
              children: [
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
              ],
            )
            
          ],
        ),
      ),
    );
  }
}