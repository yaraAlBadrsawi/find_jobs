import 'package:firebase_auth/firebase_auth.dart';

import '../model/user.dart';
import 'auth/auth.dart';
import 'auth/user_db.dart';

Future<UserModel?> getCurrentUserData() async {
  User user = await Authenticate().getUser;
  UserModel? userModel = await UsersDB.getCurrentUser(user.uid);
  return userModel;
}