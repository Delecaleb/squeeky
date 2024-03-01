import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:squeeky/models/services_model.dart';
import 'package:squeeky/providers/api_data_provider.dart';

class ServicesController extends GetxController {
  final apiHandler = ApiDataProvider();
  RxBool showSearchField = false.obs;
  RxBool serviceLoading = true.obs;
  var  services = <ServicesModel>[].obs;

 var filteredList =<ServicesModel>[].obs;

  

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // getServices(id);
  }
  void getServices(id) async{

    var servicesData = await apiHandler.fetchServices(id);
    services.addAll(servicesData);
    
    filteredList.addAll(services);
    serviceLoading(false);
  }

  void runfilter(String valueEntered)async{
    List<ServicesModel>results = [];

    if(valueEntered.isEmpty){
      results.addAll(services);
    }else{
      results= services.where((response) => response.serviceName.toLowerCase().contains(valueEntered.toLowerCase())).toList();
    }
    filteredList.addAll(results);
    print(filteredList);
  }


}