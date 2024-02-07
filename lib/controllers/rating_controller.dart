import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../providers/api_data_provider.dart';

class RatingController extends GetxController{
  RxDouble initialRate = 0.0.obs;
  final box = GetStorage();
  RxBool ratingStatus = false.obs;
  RxBool showBtn = false.obs;
  RxDouble currentRate = 0.0.obs;
  final apiProvider = ApiDataProvider();
  late String userId;
  late String userName;
  RatingController(){
    userId = box.read('userPhone');
    userName = box.read('userFirstName');
  }

  void verifyAlreadyRated(businessId, serviceId, orderId)async{
    var responsevalue = await apiProvider.checkServiceRating(businessId, userId, serviceId, orderId);
  
      
        ratingStatus (responsevalue['status']);
       initialRate (responsevalue['rate'].toDouble());

      
      print(initialRate);
      print(ratingStatus);

  }

  void rateService(businessId, serviceId, orderId, rate)async{
    apiProvider.rateService(businessId, userId, serviceId, orderId, rate, '');
  }


}