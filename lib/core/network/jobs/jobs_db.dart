import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project/config/constants.dart';
import 'package:graduation_project/core/model/application/application.dart';
import 'package:graduation_project/core/model/employer/employer_model.dart';
import 'package:graduation_project/core/model/job.dart';
import 'package:graduation_project/core/model/job_seeker/job_seeker_model.dart';
import 'package:graduation_project/core/network/auth/user_db.dart';
import 'package:uuid/uuid.dart';
import '../../../../config/firebase_constants.dart';
import '../../model/jobs.dart';

class JobsDB {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  Future<List> searchFromFirebase(String jobName) async {
    final result = await FirebaseFirestore.instance
        .collection(FireBaseConstants.jobsCollection)
        .where('jobName', arrayContains: jobName)
        .get();

    return result.docs.map((e) => e.data()).toList();
//    searchResult

  }

  Future<bool> addJobToDB(JobModel job) async {
    String uuid = const Uuid().v4();
    print('Random UUID generator is => $uuid');
    try {
      await _fireStore
          .collection(FireBaseConstants.jobsCollection)
          .doc(job.jobId)
          .set(job.toJson());

      return true; // Return true if the Firestore operation is successful
    } catch (e) {
      print('Error adding job: $e');
      return false; // Return false if there's an error
    }
    // .then((value) => true, onError: (e) => false);;
  }

  Future<List<JobModel>> getEmployerJobs(String uid) async {
    List<JobModel> jobsList = [];
    List<JobWithEmployer> jobWithEmployer=[];
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await _fireStore.collection(FireBaseConstants.jobsCollection).get();
    for (var doc in querySnapshot.docs) {
      var data = doc.data();
      if (data['employerId'] == uid) {

        jobsList.add(JobModel.fromJson(data));
      }
    }
    return jobsList;
  }


  Future<List<JobWithEmployer>> getEmployerWithJobs(String uid) async {
    JobModel jobModel = JobModel();
    List<JobModel> jobsList = [];

    List<JobWithEmployer> jobWithEmployer=[];
EmployerModel employer ;
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _fireStore.collection(FireBaseConstants.jobsCollection).get();


    for (var doc in querySnapshot.docs) {
      var data = doc.data();
      if (data['employerId'] == uid) {

        employer =await EmployerDB().getEmployers(uid) ;
        print('Current Employer => ${employer.name}');
        print('Current job => ${JobModel.fromJson(data)}' ) ;
        jobWithEmployer.add(JobWithEmployer(job: JobModel.fromJson(data),
            employer: await EmployerDB().getEmployers(uid)));
       // jobsList.add(JobModel.fromJson(data));
        // continue; // Assuming you want to return only one job matching the employerId
      }
    }
    return jobWithEmployer;
  }

  Future<bool> deleteJob(jobId) async {
    try {
      await _fireStore
          .collection(FireBaseConstants.jobsCollection)
          .doc(jobId)
          .delete()
          .then((value) => print('Job deleted successfully'));

      return true; // Return true when deletion is successful
    } catch (error) {
      print('Error deleting job: $error');
      // Handle the error here if needed
      return false; // Return false when an error occurs
    }
  }

  Future<bool> editJob(String jobId, JobModel newJob) async {
    try {
      await _fireStore
          .collection(FireBaseConstants.jobsCollection)
          .doc(jobId)
          .update(newJob.toJson());
      return true; // Data updated successfully
    } catch (error) {
      print("Error updating job: $error");
      return false; // Data not updated
    }
  }

  Future<List<JobModel>> getJobById(String jobId) async {
    List<JobModel> jobsList = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _fireStore.collection(FireBaseConstants.jobsCollection).get();
    for (var doc in querySnapshot.docs) {
      var data = doc.data();
      if (jobId == data['jobId']) {
        jobsList.add(JobModel.fromJson(data));
      }
    }
    return jobsList;
  }

  //get all job in app
  Future<List<JobModel>> getJobSeekerJobs() async {
    JobModel jobModel = JobModel();
    List<JobModel> jobsList = [];
    String employerId;
    var data;
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _fireStore.collection(FireBaseConstants.jobsCollection).get();

    for (var doc in querySnapshot.docs) {
      var data = doc.data();
      jobsList.add(JobModel.fromJson(data));
    }
    return jobsList;
    // print('MY JOB LIST IS =>> ${jobsList.length}');
    // return jobsList;
  }

  Future<List<JobWithEmployer>> getRecentlyJobs() async {
    try {
      List<JobWithEmployer> jobsWithEmployers = [];

      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _fireStore
          .collection(FireBaseConstants.jobsCollection)
          .orderBy('currentTime',
              descending: true) // Replace with your timestamp field
          .limit(4)
          .get();

      for (var doc in querySnapshot.docs) {
        var data = doc.data();
        EmployerModel employer =
            await EmployerDB().getEmployers(data['employerId']);
        jobsWithEmployers.add(
            JobWithEmployer(job: JobModel.fromJson(data), employer: employer));
      }
      return jobsWithEmployers;
    } catch (error) {
      return []; // Return an empty list or handle the error as needed
    }
  }

  Future<List<JobWithEmployer>> getJobsByCategory(String category) async {
    try {
      List<JobModel> jobsList = [];
      List<JobWithEmployer> jobsWithEmployers = [];
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _fireStore
          .collection(FireBaseConstants.jobsCollection)
          .where('jobCategory', isEqualTo: category)
          .get();
      for (var doc in querySnapshot.docs) {
        var data = doc.data();
        EmployerModel employer =
            await EmployerDB().getEmployers(data['employerId']);
        jobsWithEmployers.add(
            JobWithEmployer(job: JobModel.fromJson(data), employer: employer));
      }

      print('MY JOB LIST IS =>> ${jobsList.length}');
      return jobsWithEmployers;
    } catch (error) {
      print('Error in getJobSeekerJobs: $error');
      return []; // Return an empty list or handle the error as needed
    }
  }

  Future<List<JobWithEmployer>> getRecommendedJobs(String userId) async {
    try {
      List<JobWithEmployer> jobsWithEmployers = [];
      JobSeekerModel jobSeeker = await JobSeekerDB().getJobSeeker(userId);
      List<JobModel> jobsList = [];
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _fireStore.collection(FireBaseConstants.jobsCollection).get();
      for (var interest in jobSeeker.interests) {
        for (var doc in querySnapshot.docs) {
          var data = doc.data();
          jobsList.add(JobModel.fromJson(data));
          if (data['jobCategory'] == interest) {
            JobModel job = JobModel.fromJson(data);
            print('jobCategory ====  ${data['jobCategory']}');
            EmployerModel employer =
                await EmployerDB().getEmployers(job.employerId);
            jobsWithEmployers
                .add(JobWithEmployer(job: job, employer: employer));
          }
        }

        print('job list is => $jobsList');
        print('MY JOB LIST IS =>> ${jobsList.length}');
      }
      return jobsWithEmployers;
    } catch (error) {
      print('Error in getRecommendedJobs: $error');
      return []; // Return an empty list or handle the error as needed
    }
  }
}
