import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:graduation_project/presentation/auth/login/view/login_view.dart';
import 'package:graduation_project/presentation/auth/register/view/register_view.dart';
import 'package:graduation_project/presentation/employer/add_job/view/add_job_view.dart';
import 'package:graduation_project/presentation/employer/application/controller/binding/employer_application_binding.dart';
import 'package:graduation_project/presentation/employer/bottom_navigation/view/employer_drawer.dart';
import 'package:graduation_project/presentation/employer/edit_job/controller/binding/edit_job_binding.dart';
import 'package:graduation_project/presentation/employer/edit_job/view/edit_job_view.dart';
import 'package:graduation_project/presentation/employer/employer_info/controller/binding/employer_info_binding.dart';
import 'package:graduation_project/presentation/employer/employer_info/view/employer_info_view.dart';
import 'package:graduation_project/presentation/employer/employer_profile/view/employer_profile_view.dart';
import 'package:graduation_project/presentation/employer/home/controller/binding/employer_binding.dart';
import 'package:graduation_project/presentation/employer/home/view/employer_home_view.dart';
import 'package:graduation_project/presentation/employer/job_details/controller/binding/job_details_binding.dart';
import 'package:graduation_project/presentation/employer/job_details/view/employer_job_detailes_view.dart';
import 'package:graduation_project/presentation/help_center/view/help_center_view.dart';
import 'package:graduation_project/presentation/job_seeker/application/controller/binding/job_seeker_application_binding.dart';
import 'package:graduation_project/presentation/job_seeker/application/view/job_seeker_application.dart';
import 'package:graduation_project/presentation/job_seeker/bookmarks/view/book_mark.dart';
import 'package:graduation_project/presentation/job_seeker/bottom_navigation/binding/job_seeker_drawer_binding.dart';
import 'package:graduation_project/presentation/job_seeker/bottom_navigation/view/bottom_navigation_view.dart';
import 'package:graduation_project/presentation/job_seeker/bottom_navigation/view/job_seeker_drawer_view.dart';
import 'package:graduation_project/presentation/job_seeker/home/view/user_home_view.dart';
import 'package:graduation_project/presentation/job_seeker/interest/controller/binding/interest_binding.dart';
import 'package:graduation_project/presentation/job_seeker/interest/view/interest_view.dart';
import 'package:graduation_project/presentation/job_seeker/job_seekr_info/controller/binding/job_seeker_info_binding.dart';
import 'package:graduation_project/presentation/job_seeker/notification/controller/binding/job_seeker_notification_binding.dart';
import 'package:graduation_project/presentation/onboarding/view/on_boarding_view.dart';
import '../../presentation/auth/foregot_password/controller/binding/forget_password_binding.dart';
import '../../presentation/auth/foregot_password/view/forget_password.dart';
import '../../presentation/auth/login/controller/binding/login_binding.dart';
import '../../presentation/auth/register/controller/binding/register_binding.dart';
import '../../presentation/auth/register/view/save_user_request.dart';
import '../../presentation/auth/verify/controller/binding/verify_binding.dart';
import '../../presentation/auth/verify/view/verify_view.dart';
import '../../presentation/employer/add_job/controller/binding/add_job_binding.dart';
import '../../presentation/employer/application/controller/binding/job_binding.dart';
import '../../presentation/employer/application/view/specific_application.dart';
import '../../presentation/employer/bottom_navigation/controller/binding/bottom_navigation_binding.dart';
import '../../presentation/employer/bottom_navigation/view/bottom_navigation_view.dart';
import '../../presentation/employer/edit_profile/controller/edit_profile_binding.dart';
import '../../presentation/employer/edit_profile/view/edit_profile_view.dart';
import '../../presentation/employer/employer_profile/controller/binding/employer_profile_binding.dart';
import '../../presentation/employer/notification/controller/binding/employer_notification_binding.dart';
import '../../presentation/employer/notification/view/employer_notification_view.dart';
import '../../presentation/help_center/controller/binding/help_center_binding.dart';
import '../../presentation/job_seeker/bookmarks/controller/binding/saved_job_binding.dart';
import '../../presentation/job_seeker/bottom_navigation/binding/bottom_navigation_binding.dart';
import '../../presentation/job_seeker/home/controller/binding/user_binding.dart';
import '../../presentation/job_seeker/job_seekr_info/view/job_seek_info_view.dart';
import '../../presentation/job_seeker/jobs_in_category/controller/bidning/jobsBinding.dart';
import '../../presentation/job_seeker/jobs_in_category/view/jobs_view.dart';
import '../../presentation/job_seeker/notification/view/job_seeker_notification_view.dart';
import '../../presentation/job_seeker/profile/controller/binding/job_seeker_profile_binding.dart';
import '../../presentation/job_seeker/profile/controller/job_seeker_profile_controller.dart';
import '../../presentation/job_seeker/profile/view/job_seeker_profile.dart';
import '../../presentation/onboarding/controller/binding/on_boaring_binding.dart';
import '../../presentation/setting/controller/binding/setting_binding.dart';
import '../../presentation/setting/view/setting_view.dart';
import '../../presentation/splash/controller/binding/splash_binding.dart';
import '../../presentation/splash/view/splash_view/splash_view.dart';

class Routes {
  static const String jobsHome = '/job_seeker_home';
  static const String jobSeekerHome = '/job_seeker_home';
  static const String employerHome = '/employer_home';
  static const String onBoarding = '/on_boarding';
  static const String splashView = '/splash_view';
  static const String loginView = '/login_view';
  static const String registerView = '/register_view';
  static const String forgetPasswordView = '/forget_password_view';
  static const String jobSeekerBottomBarView = '/job_seeker_bottom_bar';
  static const String employerBottomBarView = '/employer_bottom_bar';
  static const String verificationView = '/verification_view';
  static const String addJobView = '/add_job_view';
  static const String employerProfile = '/employer_profile';
  static const String jobSeekerProfile = '/job_seeker_profile';
  static const String employerInfoView = '/employer_info';
  static const String jobDetails = '/job_details';
  static const String jobSeekerDrawer = '/job_seeker_drawer ';
  static const String interestView = '/interest_view';
  static const String userType = '/userType';
  static const String askToSave = '/ask_to_save';
  static const String verifyEmail = '/verify_email';
  static const String employerDrawer = '/employer_drawer';
  static const String employerNotification = '/employer_notification';
  static const String jobSeekerNotification = '/job_seeker_notification';
  static const String editJobView = '/edit_job_view';
  static const String jobSeekerInfo = '/job_seeker_info';
  static const String jobsView = '/jobs_view';
  static const String jobsSeekerApplication = '/job_seeker_application_view';
  static const String jobApplication = '/job_application';
  static const String editProfile = '/edit_profile';
  static const String setting = '/setting';
  static const String helpCenter = '/help_center_view';
  static const String savedJob = '/saved_job_view';
  static const String jobSpecificApplication = '/job_application';
  static const String jobSeekerInEmployer = '/job_seeker_in_employer';
  static const String employerInJobSeeker = '/employer_profile_in_job_seeker_view';

  static final routes = [
    GetPage(
      name: Routes.employerInJobSeeker,
      page: () => const EmployerProfileInJobSeekerView(),
      binding: EmployerProfileBinding(),
    ),
    GetPage(
      name: Routes.jobSeekerInEmployer,
      page: () => const JobSeekerInEmployerView(),
      binding: JobSeekerProfileBinding(),
    ),
    GetPage(
      name: Routes.jobSpecificApplication,
      page: () => const JobApplicationView(),
      binding: JobBinding(),
    ),
    GetPage(
      name: Routes.helpCenter,
      page: () => const HelpCenterView(),
      binding: HelpCenterBinding(),
    ),
    GetPage(
      name: Routes.savedJob,
      page: () => const SavedJobView(),
      binding: SavedJobBinding(),
    ),
    GetPage(
      name: Routes.splashView,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.setting,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
        name: Routes.onBoarding,
        page: () => const OnBoardingView(),
        binding: OnBoardingBinding()),
    GetPage(
        name: Routes.registerView,
        page: () => RegisterView(),
        binding: RegisterBinding()),
    GetPage(
        name: Routes.loginView,
        page: () => const LoginView(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.forgetPasswordView,
        page: () => ForgetPasswordView(),
        binding: ForgetPasswordBinding()),
    GetPage(
        name: Routes.employerHome,
        page: () => EmployerHomeView(),
        binding: EmployerHomeBinding()),
    GetPage(
        name: Routes.jobSeekerHome,
        page: () => UserHomeView(),
        binding: UserHomeBinding()),
    GetPage(
        name: Routes.jobSeekerBottomBarView,
        page: () => UserBottomNavigationBarView(),
        binding: UserBottomNavigationBinding()),
    GetPage(
        name: Routes.employerBottomBarView,
        page: () => const EmployerBottomNavigationBarView(),
        binding: EmployerBottomNavigationBinding()),
    GetPage(
        name: Routes.addJobView,
        page: () => const AddJobView(),
        binding: AddJobBinding()),
    GetPage(
        name: Routes.employerProfile,
        page: () => const EmployerProfileView(),
        binding: EmployerProfileBinding()),
    GetPage(
        name: Routes.employerInfoView,
        page: () => const EmployerInfoView(),
        binding: EmployerInfoBinding()),
    GetPage(
        name: Routes.jobDetails,
        page: () => const EmployerJobDetailsView(),
        binding: EmployerJobDetailsBinding()),
    GetPage(
        name: Routes.jobSeekerDrawer,
        page: () => JobSeekerDrawer(),
        binding: JobSeekerDrawerBinding()),
    GetPage(
        name: Routes.interestView,
        page: () => InterestView(),
        binding: InterestBinding()),
    GetPage(
        name: Routes.userType,
        page: () => InterestView(),
        binding: InterestBinding()),
    GetPage(
      name: Routes.askToSave,
      page: () => SaveUserRequest(),
      //    binding: InterestBinding()
    ),
    GetPage(
      name: Routes.verifyEmail,
      page: () => VerifyEmailView(),
      binding: VerifyBinding(),
    ),
    GetPage(
      name: Routes.employerDrawer,
      page: () => EmployerDrawer(),
      binding: EmployerHomeBinding(),
    ),
    GetPage(
      name: Routes.employerNotification,
      page: () => EmployerNotificationView(),
      binding: EmployerNotificationBinding(),
    ),
    GetPage(
      name: Routes.jobSeekerNotification,
      page: () => JobSeekerNotificationView(),
      binding: JobSeekerNotificationBinding(),
    ),
    GetPage(
      name: Routes.jobSeekerProfile,
      page: () => JobSeekerProfileView(),
      binding: JobSeekerProfileBinding(),
    ),
    GetPage(
      name: Routes.editJobView,
      page: () => EditJobView(),
      binding: EditJobBinding(),
    ),
    GetPage(
      name: Routes.jobSeekerInfo,
      page: () => JobSeekerInfoView(),
      binding: JobSeekerInfoBinding(),
    ),
    GetPage(
      name: Routes.jobsView,
      page: () => JobsView(),
      binding: JobsBinding(),
    ),
    GetPage(
      name: Routes.jobsSeekerApplication,
      page: () => const JobSeekerApplication(),
      binding: JobSeekerApplicationBinding(),
    ),
    GetPage(
      name: Routes.jobApplication,
      page: () => const JobApplicationView(),
      binding: EmployerApplicationBinding(),
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => const EditProfile(),
      binding: EditProfileBinding(),
    ),
  ];
}
