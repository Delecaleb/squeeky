import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/models/business_model.dart';
import 'package:squeeky/providers/api_data_provider.dart';

class SearchBusinessController extends GetxController{
  RxBool schedule = true.obs; 
  var searchResult = <BusinessModel>[].obs;
  final apiHandler = ApiDataProvider();
  RxBool isloading = false.obs;

  TextEditingController service = TextEditingController();
  String when = '';
  TextEditingController where = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void searchBusiness(){
      searchFunction(where.text, when,service.text);
  }

  void searchFunction(where, when,service) async{
    isloading(true);
      final searchData = await apiHandler.searchBusinesses(where, when,service);

      searchResult.assignAll(searchData);
      
      isloading(false);
  }

}