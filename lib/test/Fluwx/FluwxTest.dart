import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'package:thj_first_flutter/test/Fluwx/pay_page.dart';
import 'package:thj_first_flutter/test/Fluwx/send_auth.dart';
import 'package:thj_first_flutter/test/Fluwx/share_mini_program.dart';
import 'package:thj_first_flutter/test/Fluwx/share_music.dart';
import 'package:thj_first_flutter/test/Fluwx/share_text_image.dart';
import 'package:thj_first_flutter/test/Fluwx/share_video_page.dart';
import 'package:thj_first_flutter/test/Fluwx/share_web_page.dart';
import 'package:thj_first_flutter/test/Fluwx/sign_auto_deduct_page.dart';
import 'package:thj_first_flutter/test/Fluwx/subscribe_message_page.dart';

import 'ShareImagePage.dart';
import 'auth_by_qr_code_page.dart';
import 'launch_mini_program_page.dart';

class FLuwxTest extends StatefulWidget {
  @override
  _FLuwxTestState createState() => new _FLuwxTestState();
}

class _FLuwxTestState extends State<FLuwxTest> {
  @override
  void initState() {
    super.initState();
    _initFluwx();
  }

  _initFluwx() async {
    await fluwx.register(
//        appId: "wx33dcbfab54dec6bd",//wxd930ea5d5a258f4f
        appId: "wxb4ba3c02aa476ea1",
        doOnAndroid: true,
        doOnIOS: true,
        enableMTA: false);
    var result = await fluwx.isWeChatInstalled();
    print("is installed $result");
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {}

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: <String, WidgetBuilder>{
        "shareText": (context) => ShareTextPage(),
        "shareImage": (context) => ShareImagePage(),
        "shareWebPage": (context) => ShareWebPagePage(),
        "shareMusic": (context) => ShareMusicPage(),
        "shareVideo": (context) => ShareVideoPage(),
        "sendAuth": (context) => SendAuthPage(),
        "shareMiniProgram": (context) => ShareMiniProgramPage(),
        "pay": (context) => PayPage(),
        "launchMiniProgram": (context) => LaunchMiniProgramPage(),
        "subscribeMessage": (ctx) => SubscribeMessagePage(),
        "AuthByQRCode": (ctx) => AuthByQRCodePage(),
        'AutoDeduct': (ctx) => SignAutoDeductPage(),
      },
      home: new Scaffold(
          appBar: new AppBar(
            title: const Text('Plugin example app'),
          ),
          body: ShareSelectorPage()),
    );
  }
}

class ShareSelectorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: new ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("shareText");
                },
                child: const Text("share text")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("shareImage");
                },
                child: const Text("share image")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("shareWebPage");
                },
                child: const Text("share webpage")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("shareMusic");
                },
                child: const Text("share music")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("shareVideo");
                },
                child: const Text("share video")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("shareMiniProgram");
                },
                child: const Text("share mini program")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("sendAuth");
                },
                child: const Text("send auth")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("pay");
                },
                child: const Text("pay")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("launchMiniProgram");
                },
                child: const Text("Launch MiniProgram")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("subscribeMessage");
                },
                child: const Text("SubscribeMessage")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("AuthByQRCode");
                },
                child: const Text("AuthByQRCode")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("AutoDeduct");
                },
                child: const Text("SignAuto-deduct")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new OutlineButton(
                onPressed: () {
                  fluwx.openWeChatApp();
                },
                child: const Text("Open WeChat App")),
          ),
        ],
      ),
    );
  }
}