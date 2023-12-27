import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squeeky/providers/api_data_provider.dart';

import '../models/contact_model.dart';

class MessagesContactController extends GetxController{
  var contactsList = <ContactModel>[].obs;
  
  final apiHandler = ApiDataProvider();
  
  var box = GetStorage();

  late String  userId ;
  
  MessagesContactController(){
    userId = box.read('userPhone');
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchContacts();
  } 

  void fetchContacts(){
    var contactData = apiHandler.getContactList(userId);
    contactsList.assignAll(contactsList);
  }
}