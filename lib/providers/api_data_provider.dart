// lib/providers/api_data_provider.dart

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/service_provider.dart';

class ApiDataProvider {
  final String baseUrl = 'https://your-api-url.com'; // Replace with your API URL

  Future<ServiceProvidersModel> getStores() async {
    http.Response response = await http.get(Uri.parse('$baseUrl/stores'));
    if(response.statusCode == 200){
      final responseData = json.decode(response.body);
      return ServiceProvidersModel.fromJson(responseData);
    }
    else {
      throw ("error");
    }

  }

  // Future<List<StoreItem>> getStoreItems(int storeId) async {
  //   final response = await http.get('$baseUrl/stores/$storeId/items');
  //   // Parse the response and return a list of StoreItem objects
  // }

  // Implement similar methods for user information and user cart information
}
