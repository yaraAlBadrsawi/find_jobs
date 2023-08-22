import '../user.dart';

class EmployerModel {
  late String name;
  late String email;
  late String phone;
  late String userType;
  late String address;
  late String description;
  late String sizeAndIndustry;
  late String? socialMedia; // empty allow
  late String companyAchievements; // empty allow
  late String imageUrl;

  EmployerModel({
    this.name = '',
    this.email = '',
    this.phone = '',
    this.userType = '',
    this.address = '',
    this.description = '',
    this.sizeAndIndustry = '',
    this.socialMedia = '',
    this.companyAchievements = '',
    this.imageUrl = '',
  });

  factory EmployerModel.fromJson(Map<String, dynamic> parsedJson) {
    return EmployerModel(
      name: parsedJson['name'] ?? '',
      email: parsedJson['email'] ?? '',
      phone: parsedJson['phone'] ?? '',
      userType: parsedJson['userType'] ?? '',
      address: parsedJson['address'] ?? '',
      description: parsedJson['description'] ?? '',
      sizeAndIndustry: parsedJson['sizeAndIndustry'] ?? '',
      socialMedia: parsedJson['socialMedia'],
      companyAchievements: parsedJson['companyAchievements'] ?? '',
      imageUrl: parsedJson['imageUrl'] ?? '',
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
      'sizeAndIndustry': sizeAndIndustry,
      'socialMedia': socialMedia,
      'companyAchievements': companyAchievements,
      'imageUrl': imageUrl,
    };
  }
}
