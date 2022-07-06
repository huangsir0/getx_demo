import 'package:flutter/material.dart';

class Route2Screen extends StatelessWidget {
  const Route2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("路由2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Get.toNamed(Routes.Route2); ",
              style: TextStyle(fontSize: 25),
            ),
            Text(
              " Route1Screen 需要注册",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
