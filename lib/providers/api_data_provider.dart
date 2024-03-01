// lib/providers/api_data_provider.dart

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:squeeky/models/services_model.dart';
import '../models/business_model.dart';
import '../models/paid_order_model.dart';
import '../models/contact_model.dart';
import '../models/favourites_model.dart';
import '../models/notification_model.dart';
import '../models/orders_model.dart';
import '../models/pending_order_services_model.dart';

class ApiDataProvider {
  final String baseUrl = 'https://squeeky.org/api/squeeky.php'; // Replace with your API URL

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

  Future<List<BusinessModel>> getBusinessesById(businessId) async {
    var map = Map<String, dynamic> ();
    map['action'] = 'get_businesses_by_id';
    map['business_id'] = businessId;
    
    http.Response response = await http.post(Uri.parse(baseUrl), body: map);
    if(response.statusCode == 200){
     List  data = json.decode(response.body);

      return data.map((data)=>BusinessModel.fromJson(data)).toList();
    }
    else {
     throw Exception('Failed to load service categories');
    }
  }

  Future<List<BusinessModel>> searchBusinessServices(service) async {
    var map = Map<String, dynamic> ();
    map['action'] = 'fetch_businesses_service';
    map['service'] = service;

    http.Response response = await http.post(Uri.parse(baseUrl), body: map);
    if(response.statusCode == 200){
     final  data = json.decode(response.body);
      if(data['status']=='empty'){
           return List<BusinessModel>.empty();
      }else{
        List  responseData= data['data'];
        return responseData.map((data)=>BusinessModel.fromJson(data)).toList();
      }
    }
    else {
     throw Exception('Failed to load service categories');
    }
  }

  Future<List<BusinessModel>> searchBusinesses(String where, String when, String service) async {
    var map = Map<String, dynamic> ();
    map['action'] = 'fetch_search_businesses';
    map['where'] = where;
    map['whan'] = when;
    map['service'] = service;
    http.Response response = await http.post(Uri.parse(baseUrl), body: map);
    if(response.statusCode == 200){
     final  data = json.decode(response.body);
     
      if(data['status']=='empty'){
           return List<BusinessModel>.empty();
      }else{
        List  responseData= data['data'];
        return responseData.map((data)=>BusinessModel.fromJson(data)).toList();
      }
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
      final decodedResponse = json.decode(response.body);

      if(decodedResponse['status']=='empty'){
         return List<ServicesModel>.empty();
      }else{
        final List responseData = json.decode(response.body)['data'];
      
        return responseData.map((mapData) => ServicesModel.fromJson(mapData)).toList();

      }

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
      final decodedResponse = json.decode(response.body);
      
      if(decodedResponse['status']=='empty'){
        return List<FavouritesModel>.empty();
      }else{
        final List responseData = decodedResponse['data'];
        return responseData.map((mapData) => FavouritesModel.fromJson(mapData)).toList();
      }
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
  Future topUpAccount(String user_phone, amount)async{
      var map = Map<String, dynamic>();
      map['action']= 'top_up_account';
      map['amount'] = amount;
      map['user_id'] = user_phone;
      http.Response response = await http.post(Uri.parse(baseUrl), body: map);
      if(response.statusCode == 200){
      final responseData = json.decode(response.body);  
      return responseData;
    }else{
      throw Exception("Error Occured");
    }
  }
  Future addToCart(businessId,serviceId,serviceName, extraCategory, extraPrice,extraValue,timeArrival,bookingDate,servicePrice, user_phone, serviceLocation)async{
      var map = Map<String, dynamic>();
      map['action']= 'add_to_cart';
      map['serviceId'] = serviceId;
      map['extraCategory']= extraCategory;
      map['extraPrice']= extraPrice;
      map['extraValue']= extraValue;
      map['timeArrival']= timeArrival;
      map['bookingDate'] = bookingDate;
      map['userId'] = user_phone;
      map['servicePrice'] = servicePrice;
      map['serviceName'] = serviceName;
      map['businessId'] = businessId;
      map['location']= serviceLocation; 

      http.Response response = await http.post(Uri.parse(baseUrl), body: map);
      if(response.statusCode == 200){
      final responseData = json.decode(response.body);
      return responseData;
    }else{
      throw Exception("Error Occured");
    }
  }

  Future updateProfile(String condition, String value, String userId)async{
      var map = Map<String, dynamic>();
      map['action']= 'update_profile';
      map['condition'] = condition;
      map['value'] = value;
      map['user_id'] = userId;
      http.Response response = await http.post(Uri.parse(baseUrl), body: map);
      if(response.statusCode == 200){
      final responseData = json.decode(response.body);
      return responseData;
    }else{
      throw Exception("Error Occured");
    }
  }

  Future UploadDpFile(File filePath, String user)async{
    var request = http.MultipartRequest('POST', Uri.parse(baseUrl));
    var fileStream = http.ByteStream(Stream.castFrom(filePath.openRead()));
    var length = await filePath.length();
    var multipartFile = http.MultipartFile('file', fileStream, length,
        filename: filePath.path.split('/').last);
    request.files.add(multipartFile);
    request.fields['user'] = user;
    request.fields['action'] = 'upload_dp_file';
    var response = await http.Response.fromStream(await request.send());
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      return responseData;
    } else {
      throw "Connection error";
    }
 
  }

  Future <List<OrdersModel>>fetchOrders(String userId)async{
    var map = Map<String, dynamic>();

    map['action'] = "fetch_cart";
    map['user_id'] = userId;

    http.Response response = await http.post(Uri.parse(baseUrl), body: map );
    if(response.statusCode == 200){
      final decodedResponse = json.decode(response.body);
      if(decodedResponse['status']=='empty'){
        return List<OrdersModel>.empty();
      }else{
        final List responseData = decodedResponse['data'];
        return responseData.map((mapData) => OrdersModel.fromJson(mapData)).toList();
      }
    }else{
      throw Exception("Error Occured");
    }
  }

  Future <List<NotificationsModel>>fetchNotification(String userId)async{
    var map = Map<String, dynamic>();

    map['action'] = "fetch_notification";
    map['user_id'] = userId;
    
    http.Response response = await http.post(Uri.parse(baseUrl), body: map );
    if(response.statusCode == 200){
      final decodedResponse = json.decode(response.body);
      if(decodedResponse['status']=='empty'){
        return List<NotificationsModel>.empty();
      }else{
        final List responseData = decodedResponse['data'];
        return responseData.map((mapData) => NotificationsModel.fromJson(mapData)).toList();
      }
    }else{
      throw Exception("Error Occured");
    }
  }

  Future fetchCheckOut(String userId)async{
    var map = Map<String, dynamic>();

    map['action'] = "get_check_out_services_and_total";
    map['userId'] = userId;

    http.Response response = await http.post(Uri.parse(baseUrl), body: map );
    if(response.statusCode == 200){
      final decodedResponse = json.decode(response.body);
      
      return List.from(decodedResponse["data"]);
      
    }else{
      throw Exception("Error Occured");
    }
  }

  Future LoginUser(userId, password)async{
    var map = Map<String, dynamic>();

    map['action'] = "login_user";
    map['user_id'] = userId;
    map['password'] = password;
    http.Response response = await http.post(Uri.parse(baseUrl), body: map );
    if(response.statusCode == 200){
      
      final decodedResponse = json.decode(response.body);
    
      return decodedResponse;
      
    }else{
      throw Exception("Error Occured");
    }
  }

    Future addQuantity(serviceid, userid)async{
    var map = Map<String, dynamic>();

    map['action'] = "increase_qty";
    map['serviceid'] = serviceid;
    map['userid'] = userid;
    http.Response response = await http.post(Uri.parse(baseUrl), body: map );
    if(response.statusCode == 200){
      
      final decodedResponse = json.decode(response.body);
      return decodedResponse;
      
    }else{
      throw Exception("Error Occured");
    }
  }

  Future removeQuantity(serviceid, userid)async{
    var map = Map<String, dynamic>();

    map['action'] = "decrease_qty";
    map['serviceid'] = serviceid;
    map['userid'] = userid;
    http.Response response = await http.post(Uri.parse(baseUrl), body: map );
    if(response.statusCode == 200){
      
      final decodedResponse = json.decode(response.body);
      return decodedResponse;
      
    }else{
      throw Exception("Error Occured");
    }
  }

  Future removeCartItem(serviceid, userid)async{
    var map = Map<String, dynamic>();

    map['action'] = "remove_item";
    map['serviceid'] = serviceid;
    map['userid'] = userid;
    http.Response response = await http.post(Uri.parse(baseUrl), body: map );
    if(response.statusCode == 200){
      
      final decodedResponse = json.decode(response.body);
      return decodedResponse;
      
    }else{
      throw Exception("Error Occured");
    }
  }

  Future cancelOrder(serviceid, userid)async{
    var map = Map<String, dynamic>();

    map['action'] = "cancel_order";
    map['serviceid'] = serviceid;
    map['userid'] = userid;
    http.Response response = await http.post(Uri.parse(baseUrl), body: map );
    if(response.statusCode == 200){
      
      final decodedResponse = json.decode(response.body);
  
      return decodedResponse;
      
    }else{
      throw Exception("Error Occured");
    }
  }

  Future <List<PaidOrderModel>>fetchCompletedOrders(String userId)async{
    var map = Map<String, dynamic>();

    map['action'] = "fetch_completed_orders";
    map['userId'] = userId;

    http.Response response = await http.post(Uri.parse(baseUrl), body: map );
    if(response.statusCode == 200){
      final decodedResponse = json.decode(response.body);

      if(decodedResponse['status']=='empty'){
        return List<PaidOrderModel>.empty();
      }else{
        final List responseData = decodedResponse['data'];
        return responseData.map((mapData) => PaidOrderModel.fromJson(mapData)).toList();
      }
    }else{
      throw Exception("Error Occured");
    }
  }

  Future <List<PendingServiceModel>>fetchPendingOrders(String userId)async{
    var map = Map<String, dynamic>();

    map['action'] = "fetch_pending_orders";
    map['userId'] = userId;
   
    http.Response response = await http.post(Uri.parse(baseUrl), body: map );
    if(response.statusCode == 200){
      final decodedResponse = json.decode(response.body);

      if(decodedResponse['status']=='empty'){
        return List<PendingServiceModel>.empty();
      }else{
        final List responseData = decodedResponse['data'];
        return responseData.map((mapData) => PendingServiceModel.fromJson(mapData)).toList();
      }
    }else{
      throw Exception("Error Occured");
    }
  }



  Future rateService(String businessId, String userId, List<String> serviceId, List<String> orderId, rating, review)async{
      var map = Map<String, dynamic>();
      map['action']= 'rate_service';
      map['business_id'] = businessId;
      map['user_id'] = userId;
      map['service_id'] = serviceId.join(',');
      map['order_id'] = orderId.join(',');
      map['rating'] = rating;
      map['review'] = review;
      
      http.Response response = await http.post(Uri.parse(baseUrl), body: map);
      if(response.statusCode == 200){
      final responseData = json.decode(response.body);  
      return responseData;
    }else{
      throw Exception("Error Occured");
    }
  }

  Future checkServiceRating(String businessId, String userId, List<String> serviceId, List<String> orderId)async{
      var map = Map<String, dynamic>();
      map['action']= 'check_service_rating';
      map['business_id'] = businessId;
      map['user_id'] = userId;
      map['service_id'] = serviceId.join(',');
      map['order_id'] = orderId.join(',');      
      http.Response response = await http.post(Uri.parse(baseUrl), body: map);
      if(response.statusCode == 200){
      final responseData = json.decode(response.body);  
      return responseData;
    }else{
      throw Exception("Error Occured");
    }
  }

  Future <List<ContactModel>> getContactList (userId) async {
    var map = Map<String, dynamic>();

    map['action'] = 'get_contact_list';
    map['user_id'] = userId;

    http.Response response = await http.post(Uri.parse(baseUrl), body: map);
    
    if(response.statusCode == 200){
      final decodedResponse = json.decode(response.body);
      
      if(decodedResponse['status']=='empty'){
        return List<ContactModel>.empty();
      }else{
        final List responseData = decodedResponse['data'];

        return  responseData.map((mapData) => ContactModel.fromJson(mapData)).toList();
      }
    }else{
      throw Exception("Error Occured");
    }

  }

  
Future<List<Map<String, dynamic>>> getMessages(userId, businessId) async {
  var map = Map<String, dynamic>();

  map['action'] = 'get_messages';
  map['user_id'] = userId;
  map['business_id'] = businessId;

  http.Response response = await http.post(Uri.parse(baseUrl), body: map);

  if (response.statusCode == 200) {
    final decodedResponse = json.decode(response.body);
    final responseData = decodedResponse['data'];

    return List<Map<String, dynamic>>.from(responseData);
  } else {
    throw Exception("Error Occurred");
  }
}

  Future saveMessages(userId, businessId, textMessage) async {
    var map = Map<String, dynamic>();

    map['action'] = 'save_messages';
    map['user_id'] = userId;
    map['business_id'] = businessId;
    map['textMessage']= textMessage;  

    http.Response response = await http.post(Uri.parse(baseUrl), body: map);
    
    if(response.statusCode == 200){
      final decodedResponse = json.decode(response.body);
        return  decodedResponse; 
    }else{
      throw Exception("Error Occured");
    }
  }

  Future getAccountBallance(userId) async {
    var map = Map<String, dynamic>();

    map['action'] = 'get_account_balance';
    map['user_id'] = userId;

    http.Response response = await http.post(Uri.parse(baseUrl), body: map);
    
    if(response.statusCode == 200){
      final decodedResponse = json.decode(response.body);
        return  decodedResponse; 
    }else{
      throw Exception("Error Occured");
    }
  }


}
