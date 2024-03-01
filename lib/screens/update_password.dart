import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squeeky/controllers/update_profile_controller.dart';
import 'package:squeeky/style/textstyles.dart';




class UpdatePasswordScreen extends StatefulWidget {
  
  UpdatePasswordScreen({ Key? key}) : super(key: key);
  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final updateController  = Get.put(UpdateUserAccountController());
  late TextEditingController valueController = TextEditingController() ;
  final box = GetStorage();
  
  @override
  Widget build(BuildContext context) {
    var phoneNumber = box.read('userPhone');
    var lastDigits = phoneNumber.substring(phoneNumber.length -4 );
    return Scaffold(
      appBar: AppBar(
        title:  Text('Update Password', style: text15L,),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),

            Text('Enter the code sent to XXXXXX${lastDigits}', style: text15L,),
            SizedBox(height: 10,),
            TextField(  
                  decoration: InputDecoration(
                  border: InputBorder.none,
                  focusColor: Color(0xFFEFECF0),
                  fillColor: Color(0xFFEFECF0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black,)
                  ),
                  filled: true,
                ),
            ),
            SizedBox(height: 30,),
            Text('Enter new password', style: text15L,),
            SizedBox(height: 10,),
            TextField(
                    
                    controller: valueController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: Color(0xFFEFECF0),
                      fillColor: Color(0xFFEFECF0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black,)
                      ),
                      filled: true,
                    ),
                  ),
            SizedBox(height:30),
            TextButton(
              onPressed: (){
                updateController.updateProfile('password', valueController.text, box.read('userPhone') );
              }, 
              child: Text("Update Password", style: textBtn,),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF87CEEB),
                minimumSize: Size.fromHeight(50), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}