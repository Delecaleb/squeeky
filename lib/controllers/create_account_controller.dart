import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squeeky/providers/api_data_provider.dart';

import '../screens/home.dart';
import '../storage/app_getx_storage.dart';

class CreateAccountController extends GetxController {
  var serviceHandler = ApiDataProvider();
  final StorageService storage = StorageService();
  final box = GetStorage();
  RxBool isLoading = false.obs;
  RxString phoneNumberWithCcode = ''.obs;
  var countryCallCode = "+1";
  var countryCode = 'Canada';
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
    String phoneWithCountryCode = countryCallCode+phoneNumberController.text ;
    isLoading(true);
await    serviceHandler.CreateAccount(
            firstNameController.text,
            lastNameController.text,
            emailController.text,
            passwordController.text,
            phoneWithCountryCode,
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
      if(value['status'] =="done"){
          await  box.write('userPhone', phoneWithCountryCode);
          await  box.write('userEmail', emailController.text);
          await  box.write('userFirstName', firstNameController.text);
          await  box.write('userLastName', lastNameController.text);
          await  box.write('userDeliveryOption', deliveryOption.text);
          await  box.write('userAddress', labelController.text);
          await  box.write('userPostalCode', postalCode.text);
          await  box.write('userPicture', '');

          print(box.read('userAddress'));
          print(box.read('userPhone'));
          print(box.read('userEmail'));
          print(box.read('userLastName'));
          print(box.read('userPostalCode'));
          Get.offAll(() => HomeScreen(currentIndex: 0,));
      }else{
        Get.snackbar('Error', value['message']);
      }
    });
  }
}
