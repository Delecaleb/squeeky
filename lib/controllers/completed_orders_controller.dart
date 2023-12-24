import 'package:get/get.dart';
import 'package:squeeky/providers/api_data_provider.dart';

import '../models/completed_order_model.dart';
import '../storage/app_getx_storage.dart';

class CompletedOrdersController extends GetxController{
  var completedOrders = <CompletedOrderModel>[].obs;
  final StorageService storage = StorageService();
  late String userId;
  RxBool isloading = false.obs;

  CompletedOrdersController(){
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

    completedOrders.assignAll(response);

    isloading(false);
  }

}