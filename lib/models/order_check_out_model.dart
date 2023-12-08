class OrderData {
  String businessId;
  String businessName;
  List<Service> services;

  OrderData({
    required this.businessId,
    required this.businessName,
    required this.services,
  });
}

class Service {
  String id;
  String userId;
  String serviceId;
  String serviceName;
  String price;
  String quantity;
  String timeOfArrival;
  String extraCategory;
  String extraValue;
  String extraPrice;
  String bookingDate;
  String createdAt;
  String isActive;
  String status;

  Service({
    required this.id,
    required this.userId,
    required this.serviceId,
    required this.serviceName,
    required this.price,
    required this.quantity,
    required this.timeOfArrival,
    required this.extraCategory,
    required this.extraValue,
    required this.extraPrice,
    required this.bookingDate,
    required this.createdAt,
    required this.isActive,
    required this.status,
  });
}
