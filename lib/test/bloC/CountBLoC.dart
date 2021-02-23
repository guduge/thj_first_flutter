import 'dart:async';
import 'package:rxdart/rxdart.dart';
//class CountBLoC {
//  int _count = 0;
//  var _countController = StreamController<int>.broadcast();
//
//  Stream<int> get stream => _countController.stream;
//  int get value => _count;
//
//  increment() {
//    _countController.sink.add(++_count);
//  }
//
//  dispose() {
//    _countController.close();
//  }
//}


class CountBLoC {
  int _count = 0;
  var _subject = BehaviorSubject<int>();

  Stream<int> get stream => _subject.stream;
  int get value => _count;

  void increment() => _subject.add(++_count);

  void dispose() {
    _subject.close();
  }
}
