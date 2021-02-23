/**
 * author : tianhj
 * date : 2020/7/9 14:33
 * description ： TODO:类的作用
 */
import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  int _count = 0;
  int get value => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}