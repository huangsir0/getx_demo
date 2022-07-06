part of 'binding_ex_screen.dart';

class AddWidget extends GetWidget<BindingExController> {
  const AddWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
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
    );
  }
}
