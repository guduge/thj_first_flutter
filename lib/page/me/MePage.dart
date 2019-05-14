import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thj_first_flutter/Constants/Constants.dart';
import 'package:thj_first_flutter/events/LoginEvent.dart';
import 'package:thj_first_flutter/utils/UserUtil.dart';
import '../../component/IconTextButton.dart';
import 'SettingPage.dart';
import 'login/LoginPage.dart';
import '../test/TestVC.dart';
class MePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }

}
class RandomWordsState extends State<MePage> {

  bool isLogin = false;

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
  checkLogin() async{

    await UserUtil.checkLogin().then((res)=>{
        print("....."),
    print(res),
    setState(() {
      isLogin = res;
    }),
    print("....."),
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
    Constants.eventBus.on<LoginEvent>().listen((event) {
      setState(() {
        isLogin = true;
      });
      // 收到登录的消息，重新获取个人信息
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
     checkLogin();

  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("deactivate");

  }
  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("reassemble");

  }



  @override
  Widget build(BuildContext context) {

//    // TODO: implement build
    return new Scaffold(
      backgroundColor: Constants.nlColors.mainColor,
      appBar: new AppBar(
        elevation: 0.5,
        title: new Text("我的"),
        actions: <Widget>[
            IconTextButton(
                icon: "images/me/mine_nav_complaint.png",
                size:25,
                fontsize:8,
                text: "投诉建议",
                onTap: ()=>{
                    Navigator.push( context,
                    new MaterialPageRoute(builder: (context) {
                      return new  TestVC();
                    }))
              }
            ),
        ],
        leading: Builder(builder: (context) {

          return IconTextButton(
            icon: "images/me/mine_nav_setting.png",
            text: "设置",
            onTap: ()=>{
              Navigator.push( context,
                new MaterialPageRoute(builder: (context) {
                   return new  SettingPage();
              }))
            },
          );
        }),
      ),
      body:UserUtil.isLogin ? new MeHasLoginWidget():new MeNoLoginWidget(),
    );
  }
}
class MeHasLoginWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Column(
        children: <Widget>[
          TopSegmentView(),
        ],
      ),
    );
  }


  Widget TopSegmentView() {
    return new Container(
      height: 100,
      margin: new EdgeInsets.fromLTRB(20, 40, 20, 20),
      decoration: new BoxDecoration(
        color: Colors.white,
// 生成俩层阴影，一层绿，一层黄， 阴影位置由offset决定,阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
        boxShadow: [
          BoxShadow(
              color: Color(0xFFe9e9e9),
              offset: Offset(0, 3.0),
              blurRadius: 5.0,
              spreadRadius: 2.0),
        ],
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                  margin: new EdgeInsets.only(left: 20,right: 10),
                  child: new ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: new Image.asset("images/me/user_header_pl.png",width:60,height: 60,fit: BoxFit.fill,),
                  ),
                ),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("yl18301379671",style: TextStyle(color: Color(0xFF333333),fontSize: 18,),),
                    Text("点亮职业人生",style: TextStyle(color: Color(0xFF333333),fontSize: 12,height: 1.5),),
                  ],
                )
              ],
            ),
          ),
          new Container(
            width: 80,
            height: 80,
            child: new Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset("images/me/mine_facesign.png",width: 24,height: 24,fit: BoxFit.fill,),
                  Text("面授签到",style: TextStyle(color: Color(0xFF333333),fontSize: 12,height: 1.5))
                ],
              ),
            )
          )
        ],
      ),
    );
  }

}







//未登录
class MeNoLoginWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return createMeNoLoginWidget(context);
  }
  Widget createMeNoLoginWidget(BuildContext context){

    Widget getFlatButton(titile, patch) {
      return new Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 290,
            height: 40,
            margin: new EdgeInsets.only(top: 10),
            child: FlatButton(
                onPressed: ()=>{
                    Navigator.push( context,
                    new MaterialPageRoute(builder: (context) {
                      return patch;
                    }))
                  },
                  color: Color(0xFFFFECE8),
                  child: Text(titile),
                  textColor: Color(0xFFFF4040),
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
                  ),
           )
        ],
      );
    }
    return new Container(
      child: ListView(children: <Widget>[
        new  Container(
          margin:new EdgeInsets.fromLTRB(0, 70,0, 10),
          child: Image.asset("images/me/mine_sixqy.png",width: 226,height: 180,),
        ),
        Image.asset("images/me/mine_sixlab.png",width: 108,height: 42,),
        new Container(
          margin: new EdgeInsets.fromLTRB(0, 5,0, 70),
          child: Text("在优路购课学习，祝您点亮职业人生！", textAlign: TextAlign.center,style: new TextStyle(
            fontSize: 16,
          ),),
        ),
        Text("登录开启学习之旅", textAlign: TextAlign.center,style: new TextStyle(
          fontSize: 16,
        ),),
        getFlatButton("登录",new LoginPage()),
        getFlatButton("注册",new LoginPage()),

      ], ),
    );
  }

}