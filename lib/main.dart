import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:komida/constants/app_routes.dart';
import 'package:komida/controllers/app_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<AppController>(AppController());
  runApp(const MyApp());
}

class MyApp extends GetView<AppController> {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ko', 'KR'),
        ],
        key: controller.scaffoldKey,
        initialRoute: '/',
        locale: const Locale('ko', 'KO'),
        getPages: AppRoutes.routes,
    );
  }
}
