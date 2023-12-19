
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squeeky/providers/api_data_provider.dart';

import '../models/orders_model.dart';

class CartController extends GetxController{
  var ordersList = <OrdersModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool loadingQty = false.obs;
  RxBool loadingQtyRm = false.obs;
  RxBool removeItemLoading = false.obs;

  final apiHandler = ApiDataProvider();
  final box = GetStorage();
  var serviceId =''.obs(); 
  var extraCategory =''.obs(); 
  var extraPrice  =''.obs();
  var extraValue =''.obs();
  var timeArrival  =''.obs();
  var bookingDate  =''.obs();
  var servicePrice = ''.obs();
  var businessId = ''.obs();
  var serviceName = ''.obs();
  late String userId;
  
  CartController(){
    userId = box.read('userPhone');
  }

  

  void getOrders()async{
    isLoading(true);
    final responseData = await apiHandler.fetchOrders(userId);
    final response= await apiHandler.fetchCheckOut(userId);
    ordersList.assignAll(responseData);
    isLoading(false);
  }

  void addToOrders(){
    addToCart(userId);
  }

  void addToCart(user_id)async{
    final responseData =  await apiHandler.addToCart(businessId,serviceId,serviceName, extraCategory, extraPrice, extraValue, timeArrival, bookingDate, servicePrice, user_id);
  }

  void incrementQuantity(serviceid) async {
     loadingQty(true);

     final response = await apiHandler.addQuantity(serviceid, userId).then((value) {
      loadingQty(false);
     });
  }

  void decrementQuantity(serviceid) async {
     loadingQtyRm(true);

     final response = await apiHandler.removeQuantity(serviceid, userId).then((value) {
      loadingQtyRm(false);
     });
  }

  void removeItem(serviceid) async {
     removeItemLoading(true);

     final response = await apiHandler.removeCartItem(serviceid, userId).then((value) {
      removeItemLoading(false);
     });
  }

}