import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduation_project/config/firebase_constants.dart';

class AddFeedBack{

  CollectionReference feedback = FirebaseFirestore.instance.collection(FireBaseConstants.feedbackCollection);




}