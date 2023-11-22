


class ServicesModel {
  final String id;
  final String businessId;
  final String serviceName;
  final String servicePrice;
  final String haveExtras;
  final String extraCategory;
  final String serviceCategory;
  final String imagePath;
  final List<ExtraModel> extras;

  ServicesModel({
    required this.id,
    required this.businessId,
    required this.serviceName,
    required this.servicePrice,
    required this.haveExtras,
    required this.extraCategory,
    required this.serviceCategory,
    required this.imagePath,
    required this.extras,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) {
    // Convert the extras list from JSON to a list of ExtraModel
    List<dynamic> extrasJson = json['extra'] ?? [];
    List<ExtraModel> extrasList = extrasJson.map((e) => ExtraModel.fromJson(e)).toList();

    return ServicesModel(
      id: json['id'],
      businessId: json['business_id'],
      serviceName: json['service_name'],
      servicePrice: json['service_price'],
      haveExtras: json['have_extras'].toString(),
      extraCategory: json['extra_category'].toString(),
      serviceCategory: json['service_category'],
      imagePath: json['image_path'],
      extras: extrasList,
    );
  }
}

class ExtraModel {
  final String extraName;
  final String extraPrice;

  ExtraModel({
    required this.extraName,
    required this.extraPrice,
  });

  factory ExtraModel.fromJson(Map<String, dynamic> json) {
    return ExtraModel(
      extraName: json['extra_name'],
      extraPrice: json['extra_price'],
    );
  }
}
