import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:thj_first_flutter/Constants/Constants.dart';
import 'package:thj_first_flutter/common/LocalStorage.dart';
import 'package:thj_first_flutter/model/UserInfo.dart';
import 'package:thj_first_flutter/page/test/GlobalKeyDemo.dart';
import 'package:thj_first_flutter/utils/ThemeUtil.dart';
import 'package:thj_first_flutter/utils/UserUtil.dart';
import 'package:toast/toast.dart';
import '../test/CustomScrollview.dart';
import '../test/ThemeTestRoute.dart';
import '../test/NotificationRouteTest.dart';
import '../test/GradientButtonRoute.dart';
import '../test/AnimateTest.dart';
import '../test/LifecyclePage.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../../Constants/config.dart';
import 'flutter_native_web.dart';
import 'WebViewExample.dart';
import 'CounterApp.dart';
import 'SlideDelete.dart';
import 'mode/UserTest1.dart';
class TestVC extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }

}
class RandomWordsState extends State<TestVC> {

  void loginrequest() async{

    UserUtil.login("18301379671", "123456").then((res)=>{
        getInfo(),
    Toast.show("sssss", context,gravity:Toast.CENTER ),

    });

  }
  getInfo() async{
    var userText = await  LocalStorage.get(Constants.USER_INFO);
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
              new CupertinoButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: Text('取消')),
              new CupertinoButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: Text('确认')),
            ],
          );
        }
    );
  }

  _onPress(title,patch){
    Navigator.push( context,
        new MaterialPageRoute(builder: (context) {
          return patch;
        }));
  }
  myFucn(){
    _showAlert();
  }
  Widget getFlatButton(title, patch ,{func:Function,type:0}) {

    return  GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        type == 0 ?  _onPress(title,patch) : func();
      },
      child: Container(
        height: 60.0,
        margin: EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                title,
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
              child: ListView(
                  children: <Widget>[
                  getFlatButton("cusScroll",new CustomScrollViewTestRoute()),
              getFlatButton("主题",new ThemeTestRoute()),
              getFlatButton("notification",new NotificationRoute()),
              getFlatButton("GradientButtonRouteTest",new GradientButtonRoute()),
              getFlatButton("animateTest", new ScaleAnimationRoute()),
              getFlatButton("swrap", new ExampleHorizontal()),
              getFlatButton("LifecycleAppPage", new LifecycleAppPage()),
              getFlatButton("method", null,type: 1,func: ()=>{
                  loginrequest()
              }),
          getFlatButton("WebViewExample", new WebViewExample()),
          getFlatButton("provide_counter", new CounterApp()),
          getFlatButton("GlobalKeyDemoState", GlobalKeyDemo()),
          getFlatButton("SlideDelete", SlideDelete()),
          getFlatButton("jsonTest", null,type: 1,func: ()=>{
              jsonTest()
          })

//          getFlatButton("flutter_native_web", new FlutterWebView()),
      ],
    )

    ),
      )
    );
  }

}
jsonTest(){

//  bool isDelete;
//  bool isSequential;

    Map<String, dynamic> testData = new Map();
    testData["orderStatus"] = "天豪杰";
    testData["isDelete"] = false;
    testData["isSequential"]= false;
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
        body: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.asset(
              images[index],
              fit: BoxFit.fill,
            );
          },
          indicatorLayout: PageIndicatorLayout.COLOR,
          autoplay: true,
          itemCount: images.length,
          pagination: new SwiperPagination(),
          control: new SwiperControl(),
        ));
  }
}

