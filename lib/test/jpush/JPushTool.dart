import 'package:flutter/services.dart';
import 'package:jpush_flutter/jpush_flutter.dart';
import 'package:thj_first_flutter/Constants/Constants.dart';

import 'JPushEventBus.dart';

class JPushTool {

    JPush jpush;
    String debugLable = 'Unknown';
    factory JPushTool() => _jpushTool();
    static JPushTool _instance;
    JPushTool._() {
      // 具体初始化代码
      jpush = new JPush();
    }
    static JPushTool _jpushTool() {
      if (_instance == null) {
        _instance = JPushTool._();
      }
      return _instance;
    }
    Future initPlatformState () async{

      String platformVersion;

      jpush.getRegistrationID().then((rid) {
          debugLable = "flutter getRegistrationID: $rid";
          print(debugLable);
          Constants.eventBus.fire(new JPushEventBus(debugLable));
      });

      jpush.setup(
        appKey: "b2a5b035d59c09add626a5cc",
        channel: "theChannel",
        production: false,
        debug: true,
      );
      jpush.applyPushAuthority(new NotificationSettingsIOS(
          sound: true,
          alert: true,
          badge: true));

      try {

        jpush.addEventHandler(
          onReceiveNotification: (Map<String, dynamic> message) async {
            print("flutter onReceiveNotification: $message");
            debugLable = "flutter onReceiveNotification: $message";
            Constants.eventBus.fire(new JPushEventBus(debugLable));
          },
          onOpenNotification: (Map<String, dynamic> message) async {
            print("flutter onOpenNotification: $message");
              debugLable = "flutter onOpenNotification: $message";
            Constants.eventBus.fire(new JPushEventBus(debugLable));
          },
          onReceiveMessage: (Map<String, dynamic> message) async {
            print("flutter onReceiveMessage: $message");
              debugLable = "flutter onReceiveMessage: $message";
            Constants.eventBus.fire(new JPushEventBus(debugLable));
          },
        );

      } on PlatformException {
        platformVersion = 'Failed to get platform version.';
      }
      // If the widget was removed from the tree while the asynchronous platform
      // message was in flight, we want to discard the reply rather than calling
      // setState to update our non-existent appearance.
        debugLable = platformVersion;
      Constants.eventBus.fire(new JPushEventBus(debugLable));
  }
  Future sendLocalNotification(localNotification) async{

    var  res =  await   jpush.sendLocalNotification(localNotification);
    return res;

  }
  Future getLaunchAppNotification () async{
      var debugLab = "";
     await jpush.getLaunchAppNotification().then((map) {

       debugLab = "getLaunchAppNotification success: $map";
    }).catchError((error) {
       debugLab = "getLaunchAppNotification error: $error";
    });
     return debugLab;
  }
    applyPushAuthority(){
      jpush.applyPushAuthority(NotificationSettingsIOS(badge: true, alert: true, sound: true));
    }
    Future setTags( tags )async{
      var debugLab = "";
      await jpush.setTags(tags).then((map) {
        var tags = map['tags'];
        debugLab = "set tags success: $map $tags";
      })
          .catchError((error) {
        debugLab = "set tags error: $error";
      }) ;
      return  debugLab;
    }
    Future cleanTags() async{
      var debugLab = "";
      await jpush.cleanTags().then((map) {
        var tags = map['tags'];
        debugLab = "set tags success: $map $tags";
      })
          .catchError((error) {
        debugLab = "set tags error: $error";
      }) ;
      return  debugLab;
    }
    Future addTags(adds) async {
      var debugLab = "";
      await jpush.addTags(adds).then((map) {
        var tags = map['tags'];
        debugLab = "addTags success: $map $tags";
      }).catchError((error) {
        debugLab = "addTags error: $error";
      });
      return debugLab;
    }
    Future deleteTags(tags) async {
      var debugLab = "";
      await jpush.deleteTags(tags).then((map) {
        var tags = map['tags'];
        debugLab = "addTags success: $map $tags";
      }).catchError((error) {
        debugLab = "addTags error: $error";
      });
      return debugLab;
    }
    Future getAllTags() async{
      var debugLab = "";
      await jpush.getAllTags().then((map) {
        debugLab = "addTags success: $map";
      }).catchError((error) {
        debugLab = "addTags error: $error";
      });
      return debugLab;
    }

    Future setAlias(Alias) async{
      var debugLab = "";
      await jpush.setAlias(Alias).then((map) {
        debugLab = "setAlias success: $map";
      }).catchError((error) {
        debugLab = "setAlias error: $error";
      }) ;
      return debugLab;
    }
    Future deleteAlias() async{
      var debugLab = "";
      await jpush.deleteAlias().then((map) {
        debugLab = "setAlias success: $map";
      }).catchError((error) {
        debugLab = "setAlias error: $error";
      }) ;
      return debugLab;
    }
    Future setBadge(badge) async{
      var debugLab = "";
      jpush.setBadge(badge).then((map) {
        debugLab = "setBadge success: $map";
      }).catchError((error) {
        debugLab = "setBadge error: $error";
      }) ;
      return debugLab;
    }
    stopPush(){
      jpush.stopPush();
    }
    resumePush(){
      jpush.resumePush();
    }
    clearAllNotifications(){
      jpush.clearAllNotifications();
    }

}

JPushTool jPushTool = JPushTool();
