import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/model/user.dart';
import 'package:graduation_project/core/network/common_functions.dart';

import '../../../../core/network/auth/auth.dart';
import '../../../../core/network/auth/user_operation.dart';

class EmployerBottomNavigationBarController extends GetxController {
  var tabIndex =0.obs;



  @override
  void onInit() {
    print('EmployerBottomNavigationBarController ');

    super.onInit();
  }




  void changeTabIndex(int index) {
    tabIndex.value = index;
    update();
  }


  getCurrentUserData()async{
   print('your in current user function');
    User user = await Authenticate().getUser ;

    UserModel? userModel= await UsersDB.getCurrentUser(user.uid) ;
    if(userModel !=null){

     //  email.value= userModel.email ;
     // name.value=  userModel.name;
     //  phoneNumber.value= userModel.phoneNumber;
     //  userModel.userType;
    }
    print('user login is => $user');
  }

}

