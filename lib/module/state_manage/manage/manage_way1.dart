import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManageWay1Screen extends StatelessWidget {
  const ManageWay1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("-----ManageWay1Screen   build ");
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetBuilder"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetBuilder<ManageWay1Controller>(
              init: ManageWay1Controller(),
              builder: (controller) {
                return Text(
                  controller.counter.toString(),
                  style: const TextStyle(fontSize: 30),
                );
              }),
          const SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () {
              //controller.increment();
              Get.find<ManageWay1Controller>().increment();
            },
            child: Text("Add"),
          ),
        ],
      )),
    );
  }
}

///  控制器
class ManageWay1Controller extends GetxController {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    update();
  }
}
