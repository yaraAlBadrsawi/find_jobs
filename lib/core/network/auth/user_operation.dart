import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/core/model/employer/employer_model.dart';
import 'package:graduation_project/core/network/auth/auth.dart';

import '../../../config/firebase_constants.dart';
import '../../model/user.dart';
import '../../resources/colors_mangaer.dart';
import '../../resources/strings_manager.dart';

final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

class UsersDB {
  // insert
  static Future<bool> addAllUserInDB(UserModel user) async {
  try{
    await _fireStore
        .collection(FireBaseConstants.userCollection)
        .doc(user.userID)
        .set(user.toJson());
        return true;


  }
 catch (error) {
    print('Error while saving data: $error');

    Get.snackbar(
    StringsManager.error,
    'Error while saving data',
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: ColorsManager.primary,
    );

    return false;

    }
  }

  static Future<UserModel?> getCurrentUser(String? uid) async {
    DocumentSnapshot<Map<String, dynamic>> userDocument = await _fireStore
        .collection(FireBaseConstants.userCollection)
        .doc(uid)
        .get();
    if (userDocument.data() != null && userDocument.exists) {
      print('user data come from firestore => ${userDocument.data()!}');
      return UserModel.fromJson(userDocument.data()!);
    } else {
      return null;
    }
  }
}

class EmployerDB {
  Future<bool> addEmployerToDB(EmployerModel employer) async {
    User currentUser = await Authenticate().getUser;

    UserModel? userModel = await UsersDB.getCurrentUser(currentUser.uid);

    await _fireStore
        .collection(FireBaseConstants.userCollection)
        .doc(currentUser.uid)
        .update(employer.toJson())
        .then((value) => true)
        .catchError((error) => false);

    return false;
  }

  Future<EmployerModel> getEmployers(String? uid) async {
    DocumentSnapshot<Map<String, dynamic>> userDocument = await _fireStore
        .collection(FireBaseConstants.userCollection)
        .doc(uid)
        .get();
    if (userDocument.data() != null && userDocument.exists) {
      // print('user data come from firestore => ${userDocument.data()!}');
      return EmployerModel.fromJson(userDocument.data()!);
    } else {
      return EmployerModel();
    }
  }
}

class JobSeekerDB{

  Future<bool> addInterestsToDB(List<dynamic> interests) async {
    try {
    User currentUser = await Authenticate().getUser;
    UserModel? userModel = await UsersDB.getCurrentUser(currentUser.uid);

    print(
     'user Model is = ${userModel!.userID}'
    );

    await _fireStore
        .collection(FireBaseConstants.userCollection)
        .doc(currentUser.uid)
        .update({'interests':interests});
    return true; // Return true if the update is successful
    }
    catch (error) {
      print('Error updating interests: $error');
      return false; // Return false if an error occurs
    }

  }


}

class GetUsers {
  getUser() {}
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
}

class DeleteUser {
  deleteUser() {}
}

class UpdateUser {}
