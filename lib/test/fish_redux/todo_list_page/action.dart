import 'package:fish_redux/fish_redux.dart';

import 'todo_component/state.dart';

enum PageAction { initToDos, onAdd ,changeTheme}

class PageActionCreator {
  static Action initToDosAction(List<ToDoState> toDos) {
    return Action(PageAction.initToDos, payload: toDos);
  }

  static Action onAddAction() {
    return const Action(PageAction.onAdd);
  }
  static Action changeTheme() {
    return const Action(PageAction.changeTheme);
  }
}
