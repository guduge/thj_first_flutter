/**
 * author : tianhj
 * date : 2020/7/9 14:32
 * description ： TODO:类的作用
 */
import 'package:flutter/material.dart';

class ColorModel with ChangeNotifier {
  int _seed = 0xFFFF9000;
  Color _color = Color(0xFFFF9000);

  get color => _color;

  changeColor() {
    _seed += 30;
    _color = Color(_seed);
    notifyListeners();
  }
}