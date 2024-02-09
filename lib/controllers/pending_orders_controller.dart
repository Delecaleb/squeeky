import 'package:get/get.dart';
import 'package:squeeky/providers/api_data_provider.dart';
import '../models/pending_order_services_model.dart';
import '../storage/app_getx_storage.dart';

class PendingOrdersController extends GetxController{
  var pendingOrders = <PendingServiceModel>[].obs;
  final StorageService storage = StorageService();
  late String userId;
  RxBool isloading = false.obs;
  
  PendingOrdersController(){
    userId = storage.getString('userPhone');
  }
  final apiDataProvider = ApiDataProvider();
  
  @override
  void onInit(){
    super.onInit();
    getPendingOrders();
  }

  getPendingOrders() async {
    isloading(true);
    var response = await apiDataProvider.fetchPendingOrders(userId); 
    pendingOrders.assignAll(response);

    isloading(false);
  }

  cancelOrder(serviceid)async{
    var result = await apiDataProvider.cancelOrder(serviceid, userId);
    return result;
  }
}