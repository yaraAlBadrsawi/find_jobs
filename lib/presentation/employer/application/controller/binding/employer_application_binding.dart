import 'package:get/get.dart';
import 'package:graduation_project/presentation/employer/application/controller/employer_applicatin_controller.dart';

class EmployerApplicationBinding extends Bindings{
  @override
  void dependencies() {

  Get.lazyPut(() => EmployerApplicationController());

  }

}