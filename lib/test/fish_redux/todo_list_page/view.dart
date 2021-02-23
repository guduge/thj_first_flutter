import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:thj_first_flutter/test/fish_redux/todo_list_page/state.dart';

import 'action.dart';

Widget buildView(PageState state, Dispatch dispatch, ViewService viewService) {
  final ListAdapter adapter = viewService.buildAdapter();
  return Scaffold(
    appBar: AppBar(
      backgroundColor: state.themeColor,
      title: const Text('ToDoList'),
    ),
    body: Container(
      child: Column(
        children: <Widget>[
          viewService.buildComponent('report'),
          Expanded(
              child: ListView.builder(
                itemBuilder: adapter.itemBuilder,
                itemCount: adapter.itemCount,
              )
          )
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
       onPressed: () => dispatch(PageActionCreator.onAddAction()),
//      onPressed: () => dispatch(PageActionCreator.changeTheme()),
//    onPressed: (){
//      GlobalStore.store.dispatch(GlobalActionCreator.onchangeThemeColor());
//    },
      tooltip: 'Add',
      child: const Icon(Icons.add),
    ),
  );
}

