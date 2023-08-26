import 'package:get/get.dart';
import 'package:graduation_project/config/constants.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import 'package:graduation_project/core/widget/loading.dart';

import '../../../../core/network/auth/user_operation.dart';

class InterestController extends GetxController {
  var isChecked = false.obs;
  // var isCheckedList = false;
  var selectOptions=[].obs;
  var isCheckedList = List.filled(categories.length, false).obs;
  // List<bool> selectedCategories = List.generate(categories.length, (index) => false);


  List<Map> interests=[
    {'categories':categories[0],'value':false },
    {'categories':categories[0],'value':false },
    {'categories':categories[0],'value':false },
    {'categories':categories[0],'value':false },
    {'categories':categories[0],'value':false },
    {'categories':categories[0],'value':false },
    {'categories':categories[0],'value':false },
    {'categories':categories[0],'value':false },
    {'categories':categories[0],'value':false },
    {'categories':categories[0],'value':false },
    {'categories':categories[0],'value':false },
    {'categories':categories[0],'value':false },

  ];
  var selectedInterest = [].obs;

  void toggle(index) {
    isCheckedList[index] = !isCheckedList[index];
    // isChecked.value = value;
  }

  void storeInterest(var interests)async {
    LoadingDialog.show();
bool isAdd=
await JobSeekerDB().addInterestsToDB(interests);
print('IS ADD =>> $isAdd');

    if(isAdd){
      print('interest add done ');
    Get.snackbar('interests added done','',backgroundColor: ColorsManager.primary.withOpacity(0.5));
      LoadingDialog.hide();
      Get.toNamed(Routes.jobSeekerBottomBarView);
    }
  }
}
