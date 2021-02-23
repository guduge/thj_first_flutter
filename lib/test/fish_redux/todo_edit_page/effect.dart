import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:thj_first_flutter/test/fish_redux/global_store/action.dart';
import 'package:thj_first_flutter/test/fish_redux/global_store/store.dart';
import 'package:thj_first_flutter/test/fish_redux/todo_list_page/todo_component/state.dart';
import 'state.dart';
import 'action.dart';

Effect<TodoEditState>buildEffect(){
  return combineEffects({
    Lifecycle.initState:_init,
    ToDoEditAction.onDone: _onDone,
    ToDoEditAction.onChangeTheme: _onChangeTheme,

  });
}

void _init(Action action, Context<TodoEditState> ctx) {
  ctx.state.nameEditController.addListener(() {
    ctx.dispatch(
        ToDoEditActionCreator.update(ctx.state.nameEditController.text, null));
  });

  ctx.state.descEditController.addListener(() {
    ctx.dispatch(
        ToDoEditActionCreator.update(null, ctx.state.descEditController.text));
  });
}
void _onDone(Action action, Context<TodoEditState> ctx) {
  FocusScope.of(ctx.context).requestFocus(new FocusNode());
  Navigator.of(ctx.context).pop<ToDoState>(ctx.state.toDo);
}

void _onChangeTheme(Action action, Context<TodoEditState> ctx) {
  //change global data
  GlobalStore.store.dispatch(GlobalActionCreator.onchangeThemeColor());
}
