
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squeeky/providers/api_data_provider.dart';

import '../models/orders_model.dart';

class CartController extends GetxController{
  var ordersList = <OrdersModel>[].obs;
  final apiHandler = ApiDataProvider();
  final box = GetStorage();
  var serviceId =''.obs(); 
  var extraCategory =''.obs(); 
  var extraPrice  =''.obs();
  var extraValue =''.obs();
  var timeArrival  =''.obs();
  var bookingDate  =''.obs();
  var servicePrice = ''.obs();
  late String userId;
  
  CartController(){
    userId = box.read('userPhone');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getOrders(userId);
  }

  void getOrders(user_id)async{
    final responseData = await apiHandler.fetchOrders(userId);
    ordersList.assignAll(responseData);
  }

  void addToOrders(){
    addToCart(userId);
  }

  void addToCart(user_id)async{
    final responseData =  await apiHandler.addToCart(serviceId, extraCategory, extraPrice, extraValue, timeArrival, bookingDate, servicePrice, user_id);
  }
}