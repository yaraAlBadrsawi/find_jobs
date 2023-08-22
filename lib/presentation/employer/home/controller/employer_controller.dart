import 'package:get/get.dart';
import 'package:graduation_project/core/model/employer/employer_model.dart';
import 'package:graduation_project/core/model/job.dart';
import 'package:graduation_project/core/network/auth/auth.dart';
import 'package:graduation_project/core/network/auth/user_operation.dart';
import 'package:graduation_project/core/network/jobs/jobs_operation.dart';
import 'package:graduation_project/core/resources/strings_manager.dart';
import 'package:graduation_project/core/storage/local/hive_data_store/hive_data_store.dart';
import '../../../../core/model/user.dart';

class EmployerHomeController extends GetxController {
  List<JobModel> jobsList = [];

  // UserModel userModel = UserModel();
  EmployerModel employerModel = EmployerModel();

  @override
  void onInit() {
    super.onInit();
    getEmployer();
    getJobs();
  }

  getEmployer() async {
    // UserModel? userModel=     HiveService().getItem(StringsManager.user).uid;
    //    var current = await Authenticate().getUser;
    employerModel = await EmployerDB()
        .getEmployers(HiveService().getItem(StringsManager.user).userID);
    //
    // //  print('current user in home => $current');
    // return await Authenticate().getUser;
update();
  }

  void getJobs() async {
    // jobModel =
    jobsList = await JobsDB()
        .getEmployerJobs(HiveService().getItem(StringsManager.user).userID);
    print('Job Model => $jobsList');
    update();
  }
}
