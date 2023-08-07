class UserModel {
  late String userID;
  late String name;
  late String email;
  late String phoneNumber;
  late int userType; // 0 => job seeker , 1=> employer , 3=> tow type together



  UserModel({
    this.userID = '',
    this.email = '',
    this.name = '',
    // this.password = '',
    this.phoneNumber = '',
    this.userType =0,
  });

  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    return UserModel(
      userID: parsedJson['id'] ?? parsedJson['userID'] ?? '',
      email: parsedJson['email'] ?? '',
      name: parsedJson['name'] ?? '',
      phoneNumber: parsedJson['phoneNumber'] ?? '',
     userType: parsedJson['userType'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': userID,
      'email': email,
      'name': name,
      'phoneNumber': phoneNumber,
      'userType': userType,

      // 'password': profilePictureURL,
      // 'appIdentifier': appIdentifier
    };
  }
}
