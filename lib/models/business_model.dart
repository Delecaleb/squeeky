class BusinessModel {
  final String id;
  final String business_name;
  final String? imagePath;
  final String businessEmail;
  final String businessDesc;
  final String businessId;
  final String businessPostCode;
  final String businessCity;
  final String businessCountry;
  final String businessAddress;
  String businessRating;
  String businessRatingCount;
  BusinessModel({
    required this.id,
    required this.business_name,
    this.imagePath,
    required this.businessEmail,
    required this.businessDesc,
    required this.businessId,
    required this.businessAddress,
    required this.businessCity,
    required this.businessCountry,
    required this.businessPostCode,
    required this.businessRating,
    required this.businessRatingCount,
  });

  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      id: json['business_id'],
      businessRating: json['average_rating'],
      businessRatingCount: json['rating_count'],
      business_name: json['business_name'].toString(),
      imagePath: json['cover_image'],
      businessEmail: json['business_email'],
      businessDesc : json['business_description'],
      businessId : json['business_id'],
      businessAddress: json['business_address'].toString(),
      businessCity: json['business_city'].toString(),
      businessCountry: json['business_country'].toString(),
      businessPostCode: json['business_postal_code'].toString(),
    );
  }
}
