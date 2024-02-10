import 'package:get_storage/get_storage.dart';
import 'package:squeeky/providers/api_data_provider.dart';

class TopUpController{
  var apiHandler = ApiDataProvider();

  final box = GetStorage();
  
  late String userId;

  TopUpController(){
    userId = box.read('userPhone');
  }

}