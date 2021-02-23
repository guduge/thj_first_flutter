


/**
 * author : tianhj
 * date : 2020/7/10 16:38
 * description ： TODO:类的作用
 */
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:redux/redux.dart';

import 'reducer.dart';
import 'count_state.dart';
import 'top_screen.dart';


//应用顶层
void reduxRun() {
  final store =
  Store<CountState>(reducer, initialState: CountState.initState());
  runApp(new ReduxLearnPage(store));
}


class ReduxLearnPage extends  StatelessWidget {
  final Store<CountState> store;

  ReduxLearnPage(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<CountState>(
      store: store,
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TopScreen(),
      ),
    );
  }

}
