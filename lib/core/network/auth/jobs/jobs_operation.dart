import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project/core/model/job.dart';

import '../../../../config/firebase_constants.dart';

class JobsInsert {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<bool> addJobToDB(JobModel job) async {
    await _fireStore
        .collection(FireBaseConstants.jobsCollection)
        .doc()
        .set(job.toJson())
        .then((value) => true, onError: (e) => false);

    return false;
  }
}
