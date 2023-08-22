import 'package:cloud_firestore/cloud_firestore.dart';

class JobModel {
  late String jobName;
  late String jobId;
  late String employerId;
  late String jobCategory;
  late String jobType;
  late String jobSalary;
  late String expireDate;
  late String educationLevel;
  late String experienceYear;
  // late String responsibilities;
  late String jobDescription;
  late Timestamp? currentTime;

  JobModel(

      {
        this.jobName = '',
        this.jobId = '',
        this.employerId = '',
        this.jobCategory = '',
        this.jobType = '',
        this.jobSalary = '',
        this.expireDate = '',
        this.educationLevel = '',
        this.experienceYear='',
        // this.responsibilities = '',
        this.jobDescription = '',
        this.currentTime ,
      }

      ) ;

  factory JobModel.fromJson(Map<String, dynamic> parsedJson) {
    return JobModel(
      jobName: parsedJson['jobName'] ?? parsedJson['jobName'] ?? '',
      jobId: parsedJson['jobId'] ?? parsedJson['jobId'] ?? '',
      employerId: parsedJson['employerId'] ?? parsedJson['employerId'] ?? '',
      jobCategory: parsedJson['jobCategory'] ?? '',
      jobType: parsedJson['jobType'] ?? '',
      jobSalary: parsedJson['jobSalary'] ?? '',
      expireDate: parsedJson['expireDate'] ?? '',
      educationLevel: parsedJson['educationLevel'] ?? '',
      experienceYear: parsedJson['experienceYear'] ?? '',
      jobDescription: parsedJson['jobDescription'] ?? '',
      currentTime: parsedJson['currentTime'] != null
          ? Timestamp.fromMillisecondsSinceEpoch(
        (parsedJson['currentTime'] as Timestamp).millisecondsSinceEpoch,
      )
          : null, // Parse the DateTime value
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jobName': jobName,
      'jobId': jobId,
      'employerId':employerId,
      'jobCategory': jobCategory,
      'jobType': jobType,
      'jobSalary': jobSalary,
      'expireDate': expireDate,
      'educationLevel': educationLevel,
      'experienceYear': experienceYear,
      'jobDescription': jobDescription,
      'currentTime':currentTime
    };
  }
}
