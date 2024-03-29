import 'package:get/get.dart';
import 'package:squeeky/models/favourites_model.dart';
import 'package:squeeky/providers/api_data_provider.dart';

import '../models/business_model.dart';
import '../screens/store_info.dart';
import '../storage/app_getx_storage.dart';

class FetchFavouriteController extends GetxController{
  final apiHandler = ApiDataProvider();

  var favourites = <FavouritesModel>[].obs;

  var businessDetails = <BusinessModel>[].obs;
  RxBool isloading = true.obs;
  final StorageService storage = StorageService();
  late String userid;

  FetchFavouriteController(){
    userid = storage.getString('userPhone');
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getFavourites();
  }

  void getFavourites()async{
    final response = await apiHandler.fetchFavourite(userid);
    favourites.assignAll(response);
    isloading(false);
  }

  void getBusinessDetails(businessId)async{
    final responseData = await apiHandler.getBusinessesById(businessId);

    businessDetails.assignAll(responseData);
    Get.to(()=> StoreInformation(business: businessDetails.first));
  }


  
}