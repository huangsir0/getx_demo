import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../module/home/home_screen.dart';
import '../module/route/route_screen.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final unknownPage = GetPage(
    name: '/unknown',
    page: () => Scaffold(
      appBar: AppBar(
        title: const Text("Wool"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '404',
              style: TextStyle(fontSize: 32),
            ),
            Text('未知路由'),
          ],
        ),
      ),
    ),
  );

  static final List<GetPage<dynamic>> pages = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.Route,
      page: () =>const RouteScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
