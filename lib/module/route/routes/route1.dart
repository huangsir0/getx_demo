import 'package:flutter/material.dart';

class Route1Screen extends StatelessWidget {
  const Route1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("路由1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Get.to(), ",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              " Route1Screen 无需注册，直接跳转 ",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
