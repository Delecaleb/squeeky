import 'package:get/get.dart';
import 'package:squeeky/providers/api_data_provider.dart';

import '../models/business_category.dart';
import '../models/business_model.dart';

class ServiceController extends GetxController {
  final apiHandler = ApiDataProvider();
  RxBool isloading = true.obs;
  var businessCategories = <BusinessModel>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    fetchBusinessCategory();
  }

  void fetchBusinessCategory() async {
    final categories = await apiHandler.fetchBusinesses();
    businessCategories.assignAll(categories);
    isloading(false);
  }

}


