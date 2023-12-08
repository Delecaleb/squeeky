class NotificationsModel {
  String id; 
  String details, imagePath, date;
  NotificationsModel({required this.id, required this.details, required this.imagePath, required this.date});

  factory NotificationsModel.fromJson(Map<String, dynamic> jsonData){
    return NotificationsModel(id: jsonData['id'].toString(), details: jsonData['details'], imagePath: jsonData['imagePath'].toString(), date: jsonData['sent_at']);
  }
}