import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action,Page;
import 'package:thj_first_flutter/test/fish_redux/todo_edit_page/page.dart';
import 'package:thj_first_flutter/test/fish_redux/todo_list_page/page.dart';

import 'global_store/state.dart';
import 'global_store/store.dart';


Widget createApp() {

  final AbstractRoutes routes = PageRoutes(pages:
      <String, Page<Object,dynamic>>{
        'todo_list': ToDoListPage(),
        'todo_edit': TodoEditPage()

        /// 注册Todo编辑页面
      },
      visitor: (String path, Page<Object,dynamic> page){
        if(page.isTypeof<GlobalBaseState>()){
          page.connectExtraStore<GlobalState>(GlobalStore.store,(Object pagestate, GlobalState appState){
            final GlobalBaseState p = pagestate;
            if (p.themeColor != appState.themeColor) {
              if (pagestate is Cloneable) {
                final Object copy = pagestate.clone();
                final GlobalBaseState newState = copy;
                newState.themeColor = appState.themeColor;
                return newState;
              }
            }
            return pagestate;
          });
        }

        page.enhancer.append(

          /// View AOP
          viewMiddleware: <ViewMiddleware<dynamic>>[
            safetyView<dynamic>(),
          ],


          /// Adapter AOP
          adapterMiddleware: <AdapterMiddleware<dynamic>>[
            safetyAdapter<dynamic>()
          ],

          /// Effect AOP
          effectMiddleware: [
            _pageAnalyticsMiddleware<dynamic>(),
          ],
          /// Store AOP
          middleware: <Middleware<dynamic>>[
            logMiddleware<dynamic>(tag: page.runtimeType.toString()),
          ],


        );


      }

  );
  return MaterialApp(
    title: "nl",
    debugShowCheckedModeBanner: true,
    theme: ThemeData(
      primarySwatch: Colors.blue
    ),
    home: routes.buildPage("todo_list", null),
//    home: TestPage(),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    }

  );
}

EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
          print('${logic.runtimeType} ${action.type.toString()} ');
        }
        return effect?.call(action, ctx);
      };
    };
  };
}

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("xxxx"),
      ),
      body: Center(
        child: Text("xxxxxxx"),
      ),
    );
  }
}

