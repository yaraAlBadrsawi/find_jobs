import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project/core/model/employer/employer_model.dart';
import 'package:graduation_project/core/model/job.dart';

class Job {
  late JobModel job;
  late EmployerModel employer;

  Job({
    required this.job,
    required this.employer,
  });

  factory Job.fromJson(Map<String, dynamic> parsedJson) {
    return Job(
      job: JobModel.fromJson(parsedJson['job'] ?? {}),
      employer: EmployerModel.fromJson(parsedJson['employer'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'job': job.toJson(), // Serialize JobModel
      'employer': employer.toJson(), // Serialize JobModel
    };
  }
}
