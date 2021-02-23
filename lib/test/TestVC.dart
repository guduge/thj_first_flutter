import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:thj_first_flutter/Constants/Constants.dart';
import 'package:thj_first_flutter/common/LocalStorage.dart';
import 'package:thj_first_flutter/component/net_loading_dialog.dart';
import 'package:thj_first_flutter/model/UserInfo.dart';
import 'package:thj_first_flutter/test/GlobalKeyDemo.dart';
import 'package:thj_first_flutter/test/scoped_model/ScopedModelPage.dart';
import 'package:thj_first_flutter/utils/ThemeUtil.dart';
import 'package:thj_first_flutter/utils/UserUtil.dart';
import 'package:toast/toast.dart';
import '../test/CustomScrollview.dart';
import '../test/ThemeTestRoute.dart';
import '../test/NotificationRouteTest.dart';
import '../test/GradientButtonRoute.dart';
import 'animate/AnimateTest.dart';
import '../test/LifecyclePage.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../Constants/config.dart';
import 'package:thj_first_flutter/test/bloC/CountBloCPage.dart';
import 'Fluwx/FluwxTest.dart';
import 'Fluwx/ShareImagePage.dart';
import 'ImagePickerTest.dart';
import 'LoadingDemo.dart';
import 'PushPageTest.dart';
import 'animate/PushAnimateTestPage.dart';
import 'animate/animate_page.dart';
import 'button_animate_demo.dart';
import 'flutter_native_web.dart';
import 'WebViewExample.dart';
import 'SlideDelete.dart';
import 'jpush/JpushTest.dart';
import 'mode/UserTest1.dart';
import 'package:fluwx/fluwx.dart' as fluwx;
import 'fluro/FluroMain.dart';
import 'package:common_utils/common_utils.dart';
import 'MyWebviewTest.dart';
import 'navigator2/NavigatorTest.dart';

class TestVC extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<TestVC> {
  final GlobalKey<LoadingDialog> loadingDialog = GlobalKey<LoadingDialog>();

  void loginrequest() async {
    UserUtil.login("18301379671", "123456").then((res) => {
          getInfo(),
          Toast.show("sssss", context, gravity: Toast.CENTER),
        });
  }

  getInfo() async {
    var userText = await LocalStorage.get(Constants.USER_INFO);
    var userMap = json.decode(userText);
    UserInfo user = UserInfo.fromJson(userMap);
    print("getInfo()==========");
    print(user.AreaName);
  }

  Future<void> _showAlert() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('我是title'),
            content: Text('我是content'),
            actions: <Widget>[
              new CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('取消')),
              new CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('确认')),
            ],
          );
        });
  }

  _onPress(title, patch) {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return patch;
    }));
  }

  myFucn() {
    _showAlert();
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
        child: Container(
//        margin: EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
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
  void initState() {
    // TODO: implement initState
    super.initState();
//    isInstallWx();
  }

  isInstallWx() async {
    await fluwx.register(
        appId: "wx33dcbfab54dec6bd",
        doOnAndroid: true,
        doOnIOS: true,
        enableMTA: false);
    var result = await fluwx.isWeChatInstalled();
    print("is installed $result");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            '测试',
            style: new TextStyle(color: Color(0xFF333333)),
          ),
        ),
        body: SafeArea(
          child: new Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Colors.lightBlue,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all( 8),
              child: GridView.count(
                //垂直子Widget之间间距
                mainAxisSpacing: 3.0,
                //GridView内边距
                //一行的Widget数量
                crossAxisCount: 3,
                crossAxisSpacing: 3,
                //子Widget宽高比例
              childAspectRatio: 1.5,
                children: <Widget>[
                  getFlatButton("cusScroll",new CustomScrollViewTestRoute()),
                  getFlatButton("主题",new ThemeTestRoute()),
                  getFlatButton("notification",new NotificationRoute()),
                  getFlatButton("GradientButtonRouteTest",new GradientButtonRoute()),
                  getFlatButton("animateTest", new AnimatePageTest()),
                  getFlatButton("swrap", new ExampleHorizontal()),
                  getFlatButton("LifecycleAppPage", new LifecycleAppPage()),
                  getFlatButton("method", null,type: 1,func: ()=>{
//                  loginrequest()
                  }),
                  getFlatButton("WebViewExample", new WebViewExample()),
                  getFlatButton("GlobalKeyDemoState", GlobalKeyDemo()),
                  getFlatButton("SlideDelete", SlideDelete()),
                  getFlatButton("jsonTest", null,type: 1,func: ()=>{
                    jsonTest()
                  }),
                  getFlatButton("CountBloCPage", CountBloCPage()),
                  getFlatButton("ScopedModelPage", ScopedModelPage()),
                  getFlatButton("dialogTest", null,type: 1,func: ()=>{
                    dialogTest()
                  }),
                  getFlatButton("LoadingDemo", LoadingDemo()),
                  getFlatButton("FLuwxTest", FLuwxTest()),
                  getFlatButton("JPushTest",JPushTest()),
                  getFlatButton("fluroTest",AppComponent()),
                  getFlatButton("MyWebviewTest",MyWebviewTest()),
                  getFlatButton("ImagePickerTest",ImagePickerTest()),
                  getFlatButton("PushAnimateTestPage",PushAnimateTestPage()),
                  getFlatButton("iconButtonAnimate",ButtonAnimateDemo()),
                  getFlatButton("iconButtonAnimate",ButtonAnimateDemo()),
                  getFlatButton("PageA",PageA()),
                  getFlatButton("NavigatorTest",NavigatorTest()),

                ],
              ),
            ),
          ),
        ));
  }

  dialogTest() {
    showDialog(
        context: context,
        builder: (context) {
          return NetLoadingDialog(
            outsideDismiss: false,
            key: loadingDialog,
          );
        });
    print("xxxxxxxxxxyyyyyyyyx");
    Future.delayed(Duration(seconds: 2),
        () => {print("xxxxxxxxxxx"), loadingDialog.currentState.dismissDis()});
  }
}

jsonTest() {
//  bool isDelete;
//  bool isSequential;

  Map<String, dynamic> testData = new Map();
  testData["orderStatus"] = "天豪杰";
  testData["isDelete"] = false;
  testData["isSequential"] = false;
//    testData["orderStatusArray"] = ["2","x"];

  UserTest1 userTest = UserTest1.fromMap(testData);
  print(userTest.isDelete);
}

class ExampleHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("ExampleHorizontal"),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: new Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Image.network(
                  images[index],
                  fit: BoxFit.fill,
                ),
              );
            },
            pagination: new SwiperPagination(
                margin: new EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                builder: new DotSwiperPaginationBuilder(
                  color: Color(0xFF999999),
                  activeColor: Colors.white,
                  size: 8.0,
                )),
            itemCount: images.length,
            viewportFraction: 0.9,
            autoplay: true,
          ),
        ));
  }
}
