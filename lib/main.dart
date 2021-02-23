import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_bugly/flutter_bugly.dart';
import 'package:provider/provider.dart';
import 'package:thj_first_flutter/page/base/bar_scroll.dart';
import 'package:thj_first_flutter/test/jpush/JPushTool.dart';
import 'package:thj_first_flutter/test/provider/MainProvider.dart';
import 'package:thj_first_flutter/test/provider/MyHomePage.dart';
import 'package:thj_first_flutter/test/provider/goods/goods_main.dart';
import 'package:thj_first_flutter/test/provider/mode/provider_manager.dart';
import 'package:thj_first_flutter/utils/UserUtil.dart';
import './page/base/MainPage.dart';
import 'dart:math' as math;
import './test/fish_redux/app.dart';
//import 'package:mobpush/mobpush.dart';

import 'package:thj_first_flutter/test/fish_redux/app.dart';

import 'test/redux/main_redux.dart';

// fish_redux test
//void main() => runApp(createApp());

void main() {

//  FlutterBugly.postCatchedException(() {});

  runApp(new MyApp());
  UserUtil.checkLogin();

//    Mobpush.setAPNsForProduction(false);

//    jPushTool.initPlatformState();

//    FlutterBugly.init(
//      androidAppId: "your android id",
//      iOSAppId: "7bce5d907b",
//    ).then((_result) {
//      print("---------result");
//      print(_result.isSuccess);
//      print(_result..message);
//    });
//    FlutterBugly.setUserId("18301379671");
//    FlutterBugly.putUserData(key: "thj", value: "18300000");
//    int tag = 12345688;
//    FlutterBugly.setUserTag(tag);

//    runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: new ThemeData(
          primaryColor: Colors.white
      ),
      home: MainPageWidget()
    );
  }
}


//provider
//void main() {
////  Provider.debugCheckInvalidValueType = null;
////  print("main run---");
////  runApp(MainProvoder());
//  good_main();
//
//}

/// redux
//void main() {
////  Provider.debugCheckInvalidValueType = null;
////  print("main run---");
////  runApp(MainProvoder());
//  reduxRun();
//
//}
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    print("MyApp--build---");
//    return const MaterialApp(
//      home: MyHomePage(),
//    );
//  }
//}

