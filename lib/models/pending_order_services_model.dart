class PendingServiceModel {
   String serviceName, extraCategory, extraValue, orderId, paymentId, dateCompleted, serviceTotal, serviceId;
   
   PendingServiceModel({required this.serviceId,required this.dateCompleted, required this.orderId,  required this.paymentId, required this.serviceName, required this.extraCategory, required this.extraValue, required this.serviceTotal});
   
   factory PendingServiceModel.fromJson(Map<String, dynamic>mapdata){
    return PendingServiceModel( serviceId:mapdata['service_id'],paymentId:mapdata['payment_item_number'], serviceTotal:mapdata['price'], orderId: mapdata['id'].toString(), dateCompleted: mapdata[''].toString(), serviceName: mapdata['service_name'], extraCategory: mapdata['extra_category'].toString(), extraValue: mapdata['extra_value'].toString());
   }

 }