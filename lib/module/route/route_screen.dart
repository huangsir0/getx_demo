import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/module/route/routes/route1.dart';
import 'package:getx_demo/routes/app_pages.dart';

import '../../commponents/common_widget.dart';

class RouteScreen extends StatelessWidget {
  const RouteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX 路由"),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonWidget(
                fontSize: 24,
                label: "Get.to(() =>Route1Screen())",
                onTap: () {
                  Get.to(() => const Route1Screen());
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonWidget(
                fontSize: 24,
                label: "Get.toNamed()",
                onTap: () {
                  Get.toNamed(Routes.Route2);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonWidget(
                fontSize: 24,
                label: "Get.offNamed();",
                onTap: () {
                  Get.offNamed(Routes.Route3);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonWidget(
                fontSize: 24,
                label: "Get.offAllNamed();",
                onTap: () {
                  Get.offAllNamed(Routes.Route3);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonWidget(
                fontSize: 24,
                label: "打开一个已经存在的路由",
                onTap: () {
                  //Get.toNamed(Routes.Route);//不行
                  /// preventDuplicates 设为FALSE 可以打开多个相同界面
                  Get.toNamed(Routes.Route, preventDuplicates: false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
