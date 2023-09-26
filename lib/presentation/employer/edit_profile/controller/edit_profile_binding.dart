import 'package:get/get.dart';
import 'package:graduation_project/presentation/employer/edit_profile/controller/edite_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditProfileController());
  }
}
