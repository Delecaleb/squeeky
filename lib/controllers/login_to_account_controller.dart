import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/providers/api_data_provider.dart';

import '../screens/home.dart';
import '../storage/app_getx_storage.dart';

class  LoginAccountController extends GetxController {
  var serviceHandler = ApiDataProvider();
  final StorageService storage = StorageService();
  RxBool isLoading = false.obs;

  TextEditingController userController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void SignIn() async {
    isLoading(true);
    serviceHandler.LoginUser(userController.text, passwordController.text)
        .then((value) async {
      
      final responseData = value['data'][0];

      print(responseData['user_phone']);
      if(value['status'] =="done"){
          Get.snackbar('Done', value['message']);
          storage.saveString('userPhone', responseData['user_phone']);
          storage.saveString('userEmail', responseData['user_email']);
          storage.saveString('userFirstName', responseData['user_first_name']);
          storage.saveString('userLastName', responseData['user_sur_name']);
          storage.saveString('userDeliveryOption', responseData['user_delivery_option']);
          storage.saveString('userAddress',  responseData['user_street_address']);
          storage.saveString('userPostalCode',  responseData['user_postcode']);
          storage.saveString('userPicture',  responseData['user_picture']);
          Get.offAll(() => HomeScreen(currentIndex: 0,));
          isLoading(false);
      }else{
        Get.snackbar('Error', value['message']);
      }
    });
  }
}
