class OrdersModel {
  String serviceId, extraCategory, extraPrice,extraValue,timeArrival,bookingDate;
  String servicePrice;
  OrdersModel({required this.serviceId, required this.extraCategory, required this.extraPrice, required this.extraValue, required this.bookingDate, required this.timeArrival, required this.servicePrice});

  factory OrdersModel.fromJson(Map<String, dynamic>jsonData){
    return OrdersModel(
      serviceId: jsonData['service_id'], 
      extraCategory: jsonData['extra_category'], 
      extraPrice: jsonData['extra_price'], 
      extraValue: jsonData['extra_value'], 
      bookingDate: jsonData['booking_date'], 
      timeArrival: jsonData['time_of_arrival'],
      servicePrice:jsonData['price'],
      ); 
  }
}