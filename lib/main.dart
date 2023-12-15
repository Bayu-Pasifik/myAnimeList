import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await GetStorage.init();
  final box = GetStorage();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(ScreenUtilInit(
    designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Animate",
      theme:
          box.read("darkmode") == true ? ThemeData.dark() : ThemeData.light(),
      initialRoute: Routes.INTRODUCTION,
      getPages: AppPages.routes,
    ),
  ));
  FlutterNativeSplash.remove();
}
