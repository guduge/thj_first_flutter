import 'package:flutter/foundation.dart';
class CounterModel with ChangeNotifier {
    int _count = 0;
    int get count => _count;
    void increment(){
      _count++;
      print(_count);
      notifyListeners();
    }

}