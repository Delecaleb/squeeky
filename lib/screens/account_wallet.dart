import 'package:flutter/material.dart';
import 'package:squeeky/style/textstyles.dart';

class AccountWallet extends StatelessWidget {
  const AccountWallet({super.key});

  @override
  Widget build(BuildContext context) {
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
                
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Squeeky Cash'),
                    SizedBox(height: 10,),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text("\$0 . 00", style: text42,),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    SizedBox(height: 20,),
                    TextButton.icon(
                      onPressed: (){}, 
                      label: Text('Top Up', style: textBtn,),
                      icon: Icon(Icons.add, color: Colors.white,), 
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.all(25)
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              // ListTile(
              //   leading: Icon(Icons.card_giftcard),
              //   title: Text("*****2125"),
              //   trailing: Icon(Icons.arrow_forward_ios),
              // ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text("Add payment method"),
              ),
              
             ],
          ),
      ),
    );
  }
}