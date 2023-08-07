import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import 'package:graduation_project/core/widget/main_button.dart';
import 'package:graduation_project/presentation/auth/controller/register_controller.dart';
import 'package:graduation_project/presentation/auth/view/widget/popup.dart';
import 'package:graduation_project/core/resources/fonts_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import '../../../../config/constants.dart';
import '../../../../core/validator/validator.dart';
import '../../../../core/widget/dialog.dart';
import '../../../../core/widget/text_field.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';

class Details extends GetView<RegisterController> {
  Details({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = controller.current;
    // final areaList = currentIndex == null
    //     ? []
    //     : country[currentIndex.value]['locations'] as List;

    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          AppTextFields(
            hint: StringsManager.name.tr,
            controller: controller.nameController,
            prefixIcon: Icon(
              Icons.person,
              color: ColorsManager.primary,
              size: IconSizeManager.s20,
            ),
            validator: (value) {
              return FieldValidator.validateName(value ?? '');
            },
            onChanged: (char) {
              controller.formKey.currentState!.validate();
            },
          ),
          SizedBox(
            height: HeightManager.h20,
          ),
          AppTextFields(
            hint: StringsManager.email.tr,
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(
              Icons.mail,
              size: 20,
              color: ColorsManager.primary,
            ),
            onChanged: (char) {
              controller.formKey.currentState!.validate();
            },
            validator: (value) {
              return FieldValidator.validateEmail(
                  value ?? StringsManager.empty);
            },
          ),
          SizedBox(
            height: HeightManager.h20,
          ),
          AppTextFields(
            hint: StringsManager.password.tr,
            controller: controller.passwordController,
            prefixIcon: Icon(
              Icons.lock,
              color: ColorsManager.primary,
              size: IconSizeManager.s20,
            ),
            obscure: true,
            validator: (value) {
              return FieldValidator.validatePassword(
                  value ?? StringsManager.empty);
            },
            onChanged: (char) {
              controller.formKey.currentState!.validate();
            },
          ),
          SizedBox(
            height: HeightManager.h20,
          ),
          //phone Number :
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: AppTextFields(
                  readOnly: true,
                  hint: controller.countryCode.value,
                  suffixIcon: AppPopUpMenu(
                      list: countryCodes,
                      txt: StringsManager.code.tr,
                      onSelect: ((value) {
                        controller.countryCode.value =
                            countryCodes[value as int]['code'] as String;
                        //TODO : make function in controller
                      })),
                )),
                SizedBox(
                  height: HeightManager.h15,
                ),
                Expanded(
                    flex: 2,
                    child: AppTextFields(
                      hint: StringsManager.phone,
                      keyboardType: TextInputType.number,
                      onChanged: (val) {
                        controller.formKey.currentState!.validate();
                      },
                      validator: (value) {
                        return FieldValidator.validatePhone(
                            value ?? StringsManager.empty);
                      },
                    )),
              ],
            ),
          ),

          // appear in all three user :
          SizedBox(
            height: HeightManager.h20,
          ),
          //terms&conditions
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Checkbox(
                  value: controller.isAgreementPolicy.value,
                  checkColor: ColorsManager.white,
                  activeColor: ColorsManager.primary,
                  onChanged: (value) {
                    controller.toggleCheck(controller.isAgreementPolicy.value);
                  })),
              SizedBox(
                height: HeightManager.h10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(
                          text: StringsManager.iAgree,
                          style: getRegularTextStyle(
                              fontSize: FontSizeManager.s14,
                              color: ColorsManager.black),
                          children: [
                        TextSpan(
                          text: StringsManager.termsAndPrivacy,
                          style: getBoldTextStyle(
                              fontSize: FontSizeManager.s14,
                              color: ColorsManager.primary),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              DialogUtil.showCustomDialog(
                                  title: StringsManager.termsAndPrivacy,
                                  content: Column(
                                    children: [
                                      //image
                                      // text
                                    ],
                                  ));
                              print('Text clicked!');
                            },
                        )
                      ])),
                ],
              ),
            ],
          ),

          MainButton(
              width: double.infinity,
              height: HeightManager.h40,
              color: ColorsManager.secondary,
              onPressed: () async {
                await controller.performRegister(context);
              },
              child: Text(StringsManager.register.tr)),
          SizedBox(
            height: HeightManager.h20,
          ),
          RichText(
              text: TextSpan(
                  text: StringsManager.alreadyHaveAccount,
                  style: getRegularTextStyle(
                      fontSize: FontSizeManager.s14,
                      color: ColorsManager.black),
                  children: [
                TextSpan(
                  text: StringsManager.signIn,
                  style: getBoldTextStyle(
                      fontSize: FontSizeManager.s14,
                      color: ColorsManager.primary),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.toNamed(Routes.loginView);
                    },
                )
              ])),
        ],
      ),
    );
  }
}

//
// ////// OBX work for add link :
//
// Obx(() {
// if (currentIndex == 1) {
// return SizedBox(
// child: Column(
// children: [
// AppTextFields(
// controller: controller.linkController,
// hint: 'add link',
// keyboardType: TextInputType.url,
// suffixIcon: IconButton(
// onPressed: () {
// controller.addLink();
//
// },
// icon:  Icon(
// Icons.add,
// color: ColorsManager.primary,
// size: IconSizeManager.s20,
// )),
// ),
// SizedBox(height: HeightManager.h20,) ,
// ExpandedSection(
// expand: controller.showLink.value,
// child: Container(
// alignment: Alignment.center,
// padding:
// const EdgeInsets.symmetric(horizontal: 5),
// color: ColorsManager.secondary,
// child: Row(
// mainAxisSize: MainAxisSize.min,
// children: [
// Text(
// controller.link.value,
// // style: AppStyles.links(),
// overflow: TextOverflow.ellipsis,
// ),
// SizedBox(height: HeightManager.h8,),
// IconButton(
// onPressed: () {
// controller.removeLink();
// },
// icon: Text(
// 'X',
// // style: AppStyles.regular(),
// ))
// ],
// ),
// ),
// )
// ],
// ));
// } else {
// return SizedBox();
// }
// }),