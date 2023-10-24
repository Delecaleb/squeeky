class BusinessModel {
  final int id;
  final String categoryName;
  final String? imagePath;
  final bool isDeleted;
  final DateTime dateAdded;

  BusinessModel({
    required this.id,
    required this.categoryName,
    this.imagePath,
    required this.isDeleted,
    required this.dateAdded,
  });

  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      id: json['id'],
      categoryName: json['categoryName'],
      imagePath: json['imagePath'],
      isDeleted: json['isDeleted'],
      dateAdded: DateTime.parse(json['dateAdded']),
    );
  }
}
