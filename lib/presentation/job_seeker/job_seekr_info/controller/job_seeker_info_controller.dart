import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/core/model/employer/employer_model.dart';
import 'package:graduation_project/core/network/auth/auth.dart';
import 'package:graduation_project/core/network/auth/user_db.dart';
import 'package:graduation_project/core/network/upload_images/upload_images.dart';
import 'package:graduation_project/core/resources/colors_mangaer.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import 'package:graduation_project/core/widget/loading.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbols.dart';
import '../../../../config/constants.dart';
import '../../../../core/model/job_seeker/job_seeker_model.dart';
import '../../../../core/model/user.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/storage/local/hive_data_store/hive_data_store.dart';
import '../../../../core/widget/dialog.dart';
import '../../../../core/widget/main_button.dart';
import 'package:image_cropper/image_cropper.dart';

import '../../../employer/job_details/controller/employer_job_details_controller.dart';

class JobSeekerInfoController extends GetxController {
  var formKey = GlobalKey<FormState>();
  late TextEditingController aboutController;
  late TextEditingController addressController;
  late TextEditingController experienceController;
  late TextEditingController socialMediaController;
  late TextEditingController companyAchievementsController;
  late TextEditingController phoneController;

  var address = StringsManager.address.obs;

  var countryIndex;
  var countryCode = '+20'.obs;
  var countrySt = 'Country'.obs;
  var area = 'Area'.obs;

  var _selectedImages = [].obs; // List<HLPickerItem>
  // XFile? file = (null).obs;
  Rx<File?> pickedImage = Rx<File?>(null);
 late UserModel userModel
  ;
 var imageUrl=''.obs;

  List<dynamic> interest=[];
  setAddress(String value) {
    address.value = value;
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

  void getCurrentUserData() async {
    User user = await Authenticate().getUser;
    userModel = (await UsersDB.getCurrentUser(user.uid))!;
    interest = await JobSeekerDB().getInterestsFromDB(user.uid);
    print('interest is =>> $interest');
    print('user data in getCurrentUserData () => $user');
  }

  JobSeekerModel get jobSeeker {
    JobSeekerModel jobSeeker = JobSeekerModel();
    jobSeeker.email = userModel.email;
    jobSeeker.name = userModel.name;
    jobSeeker.phone = '${countryCode.value} ${phoneController.text}';
    jobSeeker.userType = userModel.userType;
    jobSeeker.about = aboutController.text;
    jobSeeker.address = address.value;
    jobSeeker.socialMedia = socialMediaController.text;
    jobSeeker.imageUrl = imageUrl.value;
   jobSeeker.interests = interest  ;
    return jobSeeker;
  }


  void saveInfo() async {
   print('current job seeker is => ${jobSeeker}');
   print('current job seeker interest is => ${jobSeeker.interests}');
    if (formKey.currentState!.validate()) {
      LoadingDialog.show();
      bool isAdded = await JobSeekerDB().addJobSeekerToDB(jobSeeker);
      if (isAdded) {
        Get.snackbar('Your data has been saved successfully', '',
            backgroundColor: ColorsManager.primary.withOpacity(0.5),
            snackPosition: SnackPosition.BOTTOM,
            colorText: ColorsManager.white);
        LoadingDialog.hide();
        EmployerJobDetailsController().user=
        await JobSeekerDB().getJobSeeker(HiveService().getItem(Constants.user).userID);
        update();
        Get.toNamed(Routes.jobSeekerBottomBarView);
      }
    }
    update();
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
    aboutController = TextEditingController();
    addressController = TextEditingController();
    experienceController = TextEditingController();
    socialMediaController = TextEditingController();
    phoneController = TextEditingController();
  }

  disposeTextEditingController() {
    aboutController.dispose();
    addressController.dispose();
    experienceController.dispose();
    socialMediaController.dispose();
    companyAchievementsController.dispose();
    phoneController.dispose();
  }

  Future<void> pickImage(ImageSource source) async {
    ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
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
    imageUrl.value = await FireBaseStorage().uploadImageToFirebase(file);
    print('picked image is => $imageUrl');
    update();
  }
}
