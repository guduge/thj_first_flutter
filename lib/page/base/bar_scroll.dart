import 'package:flutter/material.dart';
import 'package:thj_first_flutter/page/discover/DiscoverSliverPage.dart';
import 'package:thj_first_flutter/page/home/HomePage.dart';
import 'package:thj_first_flutter/page/me/MePage.dart';
import 'package:thj_first_flutter/utils/ThemeUtil.dart';

/**
 * 有状态StatefulWidget
 *  继承于 StatefulWidget，通过 State 的 build 方法去构建控件
 */
class BotomeMenumTabBarPage extends StatefulWidget {
  ////通过构造方法传值
  BotomeMenumTabBarPage();

  //主要是负责创建state
  @override
  BotomeMenumTabBarPageState createState() => BotomeMenumTabBarPageState();
}

/**
 * 在 State 中,可以动态改变数据
 * 在 setState 之后，改变的数据会触发 Widget 重新构建刷新
 */
class BotomeMenumTabBarPageState extends State<BotomeMenumTabBarPage>  with SingleTickerProviderStateMixin{
  BotomeMenumTabBarPageState();
  TabController tabController;
  var _pageList;
  Color themeColor = ThemeUtils.currentColorTheme;
  int _tabIndex = 0;
  var tabImages;
  var appBarTitles = ['首页', '发现', '我的'];

  @override
  void initState() {
    ///初始化，这个函数在生命周期中只调用一次
    super.initState();
    /*
     * 三个子界面
     */
    _pageList = [
      new HomePage(),
      new DiscoverSliverPage(),
      new MePage(),
    ];

    tabController = new TabController(length: _pageList.length, vsync: this);
    tabController.addListener(() {
      var index = tabController.index;

      if( index == tabController.animation.value) {
        print("xxxxxxxxx"+index.toString());
        setState((){
          _tabIndex = index;
        });
      }
    });


    tabImages = [
      [getTabImage('images/tabbar/home.png'), getTabImage('images/tabbar/home_select.png')],
      [getTabImage('images/tabbar/discover.png'), getTabImage('images/tabbar/discover_select.png')],
      [getTabImage('images/tabbar/me.png'), getTabImage('images/tabbar/me_select.png')]
    ];



  }




  @override
  Widget build(BuildContext context) {
    //构建页面
    return buildBottomTabScaffold();
  }

  Image getTabImage(path) {
    return new Image.asset(path, width: 22.0, height: 22.0);
  }


  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

/*
   * 获取bottomTab的颜色和文字
   */
Text getTabTitle(int curIndex) {
  if (curIndex == _tabIndex) {
    return new Text(appBarTitles[curIndex],
        style: new TextStyle(color: const Color(0xffE73928)));
  } else {
    return new Text(appBarTitles[curIndex],
        style: new TextStyle(color: const Color(0xff515151)));
  }

}

  Widget buildBottomTabScaffold() {
    return new Scaffold(
      body: new TabBarView(controller: tabController, children:_pageList),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: SafeArea(
          child: new TabBar(
            onTap: (index){
              setState((){
                _tabIndex = index;
              });
            },
            controller: tabController,
            tabs: <Tab>[
              new Tab(child: getTabTitle(0), icon: getTabIcon(0)),
              new Tab(child: getTabTitle(1), icon: getTabIcon(1)),
              new Tab(child: getTabTitle(2), icon: getTabIcon(2)),
            ],
            indicatorWeight: 1,
          ),
        ),
      ),
    );
  }

  /*切换页面*/
  void _changePage(int index) {
    /*如果点击的导航项不是当前项  切换 */
//    if (index != _tabIndex) {
      setState(() {
        _tabIndex = index;
      });
//    }
  }
}

//子页面
class ChildItemView extends StatefulWidget {
  String _title;

  ChildItemView(this._title);

  @override
  _ChildItemViewState createState() => _ChildItemViewState();
}

class _ChildItemViewState extends State<ChildItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text(widget._title)),
    );
  }
}