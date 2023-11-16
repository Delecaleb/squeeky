class UserModel {
  String firstName,
      lastName,
      emailAddress,
      occupation,
      password,
      address,
      city,
      country,
      postalCode,
      imagePath;
  int contact;

  UserModel(
      {required this.firstName,
      required this.lastName,
      required this.emailAddress,
      required this.occupation,
      required this.password,
      required this.address,
      required this.city,
      required this.country,
      required this.postalCode,
      required this.imagePath,
      required this.contact,
      }
      );
  factory UserModel.fromJson(Map<String, dynamic>data){
    return UserModel(
      firstName: data['firstName'], 
      lastName: data['lastName'], 
      emailAddress: data['emailAddress'], 
      occupation: data['occupation'], 
      password: data['password'], 
      address: data['address'], 
      city: data['city'], 
      country: data['country'],
      postalCode: data['postalCode'], 
      imagePath: data['imagePath'],
      contact: data['contact']
      );
  }
}
