import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project/core/model/employer/employer_model.dart';
import 'package:graduation_project/core/model/job_seeker/job_seeker_model.dart';
import 'package:graduation_project/core/network/auth/user_db.dart';
import 'package:graduation_project/core/network/jobs/jobs_db.dart';
import '../../../config/firebase_constants.dart';
import '../../model/application/application.dart';
import '../../model/application/application_details.dart';
import '../../model/job.dart';

class ApplicationDB {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<bool> addApplication(ApplicationModel applicationModel) async {
    try {
      _fireStore
          .collection(FireBaseConstants.jobsCollection)
          .doc(applicationModel.jobId)
          .collection(FireBaseConstants.applicationCollection)
          .doc(applicationModel.jobSeekerId)
          .set(applicationModel.toJson());

      return true;
    } catch (e) {
      print('Error adding job: $e');
      return false;
    }
  }

  Future<List<ApplicationModel>> getApplications(
      String jobId, String uid) async {
    JobSeekerDB().getJobSeeker(uid);

    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _fireStore
          .collection(FireBaseConstants.jobsCollection)
          .doc(jobId)
          .collection(FireBaseConstants.applicationCollection)
          .get();

      List<ApplicationModel> applications = [];
      for (var documentSnapshot in querySnapshot.docs) {
        if (documentSnapshot.data()['jobSeekerId'] == uid) {
          applications.add(ApplicationModel.fromJson(documentSnapshot.data()));
        }
      }
      return applications;
    } catch (e) {
      print('Error getting applications: $e');
      return [];
    }
  }

  Future<List<Application>> getJobSeekerApplications(String uid) async {
    List<ApplicationModel> applicationsModel = [];
    List<Application> application = [];
    EmployerModel employer;

    JobSeekerDB().getJobSeeker(uid);
    try {
      List<JobModel> allJobs = await JobsDB().getJobSeekerJobs();
      for (var job in allJobs) {
        QuerySnapshot<Map<String, dynamic>> querySnapshot = await _fireStore
            .collection(FireBaseConstants.jobsCollection)
            .doc(job.jobId)
            .collection(FireBaseConstants.applicationCollection)
            .get();

        for (var documentSnapshot in querySnapshot.docs) {
          if (documentSnapshot.data()['jobSeekerId'] == uid) {
            // this application for you
            employer = await EmployerDB().getEmployers(job.employerId);
            applicationsModel
                .add(ApplicationModel.fromJson(documentSnapshot.data()));
            application.add(Application(
              job: job,
              jobSeeker: await JobSeekerDB()
                  .getJobSeeker(documentSnapshot.data()['jobSeekerId']),
              application: ApplicationModel.fromJson(documentSnapshot.data()),
              employer: employer,
            ));
          }
        }
      }

      return application;
    } catch (e) {
      print('Error getting applications: $e');
      return [];
    }
  }

  Future<List<Application>> getEmployerApplications(
      String employerId) async {

    List<Application> application = [];
    EmployerModel employer;
    JobSeekerModel jobSeeker;
    try {
      List<JobModel> employerJobs = await JobsDB().getEmployerJobs(employerId);
      List<ApplicationModel> applications = [];
      for (JobModel job in employerJobs) {
        QuerySnapshot<Map<String, dynamic>> querySnapshot = await _fireStore
            .collection(FireBaseConstants.jobsCollection)
            .doc(job.jobId)
            .collection(FireBaseConstants.applicationCollection)
            .get();

        for (var documentSnapshot in querySnapshot.docs) {
          employer = await EmployerDB().getEmployers(job.employerId);
          jobSeeker = await JobSeekerDB()
              .getJobSeeker(documentSnapshot.data()['jobSeekerId']);
          application.add(Application(
            job: job,
            jobSeeker: jobSeeker,
            application: ApplicationModel.fromJson(documentSnapshot.data()),
            employer: employer,
          ));

          // .add(ApplicationModel.fromJson(documentSnapshot.data()));
        }
      }

      return application;
    } catch (e) {
      print('Error getting applications: $e');
      return [];
    }
  }


  Future<List<Application>> getJobApplications(
      String employerId,String jobId) async {

    List<Application> application = [];
    EmployerModel employer;
    JobSeekerModel jobSeeker;
    try {
      List<JobModel> employerJobs = await JobsDB().getEmployerJobs(employerId);
      List<ApplicationModel> applications = [];
      for (JobModel job in employerJobs) {
        QuerySnapshot<Map<String, dynamic>> querySnapshot = await _fireStore
            .collection(FireBaseConstants.jobsCollection)
            .doc(job.jobId)
            .collection(FireBaseConstants.applicationCollection)
            .get();

        for (var documentSnapshot in querySnapshot.docs) {
          employer = await EmployerDB().getEmployers(job.employerId);
          jobSeeker = await JobSeekerDB()
              .getJobSeeker(documentSnapshot.data()['jobSeekerId']);

          if(job.jobId== jobId){
            application.add(Application(
              job: job,
              jobSeeker: jobSeeker,
              application: ApplicationModel.fromJson(documentSnapshot.data()),
              employer: employer,
            ));
          }


          // .add(ApplicationModel.fromJson(documentSnapshot.data()));
        }
      }

      return application;
    } catch (e) {
      print('Error getting applications: $e');
      return [];
    }
  }


  void getReviewEmployerApplication() {}

  bool updateApplication(   ApplicationModel applicationModel,bool status) {

    try {
      _fireStore
          .collection(FireBaseConstants.jobsCollection)
          .doc(applicationModel.jobId)
          .collection(FireBaseConstants.applicationCollection)
          .doc(applicationModel.jobSeekerId)
          .update({'isReview':true,'applicationStatus':status});

      return true;
    } catch (e) {
      print('Error adding job: $e');
      return false;
    }



  }
}
