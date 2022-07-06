import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageWay2Screen extends StatelessWidget {
  ManageWay2Screen({Key? key}) : super(key: key);

  ManageWay2Controller controller = Get.put(ManageWay2Controller());

  @override
  Widget build(BuildContext context) {
    print("-----ManageWay2Screen   build ");
    return Scaffold(
      appBar: AppBar(
        title: const Text("响应式"),
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

///  控制器
class ManageWay2Controller extends GetxController {
  final _counter = 0.obs;

  int get counter => _counter.value;

  void increment() {
    _counter.value++;
  }
}
