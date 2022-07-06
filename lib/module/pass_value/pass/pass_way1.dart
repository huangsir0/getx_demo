import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassWay1Screen extends StatelessWidget {
 const PassWay1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("传值方式1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "通过 arguments 参数传值 ",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              "age=${Get.arguments["age"]?.toString()}phone=${Get.arguments["phone"]?.toString()}",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
