import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:graduation_project/core/model/base_model.dart';
import 'package:graduation_project/core/model/user.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/storage/local/hive_data_store/hive_data_store.dart';
import 'package:graduation_project/core/widget/dialog.dart';
import '../../../../core/network/auth/auth.dart';
import '../../../../core/widget/dialog_button.dart';
import '../../../../core/widget/loading.dart';

class RegisterController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var formKey = GlobalKey<FormState>();
  var current = 0.obs;

  late AnimationController animationController;
  late Animation<double> animation;
  var isAgreementPolicy = false.obs;

  var showTermsValidate = false.obs;

  var registering = false.obs;
  final TextEditingController linkController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  late User currentUser;
  var arguments;

  // Extract the user and password from the arguments
  late dynamic userArg;
  late String passwordArg;

  @override
  void onInit() {
    super.onInit();
    initAnimationController();
    checkArguments();
  }

  void initAnimationController() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this, // Using GetX for vsync //
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOutBack,
    );
  }

  void checkArguments() {
    // to ask saved
    if (Get.arguments != null) {
      arguments = Get.arguments;
      userArg = arguments[0];
      passwordArg = arguments[1];
      print('saved user is ${Get.arguments}');
    }
  }

  void toggleExpansion(bool expand) {
    if (expand) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void changeCurrent(int newIndex) {
    current.value = newIndex;
  }

  void toggleCheck(bool value) {
    isAgreementPolicy.value = value;
    isAgreementPolicy.value = !isAgreementPolicy.value;
    update();
  }

  UserModel get user {
    UserModel user = UserModel();
    user.email = emailController.text;
    user.name = nameController.text;
    // user.phoneNumber = countryCode.value + phoneController.text;
    user.userType = current.value == 0 ? 'jobSeeker' : 'employer';
    return user;
  }

  performRegister(context) async {
    LoadingDialog.show();
    if (formKey.currentState!.validate()) {
      if (isAgreementPolicy.value) {
        registering.value = true; // Set the progress indicator to true

        FirebaseResponse fbResponse = await Authenticate()
            .signUpWithEmailAndPassword(
                user: user, password: passwordController.text);
        print('Firebase response => ${fbResponse.message}');

        LoadingDialog.hide();
        Get.snackbar(fbResponse.message, StringsManager.empty,
            colorText: ColorsManager.white,
            backgroundColor: ColorsManager.primary.withOpacity(0.5));

        if (fbResponse.status) {
          currentUser = (FirebaseAuth.instance.currentUser)!;
          print('current user => $currentUser');
          print('current user email => ${currentUser.email}');
          // if (current == 0) {
          //   Get.toNamed(Routes.interestView);
          // } else if(current == 1 ){
          // orign
          Get.offNamed(Routes.verifyEmail,
              arguments: [user, passwordController.text]);

//          Get.toNamed(Routes.jobSeekerBottomBarView);
        }
      } else {

       DialogUtil.showCustomDialog(
         title: StringsManager.error,
         content: Column(children: [
           // image

           // message
           Text(StringsManager.shouldAgreePolicies,style: getRegularTextStyle(fontSize: FontSizeManager.s16,
               color: ColorsManager.black),)

         ],),

         actionText: StringsManager.ok,



        );
      }
    } else {
      LoadingDialog.hide();
      debugPrint('Data empty or field not validate ');
    }
  }

  // for verify ui
  void goToHomePage() async {

    LoadingDialog.show();
    print('user Arg => ${userArg.email} \n password Arg => ${passwordArg}');
    FirebaseResponse firebaseResponse = await Authenticate()
        .signInWithEmailAndPassword(
            email: userArg.email, password: passwordArg);
    print('email => ${userArg.email}');
    print('password => ${passwordArg}');

    HiveService().addItem(
        'user',
        UserModel(
          userID: Authenticate().getCurrentUserId(),
          userType: userArg.userType ,
          email: userArg.email,
          name: userArg.name,
        ));

    print('Firebase Response => ${firebaseResponse.status}');
    print('user ARG => ${userArg.userType}');
    if (firebaseResponse.status) {
     if (userArg.userType == UserType.jobSeeker.name) {

        Get.offNamed(Routes.jobSeekerHome);
      } else if (userArg.userType == UserType.employer.name) {
      print('EMPLOYER INFO VIEW MUST OPEN ');
        Get.offNamed(Routes.employerInfoView);
      }
    }
    LoadingDialog.hide();
  }

  void goToHomePageWithoutSave() {
    LoadingDialog.show();
    if (userArg.userType == 0) {
      Get.offNamed(Routes.jobSeekerHome);
    } else if (userArg.userType == 1) {
      Get.offNamed(Routes.employerHome);
    }

    LoadingDialog.hide();
  }
}
