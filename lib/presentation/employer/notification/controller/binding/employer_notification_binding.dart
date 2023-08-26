import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:graduation_project/presentation/employer/notification/controller/employer_notification_controller.dart';

class EmployerNotificationBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut(()=>EmployerNotificationController());
  }

}