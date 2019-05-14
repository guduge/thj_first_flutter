import 'package:flutter/material.dart';
import '../home/HomePage.dart';
import '../discover/DiscoverPage.dart';
import '../me/MePage.dart';
class BottomNavigationWidget extends  StatefulWidget{


  @override
//  _BottomNavigationWidgetState  createState => _BottomNavigationWidgetState();

  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  _BottomNavigationWidgetState();
  }

}
class _BottomNavigationWidgetState extends State<BottomNavigationWidget>{
  final _BottomNavigationColor = Colors.blue;

  int _currentIndex = 0;
  List<Widget> list = List();
  @override
  void initState(){
    list
      ..add(HomePage())
      ..add(DiscoverPage())
      ..add(MePage());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: list[_currentIndex],
        bottomNavigationBar:BottomNavigationBar(
          items:[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color:_BottomNavigationColor,
                ),
                title: Text(
                    '首页',
                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.email,
                  color:_BottomNavigationColor,
                ),
                title: Text(
                    '发现',
                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.pages,
                  color:_BottomNavigationColor,
                ),
                title: Text(
                    '我的',
                    style:TextStyle(color:_BottomNavigationColor)
                )
            ),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (int index){
            setState((){
              _currentIndex= index;
            });
          },
        )
    );
  }

}