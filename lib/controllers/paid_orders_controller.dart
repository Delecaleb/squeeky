import 'package:get/get.dart';
import 'package:squeeky/providers/api_data_provider.dart';

import '../models/paid_order_model.dart';
import '../storage/app_getx_storage.dart';

class PaidOrdersController extends GetxController{
  var paidOrders = <PaidOrderModel>[].obs;
  final StorageService storage = StorageService();
  late String userId;
  RxBool isloading = false.obs;

  PaidOrdersController(){
    userId = storage.getString('userPhone');
  }
  final apiDataProvider = ApiDataProvider();
  
  @override
  void onInit(){
    super.onInit();
    getCompletedOrders();
  }

  getCompletedOrders() async {
    isloading(true);
    var response = await apiDataProvider.fetchCompletedOrders(userId); 

    paidOrders.assignAll(response);

    isloading(false);
  }

}