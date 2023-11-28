import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../providers/api_data_provider.dart';
import '../screens/profile.dart';

class UpdateUserAccountController extends GetxController{
  var apiHandler = ApiDataProvider();
  final box = GetStorage();

  void updateProfile(condition, value, userId){
    apiHandler.updateProfile(condition, value, userId).then((response){
     
      Get.snackbar('', response['message']);
      if(response['status']=='done'){
        // update the user storage
        if(condition.toUpperCase() =='FIRST NAME'){
            box.write('userFirstName', value);

        }else if(condition.toUpperCase() =='LAST NAME'){
            box.write('userLastName', value);          
        }else if(condition.toUpperCase() =='EMAIL ADDRESS'){
            box.write('userEmail', value);
        }

          Get.off(()=>EditProfile());
          // Get.back();
        
      }else{
        return '';
      }

    });
  }
}