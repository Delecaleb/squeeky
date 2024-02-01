import 'package:get/get.dart';
import 'package:squeeky/providers/api_data_provider.dart';

import '../models/business_category.dart';
import '../models/business_model.dart';

class BusinessController extends GetxController {
  final apiHandler = ApiDataProvider();
  RxBool schedule = false.obs; 
  RxBool isloading = true.obs;
  var businessCategories = <BusinessModel>[].obs;
  var businessSearchResult = <BusinessModel>[].obs;
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

  // BusinessModel ? findBusinessById(String businessId) {
  //   return   businessCategories.firstWhere((business) => business.businessId == businessId, );
  // }
  BusinessModel? findBusinessById(String businessId) {
  try {
      return businessCategories.firstWhere((business) => business.businessId == businessId);
    } catch (e) {
      print("Business with ID $businessId not found.");
      return null;
    }
  }


  void findABusiness(searchQuery) async {
    isloading(true);
    final searchResult = await apiHandler.searchBusinessServices(searchQuery);
    businessSearchResult.assignAll(searchResult);
    isloading(false);
  }


 


}


