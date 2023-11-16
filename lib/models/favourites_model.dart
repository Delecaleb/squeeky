class FavouritesModel {
  String businessId, imagePath, businessName, businessDescription;

  FavouritesModel({required this.businessId, required this.businessName, required this.businessDescription, required this.imagePath });

  factory FavouritesModel.fromJson(Map<String, dynamic> mapData){
    return FavouritesModel(businessId: mapData['business_id'], businessName: mapData['business_name'], businessDescription: mapData['business_description'], imagePath: mapData['cover_image']);
  }
}