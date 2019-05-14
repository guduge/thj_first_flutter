import 'package:flutter/material.dart';
import 'package:thj_first_flutter/utils/ThemeUtil.dart';
import '../home/HomePage.dart';
import '../discover/DiscoverPage.dart';
import '../me/MePage.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/DataUtil.dart';
import '../../Constants/Constants.dart';
import '../../events/ChangeThemeEvent.dart';
import '../discover/DiscoverSliverPage.dart';
class MainPageWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => new MainPageState();

}

class MainPageState extends State<MainPageWidget>{


  Color themeColor = ThemeUtils.currentColorTheme;
  int _tabIndex = 0;
  var tabImages;
  var appBarTitles = ['首页', '发现', '我的'];
  /*
   * 存放三个页面，跟fragmentList一样
   */
  var _pageList;
  /*
   * 根据选择获得对应的normal或是press的icon
   */
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
  /*
     * 根据image路径获取图片
     */

  Image getTabImage(path) {
    return new Image.asset(path, width: 22.0, height: 22.0);
  }
  @override
  void initState() {
    super.initState();
    DataUtils.getColorThemeIndex().then((index) {
      print('color theme index = $index');
      if (index != null) {
        ThemeUtils.currentColorTheme = ThemeUtils.supportColors[index];
        Constants.eventBus.fire(new ChangeThemeEvent(ThemeUtils.supportColors[index]));
      }
    });
    Constants.eventBus.on<ChangeThemeEvent>().listen((event) {
      ThemeUtils.currentColorTheme = event.color;
      setState(() {
        themeColor = event.color;
      });
    });

    /*
     * 初始化选中和未选中的icon
     */
    tabImages = [
      [getTabImage('images/tabbar/home.png'), getTabImage('images/tabbar/home_select.png')],
      [getTabImage('images/tabbar/discover.png'), getTabImage('images/tabbar/discover_select.png')],
      [getTabImage('images/tabbar/me.png'), getTabImage('images/tabbar/me_select.png')]
    ];
    /*
     * 三个子界面
     */
    _pageList = [
      new HomePage(),
      new DiscoverSliverPage(),
      new MePage(),
    ];
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      theme: new ThemeData(
          primaryColor: themeColor
      ),
      home: new Scaffold(
          body: _pageList[_tabIndex],
          bottomNavigationBar: new CupertinoTabBar(
            items: <BottomNavigationBarItem>[
              new BottomNavigationBarItem(
                  icon: getTabIcon(0),
                  title: getTabTitle(0)),
              new BottomNavigationBarItem(
                  icon: getTabIcon(1),
                  title: getTabTitle(1)),
              new BottomNavigationBarItem(
                  icon: getTabIcon(2),
                  title: getTabTitle(2)),
            ],
            currentIndex: _tabIndex,
            onTap: (index) {
              setState((){
                _tabIndex = index;
              });
            },
          ),
      ),
    );
  }

}