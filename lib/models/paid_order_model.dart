class PaidOrderModel{
  String businessName, businessLogo, imagePath, total,  dateCompleted, serviceCharge, subTotal, businessId, serviceStatus;
  
  final List<CompletedServiceModel> servicesOfferedList;
  
  PaidOrderModel({ required this.businessLogo, required this.serviceStatus, required this.businessId, required this.subTotal ,required this.businessName, required this.imagePath, required this.serviceCharge, required this.dateCompleted, required this.total, required this.servicesOfferedList});

  factory PaidOrderModel.fromJson(Map<String, dynamic>mapData){
    
    List<dynamic> serviceMap = mapData['services'];

    List<CompletedServiceModel> services = serviceMap.map((e) => CompletedServiceModel.fromJson(e)).toList();

    return PaidOrderModel(businessLogo: mapData['business_logo'], serviceStatus: mapData['service_status'].toString(),businessId:mapData['business_id'], subTotal:mapData['sub_total'] ,businessName: mapData['business_name'], imagePath: mapData['cover_image'], total: mapData['total'], servicesOfferedList: services, dateCompleted:mapData['date_completed'], serviceCharge:mapData['service_fee'].toString());
  }

}

class CompletedServiceModel {
   String serviceName, extraCategory, extraValue, orderId, paymentId, dateCompleted, serviceTotal, serviceId;
   
   CompletedServiceModel({required this.serviceId,required this.dateCompleted, required this.orderId,  required this.paymentId, required this.serviceName, required this.extraCategory, required this.extraValue, required this.serviceTotal});
   
   factory CompletedServiceModel.fromJson(Map<String, dynamic>mapdata){
    return CompletedServiceModel( serviceId:mapdata['service_id'],paymentId:mapdata['payment_item_number'], serviceTotal:mapdata['price'], orderId: mapdata['id'].toString(), dateCompleted: mapdata[''].toString(), serviceName: mapdata['service_name'], extraCategory: mapdata['extra_category'].toString(), extraValue: mapdata['extra_value'].toString());
   }

 }