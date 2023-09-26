class JobSeekerModel {
  late String name;
  late String email;
  late String phone;
  late String userType;
  late String address;
  late String about;
  late String? socialMedia; // empty allow
  late String imageUrl;
  late List<dynamic> interests;
  late String  experience;

  JobSeekerModel({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.userType = '',
    this.address = '',
    this.about = '',
    this.socialMedia,
    this.imageUrl = '',
    this.interests= const [],
    this.experience= '',
  });

  factory JobSeekerModel.fromJson(Map<String, dynamic> parsedJson) {
    return JobSeekerModel(
      name: parsedJson['name'] ?? '',
      email: parsedJson['email'] ?? '',
      phone: parsedJson['phone'] ?? '',
      userType: parsedJson['userType'] ?? '',
      address: parsedJson['address'] ?? '',
      about: parsedJson['about'] ?? '',
      socialMedia: parsedJson['socialMedia'],
      imageUrl: parsedJson['imageUrl'] ?? '',
      experience: parsedJson['experience'] ?? '',
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
      'about': about,
      'socialMedia': socialMedia,
      'imageUrl': imageUrl,
      'experience': experience,
      'interests': interests, // Serialize new field

    };
  }

}