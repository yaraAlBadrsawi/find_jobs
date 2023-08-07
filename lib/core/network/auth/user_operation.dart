import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../config/firebase_constants.dart';
import '../../model/user.dart';

final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

class InsertUsers {

  static addAllUserInDB(UserModel user ) {

    _fireStore .collection(FireBaseConstants.userCollection)
            .doc(user.userID)
            .set(user.toJson())
            .then((value) => print('user data save to fire store '), onError: (e) => e);

  }
}

class GetUsers {
  getUser() {}
}

class DeleteUser {
  deleteUser() {}
}

class UpdateUser {}
