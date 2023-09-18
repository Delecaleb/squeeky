import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/payz.dart';
import 'package:squeeky/style/textstyles.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('Select your preferred payment method', style: text26,),

          ListTile(
            leading: Icon(Icons.paypal),
            title: Text('Paypal'),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),

          ListTile(
            leading: Icon(Icons.paypal),
            title: Text('Credit or debit card'),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => Get.to(()=>CardDetailsScreen()),
          ),
        ],
      ),
    );
  }
}


class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add card'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Card number'),
            TextField(
              
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.payment_sharp),
                fillColor: Color(0xFFEFECF0),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color:Color(0xFF87CEEB) )
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFF87CEEB),
                    width: 1.5,
                  )
                )
              ),
            ),

            SizedBox(height: 15,),
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Exp. date'),
                    Container(
                      width: Get.width * 0.4,
                      child: TextField(
                        
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          fillColor: Color(0xFFEFECF0),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFF87CEEB) )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF87CEEB),
                              width: 1.5,
                            )
                          )
                        ),
                      ),
                    ),
                  ],
                ),
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('CVV'),
                    Container(
                      width: Get.width * 0.4,
                      child: TextField(
                        
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          
                          fillColor: Color(0xFFEFECF0),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFF87CEEB) )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF87CEEB),
                              width: 1.5,
                            )
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15,), 
            Text('Country'),

            SizedBox(height: 15,), 

            Text("Post COde"),
            const TextField(
                        
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          
                          fillColor: Color(0xFFEFECF0),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color:Color(0xFF87CEEB) )
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF87CEEB),
                              width: 1.5,
                            )
                          )
                        ),
                      ),
            SizedBox(height: 15,),   
            TextButton(
              onPressed: (){}, 
              child: Text("Save"),
              style: TextButton.styleFrom(
                minimumSize: Size.fromHeight(60),
                backgroundColor: Color(0xFF87CEEB),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)
              ),
            )       
          ],
        ),
      ),
    );
  }
}