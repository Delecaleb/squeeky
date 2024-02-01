import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/search.dart';
import 'package:squeeky/style/textstyles.dart';
import 'package:squeeky/widgets.dart';

class Categories extends StatelessWidget {
  Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
              physics: NeverScrollableScrollPhysics(),
              gridDelegate : SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                mainAxisExtent: 150
              ),
              children: [
                Container(
                  decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 225, 224, 224)
                    )
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      children: [
                        Image.asset(
                            'assets/Rec113.png',
                            fit: BoxFit.cover,
                            height: 100,
                          ),
                          SizedBox(height: 10,),
                         Text('Power Washing', style: text17L,),
                         SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 225, 224, 224)
                    )
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Column(
                      children: [
                        Image.asset(
                            'assets/Rec114.png',
                            fit: BoxFit.cover,
                            height: 100,
                          ),
                          SizedBox(height: 10,),
                         Text('Car Detailing', style: text17L,),
                         SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
                 Container(
                  decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 225, 224, 224)
                    )
                  ),
                   child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      minVerticalPadding: 0,
                      title:Image.asset(
                      'assets/Rec112.png',
                      fit: BoxFit.cover,
                      height: 100,
                    ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Deep Cleaning', style: text17L, textAlign: TextAlign.center,),
                      ),
                    ),
                                 ),
                 ),
                 Container(
                  decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Color.fromARGB(255, 225, 224, 224)
                    )
                  ),
                   child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      minVerticalPadding: 0,
                      title:Image.asset(
                      'assets/Rec111.png',
                      fit: BoxFit.cover,
                      height: 100,
                    ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Coming Soon!', style: text17L, textAlign: TextAlign.center,),
                      ),
                    ),
                                 ),
                 ),
              
                 ComingSoonBoxes(colorCode: Color(0XFF452C72)),
                  ComingSoonBoxes(colorCode: Color(0XFF6FDFA0)),
                  ComingSoonBoxes(colorCode: Color(0XFF901E1E)),
                  ComingSoonBoxes(colorCode: Color(0XFFF5C25C)),
                 
            ],
            ),
          ],
        ),
      ),
    );
  }
}