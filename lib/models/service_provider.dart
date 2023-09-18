class ServiceProvidersModel {
  String storeName, storeImage;
  String storeId;

  ServiceProvidersModel({required this.storeId, required this.storeImage, required this.storeName});

  // factory ServiceProvidersModel.fromJson(Map<String, dynamic> mapData){
  //   return ServiceProvidersModel(storeId: mapData['storeID'], storeImage: mapData['storeImage'], storeName: mapData['storeName']);
  // }

  factory ServiceProvidersModel.fromJson(Map<String, dynamic> mapData) {
    return ServiceProvidersModel(
      storeName: mapData['storeName'],
      storeId: mapData['storeId'],
      storeImage: mapData['storeImage'],
    );
  // try {
  //   return ServiceProvidersModel(
  //     storeName: mapData['storeName'],
  //     storeId: mapData['storeId'],
  //     storeImage: mapData['storeImage'],
  //   );
  // } catch (e) {
  //   print("Error parsing JSON data: $e");
  //   return ServiceProvidersModel(storeId: 'test', storeImage: 'https://picsum.photos/250?image=1', storeName: 'namwe', ); // Return a default object or handle the error as needed.
  // }
}

}


