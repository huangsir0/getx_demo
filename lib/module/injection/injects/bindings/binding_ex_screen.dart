import 'package:flutter/material.dart';
import 'package:get/get.dart';

part 'ex_binding.dart';

part 'add_widget.dart';

part 'binding_ex_controller.dart';

class BindingExScreen extends GetView<BindingExController> {
  const BindingExScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("==========BindingExScreen=====build");
    //print("${controller.counter.toString()}");
    return Scaffold(
      appBar: AppBar(
        title: const Text("绑定的例子"),
      ),
      body: const AddWidget(),
    );
  }
}
