class CompletedOrderModel{
  String businessName, imagePath, total, dateCompleted, serviceCharge, subTotal;
  
  final List<CompletedServiceModel> servicesOfferedList;
  
  CompletedOrderModel({required this.subTotal ,required this.businessName, required this.imagePath, required this.serviceCharge, required this.dateCompleted, required this.total, required this.servicesOfferedList});

  factory CompletedOrderModel.fromJson(Map<String, dynamic>mapData){
    
    List<dynamic> serviceMap = mapData['services'];

    List<CompletedServiceModel> services = serviceMap.map((e) => CompletedServiceModel.fromJson(e)).toList();

    return CompletedOrderModel(subTotal:mapData['sub_total'] ,businessName: mapData['business_name'], imagePath: mapData['cover_image'], total: mapData['total'], servicesOfferedList: services, dateCompleted:mapData['date_completed'], serviceCharge:mapData['service_fee'].toString());
  }

}

class CompletedServiceModel {
   String serviceName, extraCategory, extraValue, orderId, dateCompleted, serviceTotal;
   
   CompletedServiceModel({required this.dateCompleted, required this.orderId, required this.serviceName, required this.extraCategory, required this.extraValue, required this.serviceTotal});
   
   factory CompletedServiceModel.fromJson(Map<String, dynamic>mapdata){
    return CompletedServiceModel(serviceTotal:mapdata['price'], orderId: mapdata['payment_item_number'].toString(), dateCompleted: mapdata[''].toString(), serviceName: mapdata['service_name'], extraCategory: mapdata['extra_category'].toString(), extraValue: mapdata['extra_value'].toString());
   }

 }