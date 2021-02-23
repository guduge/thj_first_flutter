import 'package:flutter/material.dart';

class Switcher with ChangeNotifier{

  bool checked = false;
  void check() {
    checked = !checked;
    notifyListeners();
  }
}