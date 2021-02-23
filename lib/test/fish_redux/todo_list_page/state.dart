import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import 'package:thj_first_flutter/test/fish_redux/global_store/state.dart';

import 'report_component/state.dart';
import 'todo_component/component.dart';

class PageState implements GlobalBaseState, Cloneable<PageState> {
  List<ToDoState> toDos;

  @override
  Color themeColor;

  @override
  PageState clone() {
    return PageState()
      ..toDos = toDos
      ..themeColor = themeColor;
  }
}

PageState initState(Map<String, dynamic> args) {
  //just demo, do nothing here...
  return PageState();
}

class ReportConnector extends Reselect2<PageState, ReportState, int, int> {
  @override
  ReportState computed(int sub0, int sub1) {
    // TODO: implement computed
    return ReportState()
      ..done = sub0
      ..total = sub1;
  }

  @override
  int getSub0(PageState state) {
    // TODO: implement getSub0
    return state.toDos.where((ToDoState tds) => tds.isDone).toList().length;;
  }

  @override
  int getSub1(PageState state) {
    // TODO: implement getSub1
    return state.toDos.length;
  }

  @override
  void set(PageState state, ReportState subState) {
    // TODO: implement set
    throw Exception('Unexcepted to set PageState from ReportState');
  }
}

