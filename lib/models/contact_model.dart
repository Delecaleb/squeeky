class ContactModel {
  String businessName, businessCity, businessLogo ;

  ContactModel({required this.businessCity, required this.businessLogo, required this.businessName});

  factory ContactModel.fromJson(Map<String, dynamic> mapData){
    return ContactModel(businessCity: mapData[''], businessLogo: mapData[''], businessName: mapData['']);
  }
}