import 'package:flutter/material.dart';

class Route3Screen extends StatelessWidget {
  const Route3Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("路由3"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Get.off系列; ",
              style: TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
    );
  }
}
