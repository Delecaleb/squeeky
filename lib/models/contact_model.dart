class ContactModel {
  String businessName, businessCity, businessLogo, businessId, serviceStatus, dateBooked, lastMessage ;

  ContactModel({ required this.lastMessage,required this.dateBooked,required this.serviceStatus,required this.businessCity, required this.businessLogo, required this.businessName, required this.businessId});

  factory ContactModel.fromJson(Map<String, dynamic> mapData){
    return ContactModel( lastMessage:mapData['last_message_content'].toString(),dateBooked: mapData['created_at'],serviceStatus: mapData['service_status'] ,businessCity: mapData['business_city'].toString(), businessLogo: mapData['business_logo'].toString(), businessName: mapData['business_name'], businessId:mapData['business_id']);
  }
}