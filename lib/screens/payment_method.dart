import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:squeeky/screens/address.dart';
import 'package:squeeky/screens/payz.dart';
import 'package:squeeky/style/textstyles.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            // Text('Select your preferred payment method', style: text26,),
            Text('Squeeky payment method', style: text26,),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                color: Color(0xFF87CEEB),
                child: Icon(Icons.paypal, color: Colors.white,)
              ),
              title: Text('Paypal'),
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 15,),
            ),
            Divider(
              color: Color.fromARGB(255, 170, 186, 193),
              thickness: 0.2,
              indent: Get.width*0.1,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(Icons.credit_card),
              title: Text('Credit or debit card'),
              trailing: Icon(Icons.arrow_forward_ios_rounded, size: 15,),
              // onTap: () => Get.to(()=>CreditCard()),
              onTap: () => Get.to(()=>Address()),
            ),
          ],
        ),
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
        title: Text('Add card', style: text20,),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Card number'),
                  TextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(19)
                    ],
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
                              maxLength: 3,
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
                  CountryCodePicker(
                    initialSelection: 'United Kingdom',
                    
                  ),
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
                        
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextButton(
                    onPressed: ()=>Get.to(()=>Address()), 
                    child: Text("Save"),
                    style: TextButton.styleFrom(
                      minimumSize: Size.fromHeight(60),
                      backgroundColor: Color(0xFF87CEEB),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero)
                    ),
                  ),
          ) 
        ],
      ),
    );
  }
}