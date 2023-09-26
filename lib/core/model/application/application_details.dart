import 'package:graduation_project/core/model/employer/employer_model.dart';
import 'package:graduation_project/core/model/job_seeker/job_seeker_model.dart';

import '../job.dart';
import 'application.dart';

class Application {
  final JobModel job;
  final JobSeekerModel jobSeeker;
  final ApplicationModel application;
  final EmployerModel employer;

  Application(
      {required this.job,
      required this.jobSeeker,
      required this.application,
      required this.employer});

  // Empty constructor
  Application.empty()
      : job = JobModel(),
        // You should replace these with appropriate default values or empty constructors
        jobSeeker = JobSeekerModel(),
        application = ApplicationModel(),
        employer = EmployerModel();
}
