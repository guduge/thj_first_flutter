import 'package:flutter/material.dart';

/**
 * author : tianhj
 * date : 2020/7/15 17:32
 * description ： TODO:类的作用
 */
class PageA extends StatefulWidget  {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PageAState();
  }

}
class PageAState extends State<PageA> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: 3,
    );
  }
  @override
  Widget build(BuildContext context) {
    print("pageA---build--");
    // TODO: implement build
    return Scaffold(
      appBar:  AppBar(
        title: Text("PageA"),
        leading: Builder(builder: (context) {

          return InkWell(
           child: Text("ToPageB"),
            onTap: ()=>{
              Navigator.push( context,
                  new MaterialPageRoute(builder: (context) {
                    return new  PageB();
                  }))
            },
          );
        }),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 45.0,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 0.1), width: 1))),
            child: TabBar(
              tabs: <Widget>[
                Tab(
                  child: Center(
                    child: Text(
                      "今日统计",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Tab(
                  child: Center(
                      child: Stack(
                        overflow: Overflow.visible,
                        children: <Widget>[
                          Text(
                            "我的追问",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      )
                  ),
                ),
                Tab(
                  child: Center(
                    child: Text(
                      "我的答疑",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
              isScrollable: false,
              labelColor: Color(0xFF333333),
              unselectedLabelColor: Color(0xFF999999),
              controller: _tabController,
            ),
          ),
          Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                PageB(),
                PageB(),
                PageB(),
        ],
      ))]));

  }
}
class PageB extends StatefulWidget  {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PageBState();
  }

}
class PageBState extends State<PageB>  with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState----pageB");
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Center(
        child: Text("pageB"),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}

//      body: Column(
//        children: <Widget>[
//          InkWell(
//            onTap: ()=>{
//              Navigator.push( context,
//                  new MaterialPageRoute(builder: (context) {
//                    return new  PageB();
//                  }))
//            },
//            child: Text("to PageB"),
//          )
//        ],
//      ),