// lib/providers/api_data_provider.dart

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:squeeky/models/services_model.dart';

import '../models/business_category.dart';
import '../models/business_model.dart';
import '../models/favourites_model.dart';

class ApiDataProvider {
  final String baseUrl = 'https://learncrib.com.ng/squeeky/api/squeeky.php'; // Replace with your API URL

   Future<List<BusinessModel>> fetchBusinesses() async {
    var map = Map<String, dynamic> ();
    map['action'] = 'fetch_businesses';
    http.Response response = await http.post(Uri.parse(baseUrl), body: map);
    if(response.statusCode == 200){
     List  data = json.decode(response.body);

      return data.map((data)=>BusinessModel.fromJson(data)).toList();
    }
    else {
     throw Exception('Failed to load service categories');
    }
  }

  Future<List<BusinessModel>> searchBusinesses(String where, String when, String service) async {
    var map = Map<String, dynamic> ();
    map['action'] = 'fetch_businesses';
    map['where'] = where;
    map['whan'] = when;
    map['service'] = service;
    http.Response response = await http.post(Uri.parse(baseUrl), body: map);
    if(response.statusCode == 200){
     List  data = json.decode(response.body);

      return data.map((data)=>BusinessModel.fromJson(data)).toList();
    }
    else {
     throw Exception('Failed to load service categories');
    }
  }

  Future <List<ServicesModel>>fetchServices(id)async{
    var map = Map<String, dynamic>();

    map['action'] = "fetch_services";
    map['business_id'] = id;

    http.Response response = await http.post(Uri.parse(baseUrl), body: map );
    if(response.statusCode == 200){
      final List responseData = json.decode(response.body);

      return responseData.map((mapData) => ServicesModel.fromJson(mapData)).toList();
    }else{
      throw Exception("Error Occured");
    }
  }

  Future <List<FavouritesModel>>fetchFavourite(String userId)async{
    var map = Map<String, dynamic>();

    map['action'] = "fetch_favourites";
    map['user_id'] = userId;

    http.Response response = await http.post(Uri.parse(baseUrl), body: map );
    if(response.statusCode == 200){
      final List responseData = json.decode(response.body);
      print(responseData);
      return responseData.map((mapData) => FavouritesModel.fromJson(mapData)).toList();
    }else{
      throw Exception("Error Occured");
    }
  }

  Future CreateAccount(firstName,lastName,emailAddress,password,contact,address,postalCode,buildingName, houseNumber, street, instruction, label, deliveryOption) async{
    var map = Map<String, dynamic> ();
    map['action'] = 'register_user';
    map["firstName"] =  firstName;
    map["lastName"]= lastName;
    map["emailAddress"] = emailAddress;
    map["password"] = password;
    map["contact"] = contact;
    map["address"] = address;
    map["buildingName"] = buildingName;
    map["houseNumber"] = houseNumber;
    map["postalCode"] = postalCode;
    map['street']= street;
    map['instruction']= instruction;
    map['label']= label;
    map['deliveryOption']= deliveryOption;
    http.Response response = await http.post(Uri.parse(baseUrl), body: map);
    
    if(response.statusCode ==200){
        final responseData = json.decode(response.body);
        return responseData;
    }else{
        throw Exception('Failed to create user');
    }
  }

  Future addToFavorite(String business_id, String user_phone)async{
      var map = Map<String, dynamic>();
      map['action']= 'add_favourite';
      map['business_id'] = business_id;
      map['user_id'] = user_phone;
      
      http.Response response = await http.post(Uri.parse(baseUrl), body: map);

      if(response.statusCode == 200){
      final responseData = json.decode(response.body);
     
      return responseData;
    }else{
      throw Exception("Error Occured");
    }
  }


}
