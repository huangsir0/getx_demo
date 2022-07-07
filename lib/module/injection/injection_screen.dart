import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/routes/app_pages.dart';

import '../../commponents/common_widget.dart';
import 'injects/injection_ex_controller.dart';
import 'injects/injection_ex_screen.dart';

class InjectionScreen extends StatelessWidget {
  const InjectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX 依赖注入"),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonWidget(
                fontSize: 24,
                label: "注入",
                onTap: () {
                  //lazyPut
                  Get.lazyPut<InjectionExController>(
                      () => InjectionExController());

                  // put
                  //Get.put<InjectionExController>(InjectionExController());

                  Get.to(() => InjectionExScreen());
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonWidget(
                fontSize: 24,
                label: "绑定",
                onTap: () {
                  Get.toNamed(Routes.BindingExScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
