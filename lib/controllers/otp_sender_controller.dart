import 'dart:math';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class OTPcontroller extends GetxController{
 final String url = 'https://squeeky.org/send_otp.php';
  void generateOtp(carrier, otp) async{
  try{
   var map = Map<String, dynamic>();

    map['token'] = otp.toString();
    map['carrier'] = carrier;
    
    http.Response response = await http.post(Uri.parse(url), body: map);

  }catch(e){
    // return [];
  }   
}
}