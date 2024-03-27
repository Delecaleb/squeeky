
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../style/textstyles.dart';

class CheckboxPopUp extends StatelessWidget {
  CheckboxPopUp({super.key});
  final box = GetStorage(); 
  @override
  Widget build(BuildContext context) {
    return Container(
                      color: Colors.white,
                      height: Get.height,
                      width: Get.width,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text('Order details')
                            ],
                          ),
                          
                          const TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.search),
                              labelText: 'Enter a new location',
                              border: InputBorder.none,
                              focusColor: Color(0xFFEFECF0),
                              fillColor: Color(0xFFEFECF0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black,)
                              ),
                              filled: true,
                            ),
                          ),
                          SizedBox(height: 15,),
                          Text('Nearby', style: text15B,),
                          SizedBox(height: 15,),
                          ListTile(
                            // contentPadding: EdgeInsets.zero,
                            leading: Icon(Icons.location_on_outlined),
                            title: Text('Current location', style: text16,),
                            subtitle: Text('${box.read('userPostalCode')} ${box.read('userAddress')}',),
                          ),
                          Divider(),
                          Text('Recent locations', style: text15B,),
                          SizedBox(height: 15,),
                          Container(
                            color: Color(0xFFF7F4F8),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: ListTile(
                              // contentPadding: EdgeInsets.zero,
                              leading: Icon(Icons.location_on_outlined),
                              title: Text('Home', style: text16,),
                              subtitle: Text('${box.read('userPostalCode')} ${box.read('userAddress')}',),
                              trailing: CircleAvatar(child: Icon(Icons.edit)),
                            ),
                          ),
                          ListTile(
                            // contentPadding: EdgeInsets.zero,
                            title: Text('Saved Places', style: text17L,),
                            trailing: Icon(Icons.arrow_forward_ios_sharp, size: 15, ),
                          ),
                        ],
                      ),
                    );
  }
}