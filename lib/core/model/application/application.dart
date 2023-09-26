import 'package:cloud_firestore/cloud_firestore.dart';

class ApplicationModel {
  late String jobId;
  late String applicationId;
  late String jobSeekerId;
  late Timestamp? applyTime;
  late bool applicationStatus;
  late bool isReview;

  ApplicationModel({
    this.jobId = '',
    this.applicationId = '',
    this.jobSeekerId = '',
    this.applicationStatus = false,
    this.applyTime,
    this.isReview= false ,
  });

  factory ApplicationModel.fromJson(Map<String, dynamic> parsedJson) {
    return ApplicationModel(
      jobId: parsedJson['jobId'] ?? parsedJson['jobId'] ?? '',
      applicationId:
          parsedJson['applicationId'] ?? parsedJson['applicationId'] ?? '',
      jobSeekerId: parsedJson['jobSeekerId'] ?? '',
      applicationStatus: parsedJson['applicationStatus'] ?? '',
      isReview: parsedJson['isReview'] ?? '',
      applyTime: parsedJson['applyTime'] != null
          ? Timestamp.fromMillisecondsSinceEpoch(
              (parsedJson['applyTime'] as Timestamp).millisecondsSinceEpoch,
            )
          : null, // Parse the DateTime value
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jobId': jobId,
      'applicationId': applicationId,
      'jobSeekerId': jobSeekerId,
      'applicationStatus': applicationStatus,
      'isReview': isReview,
      'applyTime': applyTime,
      // 'password': profilePictureURL,
      // 'appIdentifier': appIdentifier
    };
  }
}
