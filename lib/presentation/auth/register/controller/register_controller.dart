import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_state_render_dialog/flutter_state_render_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:graduation_project/core/model/base_model.dart';
import 'package:graduation_project/core/model/user.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
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
  var showCustom = false.obs;
  var countryIndex;
  late AnimationController animationController;
  late Animation<double> animation;
  var isAgreementPolicy = false.obs;
  var countryCode = '+20'.obs;
  var countrySt = 'Country'.obs;
  var area = 'Area'.obs;
  var showLink = false.obs;
  var showTermsValidate = false.obs;
  var link = ''.obs;
  final TextEditingController linkController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
late User currentUser;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this, // Using GetX for vsync //
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOutBack,
    );
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

  void toggleCustom() {
    showCustom.value = !showCustom.value;
  }

  void toggleCheck(bool value) {
    isAgreementPolicy.value = value;
    isAgreementPolicy.value = !isAgreementPolicy.value;
    update();
  }

  void updateCountryCode(int index) {
    countryCode.value = countryCodes[index]['code'] as String;
  }

  void updateCountry(int index) {
    countrySt.value = country[index]['code'] as String;
    countryIndex.value = index;
  }

  void updateArea(int index) {
    if (country[countryIndex.value] != null &&
        country[countryIndex.value]['locations'] != null) {
      final locationList = country[countryIndex.value]['locations'] as List;
      if (index < locationList.length) {
        area.value = locationList[index]['loc'] as String;
      }
    }
  }

  void updateCountryIndex(int newIndex) {
    countryIndex.value = newIndex;
  }

  UserModel get user {
    UserModel user = UserModel();
    user.email = emailController.text;
    user.name = nameController.text;
    user.phoneNumber = phoneController.text;
    user.userType = current.value;
    return user;
  }

  performRegister(context) async {
    LoadingDialog.show();
    if (formKey.currentState!.validate()) {
      if (isAgreementPolicy.value) {
        FirebaseResponse fbResponse = await Authenticate()
            .signUpWithEmailAndPassword(
                user: user, password: passwordController.text);
        print('Firebase response => ${fbResponse.message}');
        LoadingDialog.hide();
        Get.snackbar(fbResponse.message, StringsManager.empty,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ColorsManager.primary);

      if(fbResponse.status) {
       currentUser= (FirebaseAuth.instance.currentUser)!;
       print('current user => $currentUser');
       print('current user email => ${currentUser.email}');
        showVerificationDialog(context);
      }
      } else {
        dialogRender(
          context: context,
          stateRenderType: StateRenderType.popUpErrorState,
          message: StringsManager.shouldAgreePolicies,
          title: StringsManager.error,
          child: DialogButton(
            message: StringsManager.ok,
            onPressed: () {
              LoadingDialog.hide();
              Get.back();
            },
          ),
        );
      }
    } else {
      LoadingDialog.hide();
      debugPrint('Data empty or field not validate ');
    }
  }

  void addLink() {
    if (linkController.text.isNotEmpty) {
      showLink.value = true;
      link.value = linkController.text;
      linkController.text = '';
    }
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
                  width: double.infinity,
                  height: HeightManager.h40,
                  color: ColorsManager.primary,
                  onPressed: () {
                    // if user verify his email don't show tis snackBar ,, go to home
                    print('FirebaseAuth.instance.currentUser!.emailVerified BEFORE RELOAD => ${currentUser.emailVerified}');
                    currentUser.reload();
                    print('FirebaseAuth.instance.currentUser!.emailVerified => AFTER RELOAD ${currentUser.emailVerified}');
                    Get.snackbar(
                        currentUser.emailVerified
                            ? StringsManager.verifyDone
                            : StringsManager.checkEmail,
                        '',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: ColorsManager.primary);

                    if(  FirebaseAuth.instance.currentUser!.emailVerified){

                      if (current == 1) {
                        Get.offNamed(Routes.employerHome);
                      } else {
                        Get.offNamed(Routes.jobSeekerHome);
                      }
                    }

                  },
                  child:  const Text(StringsManager.confirm)), // text
              SizedBox(
                height: HeightManager.h30,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                  Authenticate().deleteAccount(context);
                  // delete user from fireStor too
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

  bool _checkData() {
    return true;
  }
}
