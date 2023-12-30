import 'package:get/get.dart';
import 'package:squeeky/providers/api_data_provider.dart';

class SendMessagesController extends GetxController{
  final apiHandler = ApiDataProvider();

  void sendMessages(userId, businessId, textMessage){
    apiHandler.saveMessages(userId, businessId, textMessage);
  }

  Future<List<dynamic>> getMessages(userId, businessId,)async{
    var prevMessages = await apiHandler.getMessages(userId, businessId);
    return prevMessages;
  }
}