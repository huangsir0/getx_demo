import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassWay2Screen extends StatelessWidget {
  const PassWay2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("通过url形式传值"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "通过url形式传值",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "name=${Get.parameters["user"]}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "age=${Get.parameters["age"]}",
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              "phone=${Get.parameters["phone"]}",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
