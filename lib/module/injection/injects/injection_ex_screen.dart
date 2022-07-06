import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/module/injection/injects/injection_ex_controller.dart';

class InjectionExScreen extends StatelessWidget {
  InjectionExScreen({Key? key}) : super(key: key);

  InjectionExController controller = Get.find<InjectionExController>();

  //InjectionExController controller =  Get.put<InjectionExController>(InjectionExController());

  @override
  Widget build(BuildContext context) {
    print("==========InjectionExScreen=====build");
    return Scaffold(
      appBar: AppBar(
        title: const Text("注入的例子"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                controller.counter.toString(),
                style: const TextStyle(fontSize: 30),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RaisedButton(
              onPressed: () {
                controller.increment();
              },
              child: Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
