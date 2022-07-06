import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/module/route/routes/route1.dart';
import 'package:getx_demo/routes/app_pages.dart';

import '../../commponents/common_widget.dart';

class PassValueScreen extends StatelessWidget {
  const PassValueScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX 页面传值"),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonWidget(
                fontSize: 24,
                label: "通过arguments字段传值",
                onTap: () {
                  Get.toNamed(Routes.PassWay1Screen,
                      arguments: {"age": 27, "phone": 1234567897});
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonWidget(
                fontSize: 24,
                label: "Url形式传值",
                onTap: () {
                  Get.toNamed(
                    Routes.PassWay2Screen + "/hcl?age=27&phone=1234567897",
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
