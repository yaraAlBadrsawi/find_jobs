import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:graduation_project/core/resources/routes_manager.dart';
import 'package:graduation_project/core/storage/secure_storage/secure_storage.dart';

import 'config/constants.dart';
import 'core/resources/strings_manager.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) =>
      print('App conected with firebase done (Good Job yara) $value'));

  // SecureStorage().deleteSecureStorage(StringsManager.email);
  // SecureStorage().deleteSecureStorage(StringsManager.password);
  // SecureStorage().deleteSecureStorage(StringsManager.userType);
  // SecureStorage().deleteSecureStorage(StringsManager.userId);
  // SecureStorage().deleteSecureStorage(StringsManager.phone);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.employerHome,
            getPages: Routes.routes,
          );
        });
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
