import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thj_first_flutter/Constants/Constants.dart';
import 'package:thj_first_flutter/common/LocalStorage.dart';
import 'package:thj_first_flutter/model/UserInfo.dart';
import 'package:thj_first_flutter/utils/ThemeUtil.dart';
import 'package:thj_first_flutter/utils/UserUtil.dart';
import 'package:toast/toast.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
class DiscoverPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<DiscoverPage> {
  List<String> addStr = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  List<String> str = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];

  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

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

  final List<String> data = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16"
  ];
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        title: Text("发现"),
      ),
      body: new Container(
          color: Color(0xfff5f5f5),
          child: new EasyRefresh(
            key: _easyRefreshKey,
            behavior: ScrollOverBehavior(),
            refreshHeader: ClassicsHeader(
              key: _headerKey,
              bgColor: Colors.transparent,
              textColor: Colors.black87,
              moreInfoColor: Colors.black54,
              showMore: true,
            ),
            refreshFooter: ClassicsFooter(
              key: _footerKey,
              bgColor: Colors.transparent,
              textColor: Colors.black87,
              moreInfoColor: Colors.black54,
              showMore: true,
            ),
            child: new ListView.builder(
                //ListView的Item
                itemCount: str.length,
                itemBuilder: (BuildContext context, int index) {
                  return index == 0
                      ? new DiscoverTopView()
                      : new DiscoverItem(index: index, data: str);
                }),
            onRefresh: () async {
              await new Future.delayed(const Duration(seconds: 1), () {
                setState(() {
                  str.clear();
                  str.addAll(addStr);
                });
              });
            },
            loadMore: () async {
              await new Future.delayed(const Duration(seconds: 1), () {
                if (str.length < 20) {
                  setState(() {
                    str.addAll(addStr);
                  });
                }
              });
            },
          )),
    );
  }
}

class DiscoverItem extends StatelessWidget {
  final int index;
  final data;
  const DiscoverItem({
    Key key,
    this.index,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: new EdgeInsets.fromLTRB(20, 20, 20, 0),
      color: Colors.white,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: new Container(
                    height: 73,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new Text(
                      "2018消防备考知识点：安全出口设置要点安全出口设置要点,",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 16,
                      ),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new Container(
                              margin: new EdgeInsets.only(right: 3),
                              child: new Icon(Icons.visibility,color: Color(0xFF999999),size: 15,),
                            ),

                            new Text(
                              "2334人阅读",
                              style: TextStyle(
                                color: Color(0xFF999999),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        new Text(
                            "2018-07-32",
                            style: TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 12,
                            ),
                        )
                      ],
                    )
                  ],
                ),
              )),
              //right image
              new Container(
                margin: new EdgeInsets.only(left: 20),
                height: 73,
                width: 118,
                child: new Image.network(
                  "https://www.niceloo.com/UpLoad/Picture/Advertisement/20190308/201903080917008804283611761.jpg",
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
          //line
          new Container(
            margin: new EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: Color(0xFFf5f5f5),
          ),
          
        ],
      ),
    );
  }
}

class DiscoverTopView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
        child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          new GestureDetector(
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                new Image.asset('images/discover/discover_topnotice.png',
                    fit: BoxFit.fill),
                new Container(
                  padding: new EdgeInsets.fromLTRB(15, 20, 15, 20),
                  decoration: new BoxDecoration(
                      color: Colors.white,
                      border: new Border(
                          top: new BorderSide(
                              color: Color(0xFFf5f5f5),
                              width: 1,
                              style: BorderStyle.solid))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          flex: 8,
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                "2017年一级消防工程师合格证书领取时间2017年一级消防工程师合格证书领取时间｜入口",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: new TextStyle(
                                  height: 1.1,
                                  color: Color(0xFF333333),
                                  fontSize: 16,
                                ),
                              ),
                              new Text(
                                "2018消防工程师精讲课全新上线",
                                style: new TextStyle(
                                  height: 1.1,
                                  color: Color(0xFF333333),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        new Container(
                          width: 20,
                          margin: new EdgeInsets.only(left: 20),
                          child: new Icon(
                            Icons.keyboard_arrow_right,
                            color: Color(0xFF999999),
                          ),
                        ),
                      ]),
                )
                //考试咨询
              ])),
          //考试咨询
          new Padding(
            padding: new EdgeInsets.fromLTRB(15, 10, 0, 10),
            child: new Text(
              "考试资讯",
              style: new TextStyle(
                fontSize: 18,
                color: Color(0xFF666666),
              ),
            ),
          )
        ]));
  }
}
