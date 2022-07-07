part of 'binding_ex_screen.dart';

class ExBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    //Get.put(BindingExController());
      Get.lazyPut(() => BindingExController());
  }
}
