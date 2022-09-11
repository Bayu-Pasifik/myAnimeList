import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  final box = GetStorage();
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Anime List",
      // darkTheme: ThemeData.dark(),
      theme:
          box.read("themeDark") == null ? ThemeData.light() : ThemeData.dark(),
      initialRoute: Routes.INTRODUCTION,
      getPages: AppPages.routes,
    ),
  );
}
