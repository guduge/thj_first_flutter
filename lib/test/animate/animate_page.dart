/**
 * author : tianhj
 * date : 2020/7/16 14:11
 * description ： TODO:类的作用
 */
import 'package:flutter/material.dart';

import 'AnimateTest.dart';
import 'animate_praise.dart';
import 'aninate_study_one.dart';
import 'like_button/like_button_page.dart';

class AnimatePageTest extends StatefulWidget {
  @override
  _AnimatePageTestState createState() => _AnimatePageTestState();
}

class _AnimatePageTestState extends State<AnimatePageTest>{

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
  _onPress(title, patch) {
    Navigator.push(context, new MaterialPageRoute(builder: (context) {
      return patch;
    }));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                  Colors.yellow,
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

                  getFlatButton("ScaleAnimation",new ScaleAnimationRoute()),
                  getFlatButton("study_one",new AnimationBaseDemo()),
                  getFlatButton("AnimationPraiseDemo",new AnimationPraiseDemo()),
                  getFlatButton("LikeButtonPage",new LikeButtonPage()),

                ],
              ),
            ),
          ),
        ));
  }

}