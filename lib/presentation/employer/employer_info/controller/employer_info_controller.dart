import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/model/employer/employer_model.dart';
import 'package:graduation_project/core/network/auth/auth.dart';
import 'package:graduation_project/core/network/auth/user_operation.dart';
import 'package:graduation_project/core/network/upload_images/upload_images.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbols.dart';
import '../../../../core/model/user.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widget/dialog.dart';
import '../../../../core/widget/main_button.dart';
import 'package:image_cropper/image_cropper.dart';

class EmployerInfoController extends GetxController {
  var formKey = GlobalKey<FormState>();
  late TextEditingController companyDescriptionController;
  late TextEditingController addressController;
  late TextEditingController sizeAndIndustryController;
  late TextEditingController socialMediaController;
  late TextEditingController companyAchievementsController;

  var address = StringsManager.address.obs;
  var _selectedImages = [].obs; // List<HLPickerItem>
  // XFile? file = (null).obs;
  Rx<File?> pickedImage = Rx<File?>(null);

  var email='';
  var name='';
 var phoneNumber='';
  var userType='';
  String imageUrl='';

  setAddress(String value) {
    address.value = value;
    update();
  }

  Future<UserModel?> getCurrentUserData() async {
    User user = await Authenticate().getUser;
    UserModel? userModel = await UsersDB.getCurrentUser(user.uid);
    print('user data in getCurrentUserData () => $user');
    if (userModel != null) {
      email = userModel.email;
      name = userModel.name;
      userType = userModel.userType;
    }
    return null;
  }

  EmployerModel get employer {
    EmployerModel employer = EmployerModel();
    employer.email = email;
    employer.name = name;
    employer.phone = phoneNumber;
    employer.userType = userType;
    employer.description = companyDescriptionController.text;
    employer.address = address.value;
    employer.sizeAndIndustry = sizeAndIndustryController.text;
    employer.socialMedia = socialMediaController.text;
    employer.companyAchievements = companyDescriptionController.text;
    employer.imageUrl = imageUrl;
    return employer;
  }

  saveInfo() async {
    if (formKey.currentState!.validate()) {
      print('employer info => $employer');
      print('employer email  => ${employer.email}');
      print('employer name => ${employer.name}');
      print('employer address  => ${employer.address}');

      EmployerDB().addEmployerToDB(employer).then((value) => Get.snackbar(
          'user data update done ', '',
          backgroundColor: ColorsManager.primary,
          snackPosition: SnackPosition.BOTTOM));
    }
  }

  @override
  void dispose() {
    super.dispose();
    disposeTextEditingController();
  }

  @override
  void onInit() {
    super.onInit();
    intiTextEditingController();
    getCurrentUserData();
  }

  intiTextEditingController() {
    companyDescriptionController = TextEditingController();
    addressController = TextEditingController();
    sizeAndIndustryController = TextEditingController();
    socialMediaController = TextEditingController();
    companyAchievementsController = TextEditingController();
  }

  disposeTextEditingController() {
    companyDescriptionController.dispose();
    addressController.dispose();
    sizeAndIndustryController.dispose();
    socialMediaController.dispose();
    companyAchievementsController.dispose();
  }

  Future<void> pickImage(ImageSource source) async {


    ImagePicker imagePicker = ImagePicker();
    XFile? file =
    await imagePicker.pickImage(source: source );
    print('${file?.path}');

    if (file == null) return;
    // ImageCropper imageCropper = ImageCropper();

    // // Perform cropping
    // CroppedFile?  croppedFile = await imageCropper.cropImage(
    //   sourcePath: file.path,
    //   aspectRatioPresets: [
    //     CropAspectRatioPreset.square,
    //     CropAspectRatioPreset.ratio3x2,
    //     CropAspectRatioPreset.original,
    //     CropAspectRatioPreset.ratio4x3,
    //     CropAspectRatioPreset.ratio16x9,
    //   ],
    //     uiSettings: [
    //     AndroidUiSettings(
    //     toolbarTitle: 'Cropper',
    //     toolbarColor: ColorsManager.primary,
    //     toolbarWidgetColor: ColorsManager.white,
    //     initAspectRatio: CropAspectRatioPreset.original,
    //     lockAspectRatio: false),
    //     IOSUiSettings(
    // title: 'Cropper',
    // ),]
    // );

    // String uniqueFileName =
    // DateTime.now().millisecondsSinceEpoch.toString();

    // if (croppedFile == null) return;
    //
    // // Display the cropped image in the Container
    //   pickedImage.value = File(croppedFile.path); // Convert CroppedFile to File


    Get.back();
   imageUrl=  await FireBaseStorage().uploadImageToFirebase(file);
   print('picked image is => $imageUrl');
    update();
  }


}




