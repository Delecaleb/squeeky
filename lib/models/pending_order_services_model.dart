class PendingServiceModel {
   String serviceName, businessName,orderId, paymentId, serviceTotal, serviceId, serviceImage, date, status,location;
   
   PendingServiceModel({ required this.location,required this.status , required this.serviceImage,required this.businessName,required this.serviceId, required this.orderId,  required this.paymentId, required this.serviceName, required this.serviceTotal, required this.date});
   
   factory PendingServiceModel.fromJson(Map<String, dynamic>mapdata){
    return PendingServiceModel(status: mapdata['service_status'],location :mapdata['required_service_location'] ,date: mapdata['created_at'],serviceImage: mapdata['image_path'].toString() ,businessName: mapdata['business_name'],serviceId:mapdata['id'],paymentId:mapdata['payment_item_number'], serviceTotal:mapdata['price'], orderId: mapdata['id'].toString(), serviceName: mapdata['service_name'],);
   }

 }