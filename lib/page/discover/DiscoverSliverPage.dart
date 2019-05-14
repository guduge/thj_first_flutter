import 'dart:async';
import 'dart:convert';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'dart:math' as math;

import 'package:thj_first_flutter/page/discover/model/ProductItem.dart';


class DiscoverSliverPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new DiscoverSliverState();
  }
}

class DiscoverSliverState extends State<DiscoverSliverPage> {
  List<String> addStr = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  List<String> str = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];

  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

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
              refreshingText: "下拉刷新",
              refreshText: "下拉刷新",
              refreshedText: "refreshedText",
              refreshReadyText: "refreshReadyText",
              showMore: true,
            ),
            refreshFooter: ClassicsFooter(
              key: _footerKey,
              bgColor: Colors.transparent,
              textColor: Colors.black87,
              moreInfoColor: Colors.black54,
              showMore: true,
            ),
            child: CustomScrollView(slivers: [
              SliverList(
                delegate: SliverChildListDelegate([
                  DiscoverTopView()
                ]),
              ),
              _buildHeader(1),
              SliverList(
                delegate: SliverChildListDelegate(
                  str.map((product) {
                    return DiscoverItem();
                  }).toList(),
                ),
              ),
//              SliverFixedExtentList(
//                itemExtent: 115.0,
//                delegate: SliverChildListDelegate(
//                  str.map((product) {
//                    return DiscoverItem();
//                  }).toList(),
//                ),
//              ),
            ]),
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

  Widget _buildItemList(ProductItem product) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: ClipRRect(
                  child: SizedBox(
                    width: 65.0,
                    height: 65.0,
                    child: Image.asset(
                      product.asset,
                      fit: BoxFit.cover,
                    ),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverPersistentHeader _buildHeader(int index) {
    return SliverPersistentHeader(
      pinned: true,
      floating: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 45.0,
        maxHeight: 45.0,
        child: Container(
          color: Color(0xfff5f5f5),
          child: Padding(
              padding: new EdgeInsets.fromLTRB(15, 10, 0, 10),
              child: new Text(
                "考试资讯",
                style: new TextStyle(
                  fontSize: 18,
                  color: Color(0xFF666666),
                ),
              )),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
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
                              child: new Icon(
                                Icons.visibility,
                                color: Color(0xFF999999),
                                size: 15,
                              ),
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
        ]));
  }
}
