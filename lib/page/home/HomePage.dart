import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:thj_first_flutter/Constants/Constants.dart';
import 'package:thj_first_flutter/component/IconTextButton.dart';
import 'package:thj_first_flutter/test/jpush/JPushEventBus.dart';
import '../../Constants/config.dart';
//import 'package:toast/toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  bool isloading = true;
  RefreshController _refreshController;
  List testList = [1,2];
  @override
  initState() {
    print('initState');
    super.initState();
    _refreshController = RefreshController();
    new Future.delayed(
        new Duration(seconds: 2),
        () => {
        showToast(),
              setState(() {
                isloading = false;
              }),
//              Toast.show("优路教育", context, gravity: Toast.CENTER),
//      }),
            });
    Constants.eventBus.on<JPushEventBus>().listen((event) {
//      if (!mounted) return;
      print("homePage about Jpush --------- " + event.debugLable );
    });


  }
  void _onRefresh(){


    _refreshController.refreshCompleted();

    /*.  after the data return,
        use _refreshController.refreshComplete() or refreshFailed() to end refreshing
   */
  }

  void _onLoading(){
    _refreshController.loadComplete();
    /*
        use _refreshController.loadComplete() or loadNoData() to end loading
   */
  }


  showToast(){

    Fluttertoast.showToast(
        msg: "优路教育",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Constants.nlColors.mainColor,
      appBar: new AppBar(
        elevation: 0.5,
        title: new Text(
          '首页',
          style: new TextStyle(color: Color(0xFF333333)),
        ),
        actions: <Widget>[
          IconTextButton(
              icon: "images/home/home_consult.png",
              size: 20,
              fontsize: 12,
              text: "咨询",
              onTap: () => {}),
        ],
        leading: Builder(builder: (context) {
          return new GestureDetector(
              onTap: () => {},
              child: new Center(
                child: new Container(
                  padding: new EdgeInsets.only(left: 10),
                  child: Text("考试分类",
                      style: new TextStyle(
                        fontSize: 10,
                      )),
                ),
              ));
        }),
      ),
      body: isloading
          ? new Center(

              // CircularProgressIndicator是一个圆形的Loading进度条
              child: new CircularProgressIndicator(),
            )
          :SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child:buildMain()
      )
    );
  }
  buglyTest(){
    print("xxxxxxx");
    int a = testList[5];
    print(a);
  }
  Widget buildMain(){
    return ListView(
          children: <Widget>[
            //banner
            HomeBanner(buglyTest),
            TopSegmentView(),
            LiveCourseWidget(),
            new Container(
              width: MediaQuery.of(context).size.width,
              height: 10,
              color: Constants.nlColors.mainColor,
            ),
            CommendCourseWidget(context)
          ],
      );
  }
}

Widget HomeBanner(tapAction) {
  return new Container(
    color: Colors.white,
    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
    child: Swiper(
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: Container(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Image.network(
              images[index],
              fit: BoxFit.fill,
            ),
          ),
          onTap: ()=>{
            print("InkWell------"),
            tapAction()
          },
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
    height: 168,
  );
}

Widget TopSegmentView() {
  return new Container(
    height: 80,
    margin: new EdgeInsets.all(20),
    decoration: new BoxDecoration(
      color: Colors.white,
// 生成俩层阴影，一层绿，一层黄， 阴影位置由offset决定,阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
      boxShadow: [
        BoxShadow(
            color: Color(0x99f2f2f2),
            offset: Offset(0, 3.0),
            blurRadius: 3.0,
            spreadRadius: 2.0),
      ],
    ),
    child: new Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: IconTextButton(
              icon: "images/home/home_course.png",
              size: 36,
              fontsize: 15,
              text: "报班课",
              onTap: () => {}),
        ),
        Expanded(
          flex: 1,
          child: IconTextButton(
              icon: "images/home/home_micro.png",
              size: 36,
              fontsize: 15,
              text: "免费课",
              onTap: () => {}),
        ),
        Expanded(
          flex: 1,
          child: IconTextButton(
              icon: "images/home/home_exam.png",
              size: 36,
              fontsize: 15,
              text: "题库",
              onTap: () => {}),
        ),
        Expanded(
          flex: 1,
          child: IconTextButton(
              icon: "images/home/home_question.png",
              size: 36,
              fontsize: 15,
              text: "答疑",
              onTap: () => {}),
        ),
      ],
    ),
  );
}

Widget HomeSectionView(title, sub, titleBtn) {
  return new Container(
    padding: new EdgeInsets.fromLTRB(15, 0, 15, 0),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Container(
                margin: new EdgeInsets.only(right: 10),
                width: 4,
                height: 18,
                color: Color(0xFFE73928),
              ),
              new Text(
                title,
                style: new TextStyle(fontSize: 18, color: Color(0xFF333333)),
              ),
              Text(
                sub,
                style: new TextStyle(fontSize: 14, color: Color(0xFF666666)),
              )
            ],
          ),
        ),
        GestureDetector(
            onTap: () => {},
            child: new Container(
                width: 65,
                height: 25,
                decoration: new BoxDecoration(
                    color: Color(0xFFFFECE8),
                    borderRadius: new BorderRadius.all(Radius.circular(10))),
                child: new Center(
                  child: Text(
                    titleBtn,
                    style:
                        new TextStyle(fontSize: 12, color: Color(0xFFFF4040)),
                  ),
                )))
      ],
    ),
  );
}

//直播课
Widget LiveCourseWidget() {
  return new Container(
    color: Colors.white,
    child: new Column(
      children: <Widget>[
        HomeSectionView("直播课", " | 考点重点精准解析", "全部课程"),
        new SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: new Container(
                margin: new EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(children: LiveCourseItems(["1", "2", "3", "4"]))))
      ],
    ),
  );
}

Widget LiveCourseItem(value) {
  return new Container(
    width: 162,
    height: 120,
    margin: new EdgeInsets.fromLTRB(15, 5, 0, 5),
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Container(
          margin: new EdgeInsets.only(bottom: 10),
          child: new Image.network(
            "http://www.niceloo.com/UpLoad/Picture/Advertisement/20190130/201901301706158467532798618.jpg",
            fit: BoxFit.fill,
            width: 162,
            height: 93,
          ),
        ),
        Expanded(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("21313人学习",
                  style: TextStyle(
                    color: Color(0xFF999999),
                    fontSize: 12,
                  )),
              Text(
                "免费",
                style: TextStyle(color: Color(0xFFFF4040), fontSize: 12),
              )
            ],
          ),
        )
      ],
    ),
  );
}

LiveCourseItems(data) {
  List<Widget> courseItems = [];
  for (var value in data) {
    courseItems.add(LiveCourseItem(value));
  }
  return courseItems;
}

CommendCourseWidget(context) {
  return new Container(
    margin: new EdgeInsets.only(top: 10),
    color: Colors.white,
    child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HomeSectionView("推荐班课", "", "更多"),
          new Container(
              width: MediaQuery.of(context).size.width,
              padding: new EdgeInsets.fromLTRB(20, 0, 20, 0),
              margin: new EdgeInsets.fromLTRB(0, 10, 0, 5),
              child: new Column(
                children: <Widget>[

                  new Image.network(
                    "http://www.niceloo.com/UpLoad/Picture/Advertisement/20190408/201904081027255918378340600.jpg",
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width,

                  ),
                  new Container(
                    margin: new EdgeInsets.only(top: 5,bottom: 5),
                    child: new Text("2019消防试听课：21场专题直播，基础学习不再难基础学习不再难基础学习不再难",
                      maxLines: 2,
                      style: new TextStyle(
                        color: Color(0xff333333),
                        fontSize: 16,
                      ),),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("¥ 1000",style: TextStyle(
                        color: Constants.nlColors.mainredColr,
                        fontSize: 20,
                      ),),
                      NLText("直播vip班"),
                    ],
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("64901 人关注"),
                      Text("咨询报班",)
                    ],
                  )
                ],
              ))
        ]),
  );
}
NLText(text){

  return new Container(
    padding: new EdgeInsets.fromLTRB(2,0, 2, 0),
    decoration: new BoxDecoration(
      border: new Border.all(color:Color(0xFF2BB1FB),width: 1,style:BorderStyle.solid)
    ),
    child: new Center(
      child: Text(
        text,
        style: new TextStyle(
          color: Color(0xFF2BB1FB),
          fontSize: 12,
        ),
      ),
    )
  );
}