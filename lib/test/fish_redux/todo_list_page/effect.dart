
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'state.dart';
import 'action.dart';
import 'todo_component/component.dart';
import '../global_store/store.dart';
import '../global_store/action.dart';

Effect<PageState> buildEffect() {
  return combineEffects(<Object, Effect<PageState>>{
    Lifecycle.initState: _init,
    PageAction.onAdd: _onAdd,
    PageAction.changeTheme:_ChangeTheme,
  });
}
void _init(Action action, Context<PageState> ctx) {
  final List<ToDoState> initToDos = <ToDoState>[
    ToDoState(
      uniqueId: '0',
      title: 'Hello world',
      desc: 'Learn how to program.',
      isDone: true,
    ),
    ToDoState(
      uniqueId: '1',
      title: 'Hello Flutter',
      desc: 'Learn how to build a flutter application.',
      isDone: true,
    ),
    ToDoState(
      uniqueId: '2',
      title: 'How Fish Redux',
      desc: 'Learn how to use Fish Redux in a flutter application.',
      isDone: false,
    )
  ];

  ctx.dispatch(PageActionCreator.initToDosAction(initToDos));
}
void _onAdd(Action action, Context<PageState> ctx) {
  Navigator.of(ctx.context)
      .pushNamed('todo_edit', arguments: null)
      .then((dynamic toDo) {
//    if (toDo != null &&
//        (toDo.title?.isNotEmpty == true || toDo.desc?.isNotEmpty == true)) {
//      ctx.dispatch(list_action.ToDoListActionCreator.add(toDo));
//    }
  });
}
void _ChangeTheme(Action action, Context<PageState> c) {
  //change global data
  GlobalStore.store.dispatch(GlobalActionCreator.onchangeThemeColor());
}

