import 'package:flutter/material.dart';

class CommonWidget extends StatelessWidget {
  const CommonWidget(
      {Key? key, required this.onTap, required this.label, this.fontSize = 26})
      : super(key: key);

  final Function onTap;

  final String label;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.deepPurpleAccent,
        ),
        alignment: Alignment.center,
        width: double.infinity,
        child: Text(
          label,
          style: TextStyle(fontSize: fontSize, color: Colors.white),
        ),
      ),
    );
  }
}
