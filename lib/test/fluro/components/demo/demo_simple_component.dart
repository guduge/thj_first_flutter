import 'package:flutter/material.dart';
class DemoSimpleComponent extends StatelessWidget {
  DemoSimpleComponent(
      {String message = "Testing",
        Color color = const Color(0xFFFFFFFF),
        String result})
      : this.message = message,
        this.color = color,
        this.result = result;
  final String message;
  final Color color;
  final String result;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }

}