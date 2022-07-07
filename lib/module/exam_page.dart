import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/module/get_bind_widget.dart';

class ExamPage extends StatelessWidget {
  ExamPage({Key? key}) : super(key: key);

  final controller = Get.put(ExamController(), tag: "ExamController");

  @override
  Widget build(BuildContext context) {
    return GetBindWidget(
        bind: controller,
        tag: "ExamController",
        child: Scaffold(
          appBar: AppBar(
            title: const Text("自动销毁"),
          ),
          body: const Center(
              child: Center(
            child: Text(
              "Test",
              style: TextStyle(fontSize: 26),
            ),
          )),
        ));
  }
}

class ExamController extends GetxController {
  final String Tag = "ExamController";

  final _counter = 0.obs;

  int get counter => _counter.value;

  void increment() {
    _counter.value++;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    print("==========$Tag=====onInit");
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("==========$Tag=====onReady");
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("==========$Tag=====onClose");
  }
}
