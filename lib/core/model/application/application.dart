import 'package:cloud_firestore/cloud_firestore.dart';

class ApplicationModel {
  late String applicationId;
  late String jobSeekerId;
  late Timestamp? applyTime;
  late bool applicationStatus;

  ApplicationModel({
    this.applicationId = '',
    this.jobSeekerId = '',
    this.applicationStatus = false,
    this.applyTime,
  });

  factory ApplicationModel.fromJson(Map<String, dynamic> parsedJson) {
    return ApplicationModel(
      applicationId:
          parsedJson['applicationId'] ?? parsedJson['applicationId'] ?? '',
      jobSeekerId: parsedJson['jobSeekerId'] ?? '',
      applicationStatus: parsedJson['applicationStatus'] ?? '',
      applyTime: parsedJson['applyTime'] != null
          ? Timestamp.fromMillisecondsSinceEpoch(
              (parsedJson['currentTime'] as Timestamp).millisecondsSinceEpoch,
            )
          : null, // Parse the DateTime value
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'applicationId': applicationId,
      'jobSeekerId': jobSeekerId,
      'applicationStatus': applicationStatus,
      'applyTime': applyTime,

      // 'password': profilePictureURL,
      // 'appIdentifier': appIdentifier
    };
  }
}
