import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/orderDetails.dart';

class CompletedOrders extends StatelessWidget {
  const CompletedOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: () => Get.to(()=>OrderDetailsScreen()),
              leading: Image.network('https://picsum.photos/250?image=1'),
              title: Text('Lawn Mowing Business'),
              subtitle: Text("3 items \$298.03 \n 01 Nov Completed"),
            )
          ],
        ),
      ),
    );
  }
}