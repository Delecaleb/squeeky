import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/placing_order.dart';
import 'package:squeeky/screens/ratingservices.dart';
import 'package:squeeky/style/textstyles.dart';
import 'package:squeeky/widgets.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order #1813D'),

        actions: [Text('Help')],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: Get.height * 0.2,
                  width: Get.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('https://picsum.photos/250?image=1'),
                      fit: BoxFit.cover
                      )
                  ),
                ),
                
                 const ListTile(
                   title: Text('Lawn Mowing Bussiness'),
                
                   subtitle: Text.rich(
                           TextSpan(
                           children: [
                             TextSpan(text: 'Order completed . ', style: TextStyle(color: Color(0xFF0F984A))),
                             TextSpan(text: 'Today at 15:06')
                           ]
                         )
                         ),
                   ),
                 ListTile(
                   title: Text('Your order', style: text21,),
                   trailing: ElevatedButton(onPressed: ()=>Get.to(()=>RatingServicesScreen()), child: Text('Rate service')),
                 ), 
                
                 ExpansionTile(
                   leading: Container(
                     width: 24,
                     height: 24,
                     color: Color(0xFFEFECF0),
                     child:  Text('1', style: text14, textAlign: TextAlign.center,),
                   ),
                   title: Text('Basic Lawn Mowing'),
                   subtitle: Text('Read more'),
                   trailing: Text(''),
                   expandedAlignment: Alignment.bottomLeft,
                   childrenPadding: EdgeInsets.all(15),
                   children: [
                     Text('data'),
                   ],
                   ),
                   ListTile(
                      leading: Container(
                        width: 24,
                        height: 24,
                        color: Color(0xFFEFECF0),
                        child:  Text('1', style: text14, textAlign: TextAlign.center,),
                      ),
                      title: Text('Basic Lawn Mowing'),
                      subtitle: ShowMoreLessWidget(fullText: "Choice of Lawn Size Large ( 20,000-25,000 sqft.) Choice grass height Medium Number of Trees 0"),
                   ),
                   
              ],
            ),
            ElevatedButton(
              onPressed: ()=>Get.to(()=>ReceiptScreen()), child: Text('View receipt'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEFECF0),
                minimumSize: Size.fromHeight(60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
                )
              ),
            ),
            SizedBox(height: 15,),
            ElevatedButton(
              onPressed: (){}, child: Text('Get Help'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFEFECF0),
                minimumSize: Size.fromHeight(60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}