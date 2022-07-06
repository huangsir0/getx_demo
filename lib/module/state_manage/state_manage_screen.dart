import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/module/route/routes/route1.dart';
import 'package:getx_demo/module/state_manage/manage/manage_way1.dart';
import 'package:getx_demo/routes/app_pages.dart';

import '../../commponents/common_widget.dart';
import 'manage/manage_way2.dart';

class StateManageScreen extends StatelessWidget {
  const StateManageScreen({Key? key}) : super(key: key);

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
                label: "简单的状态管理",
                onTap: () {
                  Get.to(() => const ManageWay1Screen());
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CommonWidget(
                fontSize: 24,
                label: "响应式状态管理",
                onTap: () {
                  Get.to(() => ManageWay2Screen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
