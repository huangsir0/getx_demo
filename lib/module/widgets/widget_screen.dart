import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../commponents/common_widget.dart';

class WidgetScreen extends StatelessWidget {
  const WidgetScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX 状态管理"),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonWidget(
                fontSize: 24,
                label: "SnackBars",
                onTap: () {
                  Get.snackbar('Hi', 'Hello',
                      snackPosition: SnackPosition.BOTTOM);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonWidget(
                fontSize: 24,
                label: "Dialogs",
                onTap: () {
                  Get.defaultDialog(
                      onConfirm: () {
                        Get.back();
                      },
                      title: "dialog",
                      middleText: "我是默认dialog");
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonWidget(
                fontSize: 24,
                label: "自定义Dialogs",
                onTap: () {
                  Get.dialog(
                      AlertDialog(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        content: Container(
                          height: 200,
                          width: 200,
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: Text("Hello 自定义Dialog"),
                        ),
                      ),
                      barrierDismissible: true);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonWidget(
                fontSize: 24,
                label: "BottomSheets",
                onTap: () {
                  Get.bottomSheet(
                    Container(
                      color: Colors.white,
                      height: 240,
                      alignment: Alignment.center,
                      child: const Text(
                        'title',
                        style: TextStyle(
                          color: Color(0xff333333),
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
