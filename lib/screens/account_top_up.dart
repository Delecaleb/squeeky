import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:squeeky/screens/top_up_paypal.dart';
import 'package:squeeky/style/textstyles.dart';

class AccountTopUpScreen extends StatelessWidget {
  const AccountTopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Up'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    ),
                    SizedBox(height: 20,),
                    
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Text("Enter Amount", style: text20,),
              TextField(
                autofocus: true,
                keyboardType: TextInputType.number,
                
              ),
              SizedBox(height: 20,),
              TextButton(
                onPressed: null,
                child: Text(
                  'Continue',
                  style: titleTextWhite,
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size.fromHeight(60),
                  backgroundColor: Color(0xFF87CEEB),
                ),
              )
              
             ],
          ),
      ),
    );
  }
}