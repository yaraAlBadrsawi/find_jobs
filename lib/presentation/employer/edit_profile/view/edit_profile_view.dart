import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_project/presentation/employer/edit_profile/controller/edite_profile_controller.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../config/constants.dart';
import '../../../../core/network/upload_images/upload_images.dart';
import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/fonts_manager.dart';
import '../../../../core/resources/sizes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/validator/validator.dart';
import '../../../../core/widget/dialog.dart';
import '../../../../core/widget/main_button.dart';
import '../../../../core/widget/text_field.dart';
import '../../../auth/widget/popup.dart';
import '../../employer_info/controller/employer_info_controller.dart';
import '../../employer_info/view/employer_info_view.dart';
class EditProfile extends GetView<EditProfileController> {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: HeightManager.h50, horizontal: WidthManager.w20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(

                        icon:Icon( Icons.arrow_back),
                        color: ColorsManager.black, onPressed: () { Get.back(); },
                      ),
                      Text(
                        StringsManager.editProfile,
                        style: getBoldTextStyle(
                          fontSize: FontSizeManager.s22,
                          color: ColorsManager.primary,
                        ),
                      ),
                      SizedBox(),
                    ],
                  ),

                  SizedBox(
                    height: HeightManager.h5,
                  ),

                ],
              ),
              SizedBox(
                height: HeightManager.h20,
              ),

              EmployerInformation(),

              //bottom
            ],
          ),
        ),
      ),
    );
  }
}


class EmployerInformation extends GetView<EditProfileController> {
  EmployerInformation({super.key});
  XFile? file;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
              () => SizedBox(
            width: WidthManager.w166,
            height: HeightManager.h170,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: WidthManager.w140,
                  height: HeightManager.h160,
                  decoration: const BoxDecoration(
                      color: ColorsManager.lightGrey, shape: BoxShape.circle),
                  child: ClipOval(
                    child:  Image.network(
                      controller.employer.imageUrl ,
                      fit: BoxFit.fill,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            color: ColorsManager.primary,
                            value: loadingProgress.expectedTotalBytes !=
                                null
                                ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
:null
                          )
                        );
                      },
                    )

                  ),
                ),
                Positioned(
                  top: HeightManager.h120,
                  right: WidthManager.w26,
                  child: GestureDetector(
                    onTap: () {
                      showDialog();
                    },
                    child: Container(
                      width: WidthManager.w45,
                      height: HeightManager.h45,
                      decoration:const BoxDecoration(
                        color: ColorsManager.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: HeightManager.h20,
        ),
        Form(
            key: controller.key,
            child: Column(
              children: [
                // job name
                GetBuilder<EditProfileController>(
                    builder: (controller) {
                      return AppTextFields(
                        hint: controller.employer.description,
                        controller: controller.companyDescriptionController,
                        keyboardType: TextInputType.text,
                        isConstraints: true ,
                        maxLines: 5,
                        length: 150,
                        validator: (value) {
                          return FieldValidator.validateData(value);

                        },
                      );
                    }
                ),
                // employer address
                SizedBox(
                  height: HeightManager.h20,
                ),
                Obx(
                      () => AppTextFields(
                    readOnly: true,
                    hint: controller.employer.address,
                    suffixIcon: PopUpMenu(
                        list: address,
                        // txt: StringsManager.categories,
                        onSelect: ((String item) {
                          print('Selected category: $item');
                          controller.setAddress(item);
                        })),
                  ),
                ),

                SizedBox(
                  height: HeightManager.h20,
                ),
                SizedBox(
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                                () => Expanded(
                                child: AppTextFields(
                                  readOnly: true,
                                  hint: controller.countryCode.value,
                                  suffixIcon: AppPopUpMenu(
                                      list: countryCodes,
                                      txt: 'code',
                                      onSelect: ((value) {
                                        //   controller.countryCode.
                                        controller.updateCountryCode(value as int);
                                      })),
                                )),
                          ),
                          SizedBox(
                            width: WidthManager.w15,
                          ),
                          Expanded(
                              flex: 2,
                              child: AppTextFields(
                                controller: controller.phoneController,
                                hint: 'Phone Number',
                                keyboardType: TextInputType.number,
                              )),
                        ],
                      )
                    ])),

                SizedBox(
                  height: HeightManager.h20,
                ),
                AppTextFields(
                  hint: StringsManager.sizeAndIndustry.tr,
                  controller: controller.sizeAndIndustryController,
                  keyboardType: TextInputType.text,
                  maxLines: 2,
                  validator: (value) {
                    return FieldValidator.validateData(value);
                  },
                ),
                SizedBox(
                  height: HeightManager.h20,
                ),
                AppTextFields(
                  hint: StringsManager.socialMedia.tr,
                  controller: controller.socialMediaController,
                  keyboardType: TextInputType.url,
                  validator: (value) {
                    return FieldValidator.validateData(value);
                  },
                ),
                SizedBox(
                  height: HeightManager.h20,
                ),
                AppTextFields(
                  hint: StringsManager.companyAchievements.tr,
                  controller: controller.companyAchievementsController,
                  keyboardType: TextInputType.text,
                  maxLines: 2,
                  validator: (value) {
                    return FieldValidator.validateData(value);
                  },
                ),

                SizedBox(height: HeightManager.h40),
              ],
            )),
        MainButton(
          width: double.infinity,
          height: HeightManager.h50,
          color: ColorsManager.primary,
          onPressed: () {
            controller.saveInfo();
          },
          child: Text(
            StringsManager.update,
            style: getRegularTextStyle(
                fontSize: FontSizeManager.s18, color: ColorsManager.white),
          ),
        ),
      ],
    );
  }

  _openPicker(ImageSource source) async {
    ImagePicker imagePicker = ImagePicker();
    file = await imagePicker.pickImage(source: source);
    print('${file?.path}');

    if (file == null) return;
    //Import dart:core
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();

    FireBaseStorage().uploadImageToFirebase(file);
  }

  void showDialog() {
    DialogUtil.showCustomDialog(
      title: StringsManager.selectImageSource,
      content: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(RadiusManager.r10))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //image

            SizedBox(
              height: HeightManager.h30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainButton(
                    height: HeightManager.h50,
                    color: ColorsManager.primary,
                    onPressed: () {
                      controller.pickImage(
                        ImageSource.camera,
                      );
                    },
                    child: Text(
                      StringsManager.camera.tr,
                      style: getRegularTextStyle(
                          fontSize: FontSizeManager.s16,
                          color: ColorsManager.white),
                    )),
                SizedBox(
                  width: WidthManager.w20,
                ),
                MainButton(
                    height: HeightManager.h50,
                    color: ColorsManager.primary,
                    onPressed: () {
                      controller.pickImage(ImageSource.gallery);
                    },
                    child: Text(
                      StringsManager.gallery.tr,
                      style: getRegularTextStyle(
                          fontSize: FontSizeManager.s16,
                          color: ColorsManager.white),
                    )),
              ],
            )
            // text
          ],
        ),
      ),
      actionText: StringsManager.empty,
    );
  }


// _getFromGallery() async {
//  final pickedFile = await ImagePicker().pickImage(
//     source: ImageSource.gallery,
//     maxWidth: 1800,
//     maxHeight: 1800,
//   );
//   if (pickedFile != null) {
//     File imageFile = File(pickedFile.path);
//   }
// }
}

