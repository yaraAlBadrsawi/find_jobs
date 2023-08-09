class JobModel {
  late String jobName;
  // late String jobId;
  late String employerId;
  late String jobCategory;
  late String jobType;
  late String jobSalary;
  late String expireDate;
  late String educationLevel;
  late String experienceYear;
  // late String responsibilities;
  late String jobDescription;

  JobModel({
    this.jobName = '',
    // this.jobId = '',
    this.employerId = '',
    this.jobCategory = '',
    this.jobType = '',
    this.jobSalary = '',
    this.expireDate = '',
    this.educationLevel = '',
    // this.responsibilities = '',
    this.jobDescription = '',
  });

  factory JobModel.fromJson(Map<String, dynamic> parsedJson) {
    return JobModel(
      jobName: parsedJson['jobName'] ?? parsedJson['jobName'] ?? '',
      // jobId: parsedJson['jobId'] ?? parsedJson['jobId'] ?? '',
      jobCategory: parsedJson['jobCategory'] ?? '',
      jobType: parsedJson['jobType'] ?? '',
      jobSalary: parsedJson['jobSalary'] ?? '',
      expireDate: parsedJson['expireDate'] ?? '',
      educationLevel: parsedJson['educationLevel'] ?? '',
      // responsibilities: parsedJson['responsibilities'] ?? '',
      jobDescription: parsedJson['jobDescription'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jobName': jobName,
      // 'jobId': jobId,
      'jobCategory': jobCategory,
      'jobType': jobType,
      'jobSalary': jobSalary,
      'expireDate': expireDate,
      'educationLevel': educationLevel,
      // 'responsibilities': responsibilities,
      'jobDescription': jobDescription,
    };
  }
}
