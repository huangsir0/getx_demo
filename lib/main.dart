import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_demo/routes/app_pages.dart';

import 'module/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPages.pages,
      initialRoute: AppPages.INITIAL,
      unknownRoute: AppPages.unknownPage,
      defaultTransition: Transition.native,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
