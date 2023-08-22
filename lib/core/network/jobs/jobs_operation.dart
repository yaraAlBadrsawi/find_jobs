import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project/core/model/application/application.dart';
import 'package:graduation_project/core/model/job.dart';
import 'package:uuid/uuid.dart';
import '../../../../config/firebase_constants.dart';

class JobsDB {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<bool> addJobToDB(JobModel job) async {
    // var random = Random().nextInt(_fireStore.collection(FireBaseConstants.jobsCollection).path.length);
    // DocumentSnapshot randomDoc = _fireStore.collection.docs[random];
    //
    // print('RANDOM => $random');
    String uuid = Uuid().v4();

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
    JobModel jobModel = JobModel();
    List<JobModel> jobsList = [];
    String employerId;
    var data;
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _fireStore.collection(FireBaseConstants.jobsCollection).get();

    for (var doc in querySnapshot.docs) {
      var data = doc.data();
      print('DOC . DATA =>>>>>>>>>>>>>>> ${data}');
      if (data['employerId'] == uid) {
        jobsList.add(JobModel.fromJson(data));
        // continue; // Assuming you want to return only one job matching the employerId
      }
    }

    print('MY JOB LIST IS =>>>>>> ${jobsList.length}');
    return jobsList;
  }

  getSpecificJob(String jobId) async {
    JobModel jobModel = JobModel();
    List<JobModel> jobsList = [];
    String employerId;
    var data;
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await _fireStore.collection(FireBaseConstants.jobsCollection).get();

    for (var doc in querySnapshot.docs) {
      var data = doc.data();
      if (jobId == data['jobId']) {
        jobsList.add(JobModel.fromJson(data));
      }
    }

    print('MY JOB LIST IS =>> ${jobsList.length}');
    return jobsList;
  }

  getJobSeekerJobs() async {
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

    print('MY JOB LIST IS =>> ${jobsList.length}');
    return jobsList;
  }

  Future<bool> addApplication(ApplicationModel applicationModel) async {
    try {
      _fireStore
          .collection(FireBaseConstants.jobsCollection)
          .doc(applicationModel.applicationId)
          .collection(FireBaseConstants.applicationCollection)
          .doc(applicationModel.jobSeekerId)
          .set(applicationModel.toJson());

      return true;
    } catch (e) {
      print('Error adding job: $e');
      return false;
    }
  }
}
