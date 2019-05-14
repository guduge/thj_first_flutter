import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:thj_first_flutter/page/test/CounterApp.dart';
import 'package:thj_first_flutter/page/test/mode/Counter.dart';
import 'package:thj_first_flutter/page/test/mode/Switcher.dart';
import 'package:thj_first_flutter/utils/UserUtil.dart';
import './page/base/MainPage.dart';

void main() {
  UserUtil.checkLogin();
//  var counter = Counter();
  var providers = Providers();
  var switcher = Switcher();
  //将counter对象添加进providers
  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<Switcher>.value(switcher));
  runApp(ProviderNode(child: MainPageWidget(), providers: providers));
}

//void main() => runApp(
//   new MainPageWidget()
//);

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: new ThemeData(
          primaryColor: Colors.white
      ),
      home: CounterApp()
    );
  }
}


