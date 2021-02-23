import 'package:flutter/material.dart';

class Counter with ChangeNotifier{
  int value = 0;
  String hahh = '';
//  void increment() {
//    value += 1;
//    hahh = 'haha $value';
//    notifyListeners();
//  }
  increment() async {
    new Future.delayed(const Duration(seconds: 3), () => {
        value += 1,
        hahh = 'haha $value',
        notifyListeners(),
    });
  }
}
final Counter counter = new Counter();