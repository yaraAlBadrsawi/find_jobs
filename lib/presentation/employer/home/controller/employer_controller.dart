import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/network/auth/auth.dart';

class EmployerHomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }

  getCurrentUser() async {
    var current = await Authenticate().getUser;
    print('current user in home => $current');
    return await Authenticate().getUser;
  }
}
