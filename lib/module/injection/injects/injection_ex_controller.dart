import 'package:get/get.dart';

/// 注入的例子
class InjectionExController extends GetxController {
  final String Tag = "InjectionExController";


  final _counter = 0.obs;

  int get counter => _counter.value;

  void increment() {
    _counter.value++;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    print("==========$Tag=====onInit");
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print("==========$Tag=====onReady");
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("==========$Tag=====onClose");
  }
}
