import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeky/models/business_model.dart';
import 'package:squeeky/storage/app_getx_storage.dart';

import '../providers/api_data_provider.dart';

class FavouriteController {
  final ApiDataProvider apiHandler = ApiDataProvider();
  final StorageService storage = StorageService();
  late String userPhone;

  FavouriteController() {
    userPhone = storage.getString('userPhone');
  }

  void addFavourite(String businessId) async {
    apiHandler.addToFavorite(businessId, userPhone).then((value){
    print(value);
    Get.snackbar(
          '', 
          '',
          titleText: Row(
            children: [
                Icon(Icons.favorite, color: Colors.white),
                SizedBox(width: 10,),
                Text(value['message'], style: TextStyle(color: Colors.white),),
            ],
          ),
          backgroundColor: Color(0xFF201D21)
        );
        
        }
    );
  }
}

