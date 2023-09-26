import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/core/model/employer/employer_model.dart';
import 'package:graduation_project/core/network/auth/auth.dart';

import '../../../config/firebase_constants.dart';
import '../../model/job_seeker/job_seeker_model.dart';
import '../../model/user.dart';
import '../../resources/colors_mangaer.dart';
import '../../resources/strings_manager.dart';

final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

// to manage all type of user in the app
class UsersDB {
  // insert
  static Future<bool> addAllUserInDB(UserModel user) async {
    try {
      await _fireStore
          .collection(FireBaseConstants.userCollection)
          .doc(user.userID)
          .set(user.toJson());
      return true;
    } catch (error) {
      print('error happen while save =${error}');

      return false;
    }
  }

  static Future<UserModel> getCurrentUser(String? uid) async {
    DocumentSnapshot<Map<String, dynamic>> userDocument = await _fireStore
        .collection(FireBaseConstants.userCollection)
        .doc(uid)
        .get();
    if (userDocument.data() != null && userDocument.exists) {
      print('user data come from firestore => ${userDocument.data()!}');
      return UserModel.fromJson(userDocument.data()!);
    } else {
      return UserModel();
    }
  }
}

// to manage all employer user in the app
class EmployerDB {
  Future<bool> addEmployerToDB(EmployerModel employer) async {
    User currentUser = await Authenticate().getUser;

    UserModel? userModel = await UsersDB.getCurrentUser(currentUser.uid);

    try {
      await _fireStore
          .collection(FireBaseConstants.userCollection)
          .doc(currentUser.uid)
          .update(employer.toJson());

      return true; // Successfully updated
    } catch (error) {
      print("Error updating employer: $error");
      return false; // Failed to update
    }
  }

  Future<EmployerModel> getEmployers(String? uid) async {
    DocumentSnapshot<Map<String, dynamic>> userDocument = await _fireStore
        .collection(FireBaseConstants.userCollection)
        .doc(uid)
        .get();
    if (userDocument.data() != null && userDocument.exists) {
      return EmployerModel.fromJson(userDocument.data()!);
    } else {
      return EmployerModel();
    }
  }
}

class JobSeekerDB {
  Future<bool> addInterestsToDB(List<dynamic> interests) async {
    try {
      User currentUser = await Authenticate().getUser;
      UserModel? userModel = await UsersDB.getCurrentUser(currentUser.uid);
      print('user Model is = ${userModel!.userID}');
      await _fireStore
          .collection(FireBaseConstants.userCollection)
          .doc(currentUser.uid)
          .update({'interests': interests});
      return true; // Return true if the update is successful
    } catch (error) {
      print('Error updating interests: $error');
      return false; // Return false if an error occurs
    }
  }

  Future<List<dynamic>> getInterestsFromDB(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userSnapshot = await _fireStore
          .collection(FireBaseConstants.userCollection)
          .doc(userId)
          .get();

      print('user snapshot => ${userSnapshot.data()}');
      print('user snapshot => ${userSnapshot.data()!['email']} ');

      if (userSnapshot.exists) {
        // If the user document exists, retrieve the 'interests' field.
        List<dynamic> interests = userSnapshot.data()?['interests'];
        print('user interest  => ${userSnapshot.data()!['interests']} ');

        return interests;
      } else {
        // Handle the case where the user document doesn't exist.
        return [];
      }
    } catch (error) {
      // Handle any errors that occur during the fetch.
      print('Error fetching interests: $error');
      return [];
    }
  }

  Future<bool> addJobSeekerToDB(JobSeekerModel jobSeeker) async {
    User currentUser = await Authenticate().getUser;
    UserModel? userModel = await UsersDB.getCurrentUser(currentUser.uid);
    try {
      await _fireStore
          .collection(FireBaseConstants.userCollection)
          .doc(currentUser.uid)
          .update(jobSeeker.toJson());

      return true; // Successfully updated
    } catch (error) {
      print("Error updating job seeker: $error");
      return false; // Failed to update
    }
  }

  Future<JobSeekerModel> getJobSeeker(String? uid) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> userDocument = await _fireStore
          .collection(FireBaseConstants.userCollection)
          .doc(uid)
          .get();

      print('USER IN FIRESTORE  => ${userDocument.data()!.isEmpty}');
      print('USER IN FIRESTORE  => ${userDocument.data()}');
      print('USER IN FIRESTORE  VALUES => ${userDocument.data()!.values}');
      print('USER IN FIRESTORE  Exists  => ${userDocument.exists}');
      print('USER IN FIRESTORE  userDocument.data() != null  => ${userDocument.data() != null}');

      if (userDocument.data() != null && userDocument.exists) {
        print('userDocument.data()! => ${userDocument.data()!}');
        print(
            'Current job seeker is => ${JobSeekerModel.fromJson(userDocument.data()!).about}');
        return JobSeekerModel.fromJson(userDocument.data()!);
      } else {
        return JobSeekerModel(); // Return a default model if the document doesn't exist
      }
    } catch (error) {
      // Handle any errors that occur during the document retrieval process.
      print('Error fetching job seeker: $error');
      throw error; // You can choose to rethrow the error or return a default value.
    }
  }
}
