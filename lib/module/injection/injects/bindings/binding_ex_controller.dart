part of 'binding_ex_screen.dart';

class BindingExController extends GetxController {
  final String Tag = "BindingExController";

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
