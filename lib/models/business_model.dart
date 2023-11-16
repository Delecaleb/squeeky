class BusinessModel {
  final String id;
  final String business_name;
  final String? imagePath;
  final String businessEmail;
  final String businessDesc;
  final String businessId;

  BusinessModel({
    required this.id,
    required this.business_name,
    this.imagePath,
    required this.businessEmail,
    required this.businessDesc,
    required this.businessId,
  });

  factory BusinessModel.fromJson(Map<String, dynamic> json) {
    return BusinessModel(
      id: json['business_id'],
      business_name: json['business_name'],
      imagePath: json['business_logo'],
      businessEmail: json['business_email'],
      businessDesc : json['business_description'],
      businessId : json['business_id'],
    );
  }
}
