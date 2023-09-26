import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/resources/assets_manager.dart';
import 'package:graduation_project/core/resources/sizes_manager.dart';
import 'package:graduation_project/core/resources/styles_manager.dart';
import 'package:graduation_project/core/widget/main_button.dart';
import 'package:graduation_project/core/widget/text_field.dart';
import 'package:graduation_project/presentation/auth/foregot_password/controller/forget_password_controller.dart';

import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class ForgetPasswordView extends GetView<ForgetPasswordController> {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: HeightManager.h50,horizontal: WidthManager.w30),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: ColorsManager.black,
                onPressed: () {
                  Get.back();
                },
              ),
              Text(
                StringsManager.forget,
                style: getBoldTextStyle(
                  fontSize: FontSizeManager.s22,
                  color: ColorsManager.black,
                ),
              ),
              SizedBox(
                height: HeightManager.h20,
              ),
            ],
          ),
          SizedBox(width: WidthManager.w40,),
         SvgPicture.asset(AssetsManager.forgetPassword,height: HeightManager.h220,width: WidthManager.w220,),


          SizedBox(height: HeightManager.h40,),
          Text(StringsManager.forgetTitle,style: getRegularTextStyle(fontSize: IconSizeManager.s20,
              color: ColorsManager.grey ),textAlign: TextAlign.center,),
          SizedBox(height: HeightManager.h40,),

          AppTextFields(hint: StringsManager.email,label: StringsManager.email,),
          SizedBox(height: HeightManager.h20,),

          MainButton(height: HeightManager.h60, color: ColorsManager.primary,
              onPressed: (){}, child: Text(StringsManager.continues),width: double.infinity,)

        ]),
      ),
    ));
  }
}

class ForgetPassword extends GetView<ForgetPasswordController> {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          // image
        ],
      ),
    );
  }
}
