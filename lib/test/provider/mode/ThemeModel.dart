import 'package:flutter/material.dart';

/**
 * author : tianhj
 * date : 2020/7/8 11:39
 * description ： TODO:类的作用
 */
class ThemeModel with ChangeNotifier {
  static const kThemeColorIndex = 'kThemeColorIndex';
  static const kThemeUserDarkMode = 'kThemeUserDarkMode';
  static const kFontIndex = 'kFontIndex';

  static const fontValueList = ['system', 'kuaile'];

  /// 用户选择的明暗模式
  bool _userDarkMode;

  /// 当前主题颜色
  MaterialColor _themeColor;

  /// 当前字体索引
  int _fontIndex;
  int get fontIndex => _fontIndex;

  void switchTheme({bool userDarkMode, MaterialColor color}) {
    _userDarkMode = userDarkMode ?? _userDarkMode;
    _themeColor = color ?? _themeColor;
    notifyListeners();
  }






}
