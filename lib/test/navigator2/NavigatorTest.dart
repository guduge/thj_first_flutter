import 'package:flutter/material.dart';

import 'Navigator1GenerateRoute.dart';
import 'Navigator1Routes.dart';
import 'Navigator1Widget.dart';

/// author : tianhj
/// date : 2021/2/23 12:00
/// description ： TODO:类的作用
/// https://mp.weixin.qq.com/s?__biz=MzIzMjYyNzQ2Ng==&mid=2247484244&idx=1&sn=dd4eed8a60e1d9a612b7937e699cf49e&scene=21#wechat_redirect
class NavigatorTest extends StatefulWidget {
  @override
  _NavigatorTestState createState() => _NavigatorTestState();
}

class _NavigatorTestState extends State<NavigatorTest> {

  _onPress(title, patch) {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return patch;
    }));
  }
  Widget getFlatButton(title, patch, {func: Function, type: 0}) {
    return Material(
      child: InkWell(
        focusColor: Colors.green,
        highlightColor: Colors.indigoAccent,
        hoverColor: Colors.deepOrange,
        splashColor: Colors.lightBlueAccent,
        onTap: () {
          type == 0 ? _onPress(title, patch) : func();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            color: Colors.cyanAccent,
//        margin: EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subhead,
              ),
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NavigatorTest'),
      ),
      body: Column(
        children: [
          getFlatButton("nav1 传统", new Navigator1Widget()),
          getFlatButton("nav1 路由表", new Navigator1Routes()),
          getFlatButton("nav1 onGenerateRoute", new Navigator1GenerateRoute()),

        ],
      ),

    );
  }
}

class Navigator2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomeScreen(),
        '/details': (context) => DetailScreen(),
      },

    );
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FlatButton(
          child: Text('View Details'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/details',
            );
          },
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FlatButton(
          child: Text('Pop!'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
