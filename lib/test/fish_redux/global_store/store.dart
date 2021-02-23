import 'package:fish_redux/fish_redux.dart';
import 'package:thj_first_flutter/test/fish_redux/global_store/reducer.dart';
import 'package:thj_first_flutter/test/fish_redux/global_store/state.dart';

class GlobalStore {
  static Store<GlobalState> _globalStore;

  static Store<GlobalState> get store =>
      _globalStore ??= createStore<GlobalState>(GlobalState(), buildReducer());
}
