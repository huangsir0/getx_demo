import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:getx_demo/module/exam_page.dart';

import '../../commponents/common_widget.dart';
import '../../routes/app_pages.dart';
import '../injection/injection_screen.dart';
import '../widgets/widget_screen.dart';

part 'home_binding.dart';

part 'home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX 框架学习"),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonWidget(
                label: "路由管理",
                onTap: () {
                  Get.toNamed(Routes.Route);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonWidget(
                label: "传值",
                onTap: () {
                  Get.toNamed(Routes.PassValueScreen);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonWidget(
                label: "状态管理",
                onTap: () {
                  Get.toNamed(Routes.StateManageScreen);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonWidget(
                label: "依赖注入",
                onTap: () {
                  Get.to(() => const InjectionScreen());
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonWidget(
                label: "自动销毁",
                onTap: () {
                  Navigator.of(context)
                      .push(new MaterialPageRoute(builder: (context) {
                    return ExamPage();
                  }));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonWidget(
                label: "小部件",
                onTap: () {
                  Get.to(() => const WidgetScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
