import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:graduation_project/presentation/employer/home/controller/employer_controller.dart';

class EmployerHomeBinding extends Bindings{
  @override
  void dependencies() {
Get.lazyPut(()=>EmployerHomeController());  }

}