import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/module/route/routes/route2.dart';
import 'package:getx_demo/module/route/routes/route3.dart';

import '../module/home/home_screen.dart';
import '../module/injection/injects/bindings/binding_ex_screen.dart';
import '../module/pass_value/pass/pass_way1.dart';
import '../module/pass_value/pass/pass_way2.dart';
import '../module/pass_value/pass_value_screen.dart';
import '../module/route/route_screen.dart';
import '../module/state_manage/state_manage_screen.dart';

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
      page: () => const RouteScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.Route2,
      page: () => const Route2Screen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.Route3,
      page: () => const Route3Screen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.PassWay1Screen,
      page: () => const PassWay1Screen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.PassValueScreen,
      page: () => const PassValueScreen(),
      transition: Transition.rightToLeft,
    ),

    /// Url 形式传值
    GetPage(
      name: Routes.PassWay2Screen + "/:user",
      page: () => const PassWay2Screen(),
      transition: Transition.rightToLeft,
    ),

    GetPage(
      name: Routes.StateManageScreen,
      page: () => const StateManageScreen(),
      transition: Transition.rightToLeft,
    ),

    /// Binding
    GetPage(
      name: Routes.BindingExScreen,
      page: () => const BindingExScreen(),
      binding: ExBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
