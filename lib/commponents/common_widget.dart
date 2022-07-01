import 'package:flutter/material.dart';

class CommonWidget extends StatelessWidget {
  const CommonWidget({Key? key, required this.onTap, required this.label})
      : super(key: key);

  final Function onTap;

  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        color: Colors.deepPurpleAccent,
        width: double.infinity,
        child: Text(
          label,
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
      ),
    );
  }
}
