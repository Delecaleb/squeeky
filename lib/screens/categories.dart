import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/search.dart';
import 'package:squeeky/style/textstyles.dart';

class Categories extends StatelessWidget {
  Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              child: ListTile(
                onTap: ()=>Get.to(()=>Search()),
                leading: Icon(Icons.search_sharp),
                title: Text("Food, groceries, drinks, etc."),
              ),
            ),
            SizedBox(height: 20,),
            Text("Top categories", style: titleText,),
            SizedBox(height: 20,),
            GridView(
              shrinkWrap: true,
              gridDelegate : SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 150
              ),
              children: [
                ListTile(
                  title:Image.network(
                    'https://picsum.photos/250?image=1',
                    fit: BoxFit.cover,
                    width: Get.width * 0.3,
                    height: 100,
                  ),
                  subtitle: Text('Power Washing', style: text17L,),
                ),
                ListTile(
                  title:Image.network(
                  'https://picsum.photos/250?image=1',
                  fit: BoxFit.cover,
                  width: Get.width * 0.3,
                  height: 100,
                ),
                  subtitle: Text('Car Detailing', style: text17L,),
                ),
                ListTile(
                  title:Image.network(
                  'https://picsum.photos/250?image=1',
                  fit: BoxFit.cover,
                  width: Get.width * 0.3,
                  height: 100,
                ),
                  subtitle: Text('Deep Cleaning', style: text17L,),
                ),
                
            ],
            ),
          ],
        ),
      ),
    );
  }
}