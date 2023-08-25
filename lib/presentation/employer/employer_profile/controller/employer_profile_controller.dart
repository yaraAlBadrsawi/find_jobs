import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/model/employer/employer_model.dart';
import 'package:graduation_project/core/model/user.dart';
import 'package:graduation_project/core/network/auth/auth.dart';
import 'package:graduation_project/core/network/auth/user_operation.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/storage/secure_storage/secure_storage.dart';

import '../../../../core/storage/local/hive_data_store/hive_data_store.dart';

class EmployerProfileController extends GetxController {
  var email = ''.obs;
  var name = ''.obs;
  var phoneNumber = ''.obs;

  var employerModel = EmployerModel();
  UserModel? userModel = HiveService().getItem(StringsManager.user);
  var address = '';

  @override
  void onInit() {
    getEmployerData();
    print('you in profile controller ');
    print('current Data store in HIVE = > ${userModel!.name} ');
    // getCurrentUserData();
    super.onInit();
  }

  getEmployerData() async {
    employerModel = await EmployerDB().getEmployers(userModel!.userID);
    update();
  }
}
