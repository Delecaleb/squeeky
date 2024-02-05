import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:squeeky/providers/api_data_provider.dart';

class SendMessagesController extends GetxController{
  var box = GetStorage();
  
  final apiHandler = ApiDataProvider();
  late String  userDp ;
  SendMessagesController(){
     userDp = box.read('userPicture');
  }

  void sendMessages(userId, businessId, textMessage){
    apiHandler.saveMessages(userId, businessId, textMessage);
  }

  Future<List<dynamic>> getMessages(userId, businessId,)async{
    var prevMessages = await apiHandler.getMessages(userId, businessId);
    return prevMessages;
  }
}