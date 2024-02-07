class PendingOrdersModel{
  String businessName, imagePath, total,  dateCompleted, serviceCharge, subTotal, businessId, serviceStatus;
  
  final List<PendingServiceModel> servicesOfferedList;
  
  PendingOrdersModel({required this.serviceStatus, required this.businessId, required this.subTotal ,required this.businessName, required this.imagePath, required this.serviceCharge, required this.dateCompleted, required this.total, required this.servicesOfferedList});

  factory PendingOrdersModel.fromJson(Map<String, dynamic>mapData){
    
    List<dynamic> serviceMap = mapData['services'];

    List<PendingServiceModel> services = serviceMap.map((e) => PendingServiceModel.fromJson(e)).toList();

    return PendingOrdersModel( serviceStatus: mapData['service_status'].toString(),businessId:mapData['business_id'], subTotal:mapData['sub_total'] ,businessName: mapData['business_name'], imagePath: mapData['cover_image'], total: mapData['total'], servicesOfferedList: services, dateCompleted:mapData['date_completed'], serviceCharge:mapData['service_fee'].toString());
  }

}

class PendingServiceModel {
   String serviceName, extraCategory, extraValue, orderId, paymentId, dateCompleted, serviceTotal, serviceId;
   
   PendingServiceModel({required this.serviceId,required this.dateCompleted, required this.orderId,  required this.paymentId, required this.serviceName, required this.extraCategory, required this.extraValue, required this.serviceTotal});
   
   factory PendingServiceModel.fromJson(Map<String, dynamic>mapdata){
    return PendingServiceModel( serviceId:mapdata['service_id'],paymentId:mapdata['payment_item_number'], serviceTotal:mapdata['price'], orderId: mapdata['id'].toString(), dateCompleted: mapdata[''].toString(), serviceName: mapdata['service_name'], extraCategory: mapdata['extra_category'].toString(), extraValue: mapdata['extra_value'].toString());
   }

 }