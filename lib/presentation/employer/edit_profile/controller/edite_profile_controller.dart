import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/config/constants.dart';
import 'package:graduation_project/core/model/employer/employer_model.dart';
import 'package:graduation_project/core/network/auth/user_db.dart';
import 'package:graduation_project/core/storage/local/hive_data_store/hive_data_store.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/network/upload_images/upload_images.dart';
import '../../../../core/resources/colors_mangaer.dart';
import '../../../../core/resources/routes_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widget/loading.dart';

class EditProfileController extends GetxController {
  var key = GlobalKey<FormState>();
  late TextEditingController companyDescriptionController;
  late TextEditingController addressController;
  late TextEditingController sizeAndIndustryController;
  late TextEditingController socialMediaController;
  late TextEditingController companyAchievementsController;
  late TextEditingController phoneController;

  var address = StringsManager.address.obs;

  var countryIndex;
  var countryCode = '+20'.obs;
  var countrySt = 'Country'.obs;
  var area = 'Area'.obs;
  var imageUrl = ''.obs;

  late EmployerModel employer;

  @override
  void onInit() {
    super.onInit();
    intiTextEditingController();
    getProfileInfo();


  }

  void getProfileInfo() async {
    print('current use id = ${HiveService().getItem(Constants.user).userID}');
    employer = await EmployerDB()
        .getEmployers(HiveService().getItem(Constants.user).userID);
    print('employer => ${employer}');
    update();
  }

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


  EmployerModel get employerModel {
    EmployerModel employer = EmployerModel();
    employer.email = HiveService().getItem(Constants.user).email;
    employer.name = HiveService().getItem(Constants.user).name;
    employer.phone ='${countryCode.value} ${phoneController.text}';
    employer.userType = HiveService().getItem(Constants.user).userType;
    employer.description = companyDescriptionController.text;
    employer.address = address.value;
    employer.sizeAndIndustry = sizeAndIndustryController.text;
    employer.socialMedia = socialMediaController.text;
    employer.companyAchievements = companyDescriptionController.text;
    employer.imageUrl = employer. imageUrl;
    return employer;
  }

  saveInfo() async {

    if (key.currentState!.validate()) {
      LoadingDialog.show();
      print('employer info => $employer');
      print('employer email  => ${employer.email}');
      print('employer name => ${employer.name}');
      print('employer address  => ${employer.address}');
      EmployerDB().addEmployerToDB(employer).then((value) {
        Get.snackbar(
            'user data update done ', '',
            backgroundColor: ColorsManager.primary.withOpacity(0.5),
            snackPosition: SnackPosition.BOTTOM);
        LoadingDialog.hide();
        Get.toNamed(Routes.employerBottomBarView);
      }
      );
    }
  }

  intiTextEditingController() {
    companyDescriptionController = TextEditingController();
    addressController = TextEditingController();
    sizeAndIndustryController = TextEditingController();
    socialMediaController = TextEditingController();
    companyAchievementsController = TextEditingController();
    phoneController = TextEditingController();
  }
  disposeTextEditingController() {
    companyDescriptionController.dispose();
    addressController.dispose();
    sizeAndIndustryController.dispose();
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
