class ServicesModel {
  int id, businessId, serviceCategoryId,servicePrice;
  String serviceName, serviceCategory;
  Null imagePath;

  ServicesModel({required this.businessId, required this.serviceCategory, required this.serviceName, required this.servicePrice, required this.imagePath, required this.serviceCategoryId, required this.id});

  factory ServicesModel.fromJson(Map<String, dynamic>mapData){
    return ServicesModel(businessId: mapData['businessId'], serviceCategory: mapData['serviceCategory'], serviceName: mapData['serviceName'], servicePrice: mapData['servicePrice'], imagePath: mapData['imagePath'], serviceCategoryId: mapData['serviceCategoryId'], id: mapData['id']);
  }
}