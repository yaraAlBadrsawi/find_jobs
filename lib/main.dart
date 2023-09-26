
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import 'package:graduation_project/core/storage/secure_storage/secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'config/constants.dart';
import 'config/theam_controller.dart';
import 'core/model/adapter/user_adapter.dart';
import 'core/model/user.dart';
import 'core/resources/strings_manager.dart';
import 'core/service/theme_service.dart';
import 'core/storage/local/hive_data_store/hive_data_store.dart';
import 'firebase_options.dart';


void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<UserModel>(UserModelAdapter()); // Register the adapter
  Hive.registerAdapter<StringWrapper>(StringWrapperAdapter());
  //await Hive.openBox<StringWrapper>('myBox');

  await HiveService().initHive(); // Initialize HiveService

  //await Hive.openBox(Constants.userBox);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) =>
      print('App connected with firebase done (Good Job yara) $value'));

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeService _themeService;
  MyApp({super.key}):_themeService = ThemeService();

  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        splitScreenMode: true,
        minTextAdapt: true,
        designSize: const Size(
          Constants.deviceWidth,
          Constants.deviceHeight,
        ),
        builder: (context, child) {
          return GetMaterialApp(
            // theme: themeController.isDarkMode.value ?
            // ThemeData.dark() : ThemeData.light(),
            theme: _themeService.getThemeData(),
            themeMode: _themeService.getThemeMode(),
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.splashView ,
            getPages: Routes.routes,
          );
        });
//    home: box1.get('isLogged',defaultValue: false)?WelcomePage():Login_Page()  // load login page

  }
}
