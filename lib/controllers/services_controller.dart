import 'package:get/get.dart';
import 'package:squeeky/models/services_model.dart';
import 'package:squeeky/providers/api_data_provider.dart';

class ServicesController extends GetxController {
  final apiHandler = ApiDataProvider();
  RxBool serviceLoading = true.obs;
  var  services = <ServicesModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getServices(id);
  }
  void getServices(id) async{
    print(id);
    var servicesData = await apiHandler.fetchServices(id);
    services.addAll(servicesData);
    print(servicesData);
    serviceLoading(false);
  }
}