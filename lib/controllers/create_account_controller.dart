import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/providers/api_data_provider.dart';

import '../screens/home.dart';
import '../storage/app_getx_storage.dart';

class CreateAccountController extends GetxController {
  var serviceHandler = ApiDataProvider();
  final StorageService storage = StorageService();
  RxBool isLoading = false.obs;
  RxString phoneNumberWithCcode = ''.obs;
  TextEditingController address = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController buildingNameController = TextEditingController();
  TextEditingController houseNumberController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController instructionController = TextEditingController();
  TextEditingController labelController = TextEditingController();
  TextEditingController deliveryOption = TextEditingController();
  // var imagePath = '';
  void register() async {
    isLoading(true);
    serviceHandler.CreateAccount(
            firstNameController.text,
            lastNameController.text,
            emailController.text,
            passwordController.text,
            phoneNumberWithCcode,
            address.text,
            postalCode.text,
            buildingNameController.text,
            houseNumberController.text,
            streetController.text,
            instructionController.text,
            labelController.text,
            deliveryOption.text,
            )
        .then((value) async {
      isLoading(false);
      print(value);
      if(value['status'] =="done"){
          storage.saveString('userPhone', phoneNumberWithCcode.value);
          storage.saveString('userEmail', emailController.text);
          storage.saveString('userFirstName', firstNameController.text);
          storage.saveString('userLastName', lastNameController.text);
          storage.saveString('userDeliveryOption', deliveryOption.text);
          storage.saveString('userAddress', address.text);
          storage.saveString('userPostalCode', postalCode.text);
          storage.saveString('userPicture', '');
          Get.offAll(() => HomeScreen(currentIndex: 0,));
      }else{
        Get.snackbar('Error', value['message']);
      }
    });
  }
}
