import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/account_top_up.dart';
import 'package:squeeky/style/textstyles.dart';

import '../controllers/account_ballance.dart';

class AccountWallet extends StatelessWidget {
  String userId;
   AccountWallet({super.key, required this.userId});
  AccountBallanceController accountBallanceController = Get.put(AccountBallanceController());

  @override
  Widget build(BuildContext context) {
    accountBallanceController.getBallance(userId);
    return Scaffold(
      appBar: AppBar(
        title: Text('Wallet'),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    image: AssetImage('assets/frame.png'),
                    fit: BoxFit.cover
                    ),                    
                ),
                
                child: Obx(() {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Squeeky Cash'),
                        SizedBox(height: 10,),
                      
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: accountBallanceController.isLoading.value ? 
                          Container(
                            child: Image.asset("assets/load.gif", width: 20.0),
                            width: 20.0,
                            height: 20.0,
                          ) 
                          : 
                          Text("\$${accountBallanceController.totalBalance}", style: text42,),
                          trailing: Icon(Icons.arrow_forward_ios),
                        ),
                        SizedBox(height: 20,),
                        TextButton.icon(
                          onPressed: ()=>Get.to(()=>AccountTopUpScreen(total: accountBallanceController.totalBalance.value,)), 
                          label: Text('Top Up', style: textBtn,),
                          icon: Icon(Icons.add, color: Colors.white,), 
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.all(25)
                          ),
                        ),
                      ],
                    );
                  }
                ),
              ),
              SizedBox(height: 30,),
              // ListTile(
              //   leading: Icon(Icons.card_giftcard),
              //   title: Text("*****2125"),
              //   trailing: Icon(Icons.arrow_forward_ios),
              // ),
              // ListTile(
              //   leading: Icon(Icons.add),
              //   title: Text("Add payment method"),
              // ),
              
             ],
          ),
      ),
    );
  }
}