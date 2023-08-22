class JobSeekerModel {
  late String name;
  late String email;
  late String phone;
  late String userType;
  late String address;
  late String description;
  late String? socialMedia; // empty allow
  late String imageUrl;
  late List<String > interests;



  JobSeekerModel({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.userType = '',
    this.address = '',
    this.description = '',
    this.socialMedia,
    this.imageUrl = '',
    this.interests= const [],
  });

  factory JobSeekerModel.fromJson(Map<String, dynamic> parsedJson) {
    return JobSeekerModel(
      name: parsedJson['name'] ?? '',
      email: parsedJson['email'] ?? '',
      phone: parsedJson['phone'] ?? '',
      userType: parsedJson['userType'] ?? '',
      address: parsedJson['address'] ?? '',
      description: parsedJson['description'] ?? '',
      socialMedia: parsedJson['socialMedia'],
      imageUrl: parsedJson['imageUrl'] ?? '',
      interests: List<String>.from(parsedJson['interests'] ?? []), // Deserialize new field

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'userType': userType,
      'address': address,
      'description': description,
      'socialMedia': socialMedia,
      'imageUrl': imageUrl,
      'interests': interests, // Serialize new field

    };
  }

}