import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squeeky/screens/profile.dart';

import '../providers/api_data_provider.dart';

class UpdateUserAccountController extends GetxController{
  var apiHandler = ApiDataProvider();
  final box = GetStorage();

  void updateProfile(condition, value, userId){
    apiHandler.updateProfile(condition, value, userId).then((response){
      print(response);
      Get.snackbar('title', response['message']);
      if(response['status']=='done'){
        // update the user storage
        if(condition.toUpperCase() =='FIRST NAME'){
            box.write('userFirstName', value);

        }else if(condition.toUpperCase() =='LAST NAME'){
            box.write('userLastName', value);          
        }else if(condition.toUpperCase() =='EMAIL ADDRESS'){
            box.write('userEmail', value);
        }

        Get.to(()=>Profile());
      }else{
        return '';
      }

    });
  }
}