import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:graduation_project/core/model/base_model.dart';
import 'package:graduation_project/core/model/user.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/storage/local/hive_data_store/hive_data_store.dart';
import 'package:graduation_project/core/widget/dialog.dart';
import 'package:hive/hive.dart';
import '../../../../core/network/auth/auth.dart';
import '../../../../core/resources/assets_manager.dart';
import 'package:graduation_project/core/storage/secure_storage/secure_storage.dart';
import 'package:graduation_project/core/widget/main_button.dart';
import '../../../../config/constants.dart';
import '../../../../core/network/auth/auth.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/sizes_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/widget/dialog.dart';
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

  void performRegister(context) async {
    if (formKey.currentState!.validate()) {
      LoadingDialog.show();
      if (isAgreementPolicy.value) {
        registering.value = true; // Set the progress indicator to true
        FirebaseResponse fbResponse = await Authenticate()
            .signUpWithEmailAndPassword(
                user: user, password: passwordController.text);
        print('Firebase response => ${fbResponse.message}');

        Get.snackbar(fbResponse.message, StringsManager.empty,
            colorText: ColorsManager.white,
            backgroundColor: ColorsManager.primary.withOpacity(0.5));
        if (fbResponse.status) {
          currentUser = (FirebaseAuth.instance.currentUser)!;
          FirebaseResponse fb = await Authenticate()
              .signInWithEmailAndPassword(
              email: user.email, password: passwordController.text);
          LoadingDialog.hide();
          if (fb.status) {

            if (current.value == 0) {
              Get.toNamed(Routes.interestView);
            } else if (current.value == 1) {
              Get.offNamed(Routes.employerInfoView);
            }
            LoadingDialog.hide();
          }else {
            LoadingDialog.hide();

          }
        }

            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ColorsManager.primary);
        showVerificationDialog(context);

        // if (current == 1) {
        //   Get.offNamed(Routes.employerHome);
        // } else {
        //   Get.offNamed(Routes.jobSeekerHome);
        // }
      } else {
      LoadingDialog.hide();
      Get.bottomSheet(Container(
        decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.
            only(topLeft: Radius. circular(RadiusManager.r40),topRight:Radius. circular(RadiusManager.r40) )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
           SizedBox(height: HeightManager.h20,),
            Text(
              StringsManager.shouldAgreePoliciesSubtitle,
              textAlign: TextAlign.center,
              style: getRegularTextStyle(
                  fontSize: FontSizeManager.s16, color: ColorsManager.grey),
            ),
            SizedBox(
              height: HeightManager.h20,
            ),
            SvgPicture.asset(
              AssetsManager.verifiedBro,
              height: HeightManager.h200,
              width: WidthManager.w200,
            ),
            // message
          ],
        ),
      ),);
      
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
          userType: userArg.userType,
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
  void showVerificationDialog(context) {
    DialogUtil.showCustomDialog(
        title: StringsManager.empty,
        content: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                  //TODO : Change image to correct one
                  AssetsManager.googleIcon,
                  height: HeightManager.h100,
                  width: WidthManager.w100,
                  colorFilter: const ColorFilter.mode(
                      ColorsManager.primary, BlendMode.srcIn)),
              SizedBox(
                height: HeightManager.h20,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  StringsManager.verifyYourEmail,
                  style: getBoldTextStyle(
                      fontSize: FontSizeManager.s16,
                      color: ColorsManager.black),
                ),
              ),
              Text(
                StringsManager.verifyMessage,
                style: getMediumTextStyle(
                    fontSize: FontSizeManager.s14, color: ColorsManager.grey),
              ),
              SizedBox(
                height: HeightManager.h20,
              ),
              GestureDetector(
                onTap: () {
                  Authenticate().resendVerificationCode();
                },
                child: Text(
                  StringsManager.resend,
                  style: getMediumTextStyle(
                      fontSize: FontSizeManager.s14,
                      color: ColorsManager.primary),
                ),
              ),
              SizedBox(
                height: HeightManager.h20,
              ),
              MainButton(
                  child: const Text(StringsManager.confirm),
                  width: double.infinity,
                  height: HeightManager.h40,
                  color: ColorsManager.primary,
                  onPressed: () {
                    // if user verify his email don't show tis snackBar ,, go to home
                    print('FirebaseAuth.instance.currentUser!.emailVerified => ${FirebaseAuth.instance.currentUser!.emailVerified}');
                    Get.snackbar(
                        FirebaseAuth.instance.currentUser!.emailVerified
                            ? StringsManager.verifyDone
                            : StringsManager.checkEmail,
                        '',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: ColorsManager.primary);
                  }), // text
              SizedBox(
                height: HeightManager.h30,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Authenticate().deleteAccount(context);
                },
                child: Text(
                  StringsManager.changeEmail,
                  style: getMediumTextStyle(
                      fontSize: FontSizeManager.s14,
                      color: ColorsManager.primary),
                ),
              ),
            ],
          ),
        ),
        actionText: StringsManager.empty);
  }

  void removeLink() {
    link.value = '';
    showLink.value = false;
  }

    LoadingDialog.hide();
  }
}
