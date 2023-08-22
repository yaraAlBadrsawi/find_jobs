import 'package:get/get.dart';
import 'package:graduation_project/config/constants.dart';

import '../../../../core/network/auth/user_operation.dart';

class InterestController extends GetxController {
  var isChecked = false.obs;
  var isCheckedList = List.filled(categories.length, false).obs;

  var selectedInterest = [].obs;

  void toggle() {
    isChecked.value = !isChecked.value;
    // isChecked.value = value;
  }

  void storeInterest(var interests) {
    JobSeekerDB().addInterestsToDB(interests);
  }
}
