import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../config/firebase_constants.dart';
import '../../model/user.dart';
import '../../resources/colors_mangaer.dart';
import '../../resources/strings_manager.dart';

final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

class InsertUsers {
  static Future<bool> addAllUserInDB(UserModel user) async {
    await _fireStore
        .collection(FireBaseConstants.userCollection)
        .doc(user.userID)
        .set(user.toJson())
        .then((value) => true,
            onError: (e) => Get.snackbar(StringsManager.error, e,
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: ColorsManager.primary));

    return false;
  }
}

class GetUsers {
  getUser() {}
  static final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  static Future<UserModel?> getCurrentUser(String uid) async {
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

class DeleteUser {
  deleteUser() {}
}

class UpdateUser {}
