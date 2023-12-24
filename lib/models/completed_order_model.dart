class CompletedOrderModel{
  String businessName, imagePath, amount;
  
  final List<CompletedServiceModel> servicesOfferedList;
  
  CompletedOrderModel({required this.businessName, required this.imagePath, required this.amount, required this.servicesOfferedList});

  factory CompletedOrderModel.fromJson(Map<String, dynamic>mapData){
    
    List<dynamic> serviceMap = mapData['services'];

    List<CompletedServiceModel> services = serviceMap.map((e) => CompletedServiceModel.fromJson(e)).toList();

    return CompletedOrderModel( businessName: mapData['business_name'], imagePath: mapData['cover_image'], amount: mapData[''].toString(), servicesOfferedList: services);
  }

}

class CompletedServiceModel {
   String serviceName, extraCategory, extraValue, orderId, dateCompleted;
   
   CompletedServiceModel({required this.dateCompleted, required this.orderId, required this.serviceName, required this.extraCategory, required this.extraValue});
   
   factory CompletedServiceModel.fromJson(Map<String, dynamic>mapdata){
    return CompletedServiceModel(orderId: mapdata['payment_item_number'].toString(), dateCompleted: mapdata[''].toString(), serviceName: mapdata['service_name'], extraCategory: mapdata['extra_category'].toString(), extraValue: mapdata['extra_value'].toString());
   }

 }