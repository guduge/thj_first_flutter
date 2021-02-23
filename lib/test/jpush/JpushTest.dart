import 'package:flutter/material.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'dart:async';

import 'package:thj_first_flutter/Constants/Constants.dart';

import 'JPushEventBus.dart';
import 'JPushTool.dart';

class JPushTest extends StatefulWidget {
  @override
  _JPushTestState createState() => new _JPushTestState();
}

class _JPushTestState extends State<JPushTest> {
  String debugLable = 'Unknown';
  @override
  void initState() {
    super.initState();
    Constants.eventBus.on<JPushEventBus>().listen((event) {
      if (!mounted) return;
      setState(() {
        debugLable = event.debugLable;
      });
    });
  }
// 编写视图
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Plugin example app'),
        ),
        body: new Center(
            child: new Column(
                children:[
                  new Text('result: $debugLable\n'),
                  new FlatButton(
                      child: new Text('sendLocalNotification\n'),
                      onPressed: () {
                        // 三秒后出发本地推送
                        var fireDate = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch + 3000);
                        var localNotification = LocalNotification(
                            id: 234,
                            title: 'fadsfa',
                            buildId: 1,
                            content: 'fdas',
                            fireTime: fireDate,
                            subtitle: 'fasf',
                            badge: 5,
                        );
                        jPushTool.sendLocalNotification(localNotification).then((res) {
                          setState(() {
                            debugLable = res;
                          });
                        });

                      }),
                  new FlatButton(
                      child: new Text('getLaunchAppNotification\n'),
                      onPressed: () {
                        jPushTool.getLaunchAppNotification().then((map)=>{
                        setState(() {
                          debugLable = "getLaunchAppNotification success: $map";
                        })
                        });
                      }),
                  new FlatButton(
                      child: new Text('applyPushAuthority\n'),
                      onPressed: () {
                        jPushTool.applyPushAuthority();
                      }),
                  new FlatButton(
                      child: new Text('setTags\n'),
                      onPressed: () {
                        jPushTool.setTags(["lala","haha"]).then((res) {
                          setState(() {
                            debugLable = res;
                          });
                        });
                      }),
                  new FlatButton(
                      child: new Text('cleanTags\n'),
                      onPressed: () {
                        jPushTool.cleanTags().then((res) {
                          setState(() {
                            debugLable = res;
                          });
                        });
                      }),
                  new FlatButton(
                      child: new Text('addTags\n'),
                      onPressed: () {

                        jPushTool.addTags(["lala","haha"]).then((res) {
                          setState(() {
                            debugLable = res;
                          });
                        });

                      }),
                  new FlatButton(
                      child: new Text('deleteTags\n'),
                      onPressed: () {

                        jPushTool.deleteTags(["lala","haha"]).then((res) {
                          setState(() {
                            debugLable = res;
                          });
                        }) ;

                      }),
                  new FlatButton(
                      child: new Text('getAllTags\n'),
                      onPressed: () {

                        jPushTool.getAllTags().then((res) {
                          setState(() {
                            debugLable = res;
                          });
                        }) ;

                      }),
                  new FlatButton(
                      child: new Text('setAlias\n'),
                      onPressed: () {

                        jPushTool.setAlias("thealias11").then((res) {
                          setState(() {
                            debugLable = "setAlias success: $res";
                          });
                        });

                      }),
                  new FlatButton(
                      child: new Text('deleteAlias\n'),
                      onPressed: () {

                        jPushTool.deleteAlias().then((res) {
                          setState(() {
                            debugLable = "deleteAlias success: $res";
                          });
                        }) ;

                      }),
                  new FlatButton(
                      child: new Text('setBadge\n'),
                      onPressed: () {

                        jPushTool.setBadge(66).then((res) {
                          setState(() {
                            debugLable = res;
                          });
                        }) ;

                      }),
                  new FlatButton(
                      child: new Text('stopPush\n'),
                      onPressed: () {

                        jPushTool.stopPush();

                      }),
                  new FlatButton(
                      child: new Text('resumePush\n'),
                      onPressed: () {

                        jPushTool.resumePush();

                      }),
                  new FlatButton(
                      child: new Text('clearAllNotifications\n'),
                      onPressed: () {

                        jPushTool.clearAllNotifications();

                      }),


                ]
            )

        ),
      ),
    );
  }
}
