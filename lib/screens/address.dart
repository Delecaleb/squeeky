import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/controllers/create_account_controller.dart';
import 'package:squeeky/screens/home.dart';
import 'package:squeeky/style/textstyles.dart';
import 'package:squeeky/widgets.dart';

class Address extends StatefulWidget {
   Address({super.key});

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
  
  var createAccount = Get.put(CreateAccountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Address Info', style: text20,),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('{200 Lonsdale Rd, Toronto, ON M4V 1W6}', style: text14,),
                    SizedBox(height: 10,),
                    BasicInputWidget(label: 'Business or building name', input_controller: createAccount.buildingNameController,),

                    BasicInputWidget(label: 'Flat or house number', input_controller: createAccount.houseNumberController),

                    BasicInputWidget(label: 'Street address', input_controller: createAccount.streetController),

                    BasicInputWidget(label: 'Postcode', input_controller: createAccount.postalCode), 
                    Divider(),
                    SizedBox(height: 20,),
                    Text('Delivery options', style: titleText,),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: null, 
                          icon: Icon(Icons.person_2), 
                          label: Text('Meet at door'),
                        ),
                        SizedBox(width: 10,),
                        ElevatedButton.icon(
                          onPressed: null, 
                          icon: Icon(Icons.door_back_door), 
                          label: Text('Meet at door'),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    BasicInputWidget(label: 'Add instructions', input_controller: createAccount.instructionController),
                    Divider(),
                    SizedBox(height: 20,),
                    Text('Address label'),
                    BasicInputWidget(label: 'Home', input_controller: createAccount.labelController), 

                    Obx(() {
                        return createAccount.isLoading.value ? ElevatedButton(onPressed: null, child: Text("Connecting..")) : ElevatedButton(
                          onPressed: (){
                            createAccount.register();
                            }, 
                          child: Text('Continue'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            backgroundColor: Color(0xFF87CEEB)
                          ),
                        );
                      }
                    )                 
                  ],
                )
            ),
    );
  }
}