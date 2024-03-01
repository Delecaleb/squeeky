import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../providers/api_data_provider.dart';

class AccountBallanceController extends GetxController{

  RxDouble totalBalance = 0.0.obs;
  RxBool isLoading = false.obs;

  final box = GetStorage();
  final apiHandler = ApiDataProvider();
  
  getBallance(userId)async{
    isLoading(true);
    var response = await apiHandler.getAccountBallance(userId);
    double balance = double.parse(response['account_balance']);
    totalBalance.value = balance;
    isLoading(false);
  }

}