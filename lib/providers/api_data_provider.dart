// lib/providers/api_data_provider.dart

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:squeeky/models/services_model.dart';

import '../models/business_category.dart';
import '../models/business_model.dart';

class ApiDataProvider {
  final String baseUrl = 'https://squeekyapi.somee.com/'; // Replace with your API URL

   Future<List<BusinessModel>> fetchBusinessCategories() async {
    http.Response response = await http.get(Uri.parse('https://squeekyapi.somee.com/Business/Get_All_ServiceCategories'));
    if(response.statusCode == 200){
     final List<dynamic> data = json.decode(response.body)['serviceCategory'];
      print(data);
      return data.map((data)=>BusinessModel.fromJson(data)).toList();
    }
    else {
     throw Exception('Failed to load service categories');
    }
  }

  Future <List<ServicesModel>>fetchServices(id)async{
    print(id);
    http.Response response = await http.get(Uri.parse("https://squeekyapi.somee.com/Business/Get_All_Services?CategoryId=${id}"), );
    if(response.statusCode == 200){
      final List<dynamic> responseData = json.decode(response.body)['services'];
      print(responseData);
      return responseData.map((mapData) => ServicesModel.fromJson(mapData)).toList();
    }else{
      throw Exception("Error Occured");
    }
  }

}
