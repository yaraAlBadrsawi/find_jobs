class UserModel {
  late String userID;
  late String name;
  late String email;
  late String userType; // 0 => job seeker , 1=> employer , 3=> tow type together



  UserModel({
    this.userID = '',
    this.email = '',
    this.name = '',

    this.userType = '', // Default to job seeker
  });

  factory UserModel.fromJson(Map<String, dynamic> parsedJson) {
    return UserModel(
      userID: parsedJson['id'] ?? parsedJson['userID'] ?? '',
      email: parsedJson['email'] ?? '',
      name: parsedJson['name'] ?? '',
      userType: parsedJson['userType'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': userID,
      'email': email,
      'name': name,
      'userType': userType,

      // 'password': profilePictureURL,
      // 'appIdentifier': appIdentifier
    };
  }
}


// Define the UserType enum
enum UserType {
  jobSeeker,
  employer,
  both,
}