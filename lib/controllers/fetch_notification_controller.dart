import 'package:get/get.dart';
import 'package:squeeky/providers/api_data_provider.dart';

import '../models/notification_model.dart';
import '../storage/app_getx_storage.dart';

class FetchNotificationController extends GetxController{
  final apiHandler = ApiDataProvider();

  var notificationData = <NotificationsModel>[].obs;
  RxBool isloading = true.obs;
  final StorageService storage = StorageService();
  late String userid;

  FetchNotificationController(){
    userid = storage.getString('userPhone');
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getNotifications();
  }

  void getNotifications()async{
    final response = await apiHandler.fetchNotification(userid);
    notificationData.assignAll(response);
    isloading(false);
  }

  
}