class BusinessCategory {
  String storeName, storeImage;
  int storeId;

  BusinessCategory({required this.storeId, required this.storeImage, required this.storeName});

  factory BusinessCategory.fromJson(Map<String, dynamic> mapData) {
    return BusinessCategory(
      storeName: mapData['categoryName'],
      storeId: mapData['id'],
      storeImage:"https://picsum.photos/250?image=1",
    );
}

}


