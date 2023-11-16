class ServicesModel {
  String id, businessId, serviceCategoryId,servicePrice;
  String serviceName, serviceCategory, imagePath;

  ServicesModel({required this.businessId, required this.serviceCategory, required this.serviceName, required this.servicePrice, required this.imagePath, required this.serviceCategoryId, required this.id});

  factory ServicesModel.fromJson(Map<String, dynamic>mapData){
    return ServicesModel(businessId: mapData['business_id'], serviceCategory: mapData['service_category'], serviceName: mapData['service_name'], servicePrice: mapData['service_price'], imagePath: mapData['image_path'], serviceCategoryId: mapData['id'], id: mapData['id']);
  }
}