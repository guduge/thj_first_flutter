
/**
 * author : tianhj
 * date : 2020/7/16 14:25
 * description ： https://juejin.im/post/5f03af946fb9a07eb1523add
 */

import 'package:flutter/material.dart';

import 'PushAnimateTestPage.dart';

class AnimationBaseDemo extends StatefulWidget {
  @override
  _AnimationBaseDemoState createState() => _AnimationBaseDemoState();
}
const Icon _likeIcon = Icon(
  IconData(0xe667, fontFamily: 'appIconFonts'),
  color: Color(0xFF1afa29),
);
class _AnimationBaseDemoState extends State<AnimationBaseDemo> with SingleTickerProviderStateMixin {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print("AnimationBaseDemo-----build------");
    return Scaffold(
      appBar: AppBar(
        title: Text('studyOne'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          AnimateOne(),
          AnimateTwo(),
          CurveDemo(),
          MultiControllerDemo(),
          IconButton(
            padding: EdgeInsets.all(0),
            icon: Icon(
              IconData(0xe667, fontFamily: 'appIconFonts'),
              color: Color(0xFF1afa29),
            ),
            onPressed: () {
            },
          )
        ],
      )
    );
  }
  @override
  void dispose() {
    super.dispose();
  }

}

class AnimateOne extends StatefulWidget {
  @override
  _AnimateOneState createState() => _AnimateOneState();
}

class _AnimateOneState extends State<AnimateOne>  with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double _size = 100;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 500),lowerBound: 100,upperBound: 250)
      ..addStatusListener((status) {
        print('status:$status');
      })
      ..addListener(() {
        print(_controller.value);
        setState(() {
//          _size = 100 + 100*_controller.value;
          _size = _controller.value;
        });
      });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: (){
            _controller.forward();
          },
          child: Container(
            height: _size,
            width: _size,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text('点我变大',style: TextStyle(color: Colors.white,fontSize: 18),),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    print('dispose');
  }
}

class AnimateTwo extends StatefulWidget {

  @override
  _AnimateTwoState createState() => _AnimateTwoState();
}

class _AnimateTwoState extends State<AnimateTwo> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation<Color> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 500))
      ..addStatusListener((status) {
        print('status:$status');
      })
      ..addListener(() {
        print(_controller.value);
        setState(() {
        });
      });
//    _animation =
//        ColorTween(begin: Colors.blue, end: Colors.red).animate(_controller);
    _animation = _controller.drive(ColorTween(begin: Colors.blue, end: Colors.red));
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: (){
          _controller.forward();
        },
        child: Container(
          height: 100,
          width: 100,
          color: _animation.value,
          alignment: Alignment.center,
          child: Text('点我变颜色',style: TextStyle(color: Colors.white,fontSize: 18),),
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    print('dispose');
  }
}
class CurveDemo extends StatefulWidget {
  @override
  _CurveDemoState createState() => _CurveDemoState();
}

class _CurveDemoState extends State<CurveDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
      ..addListener(() {
        setState(() {});
      });

//    _animation = Tween(begin: 100.0, end: 200.0)
//        .chain(CurveTween(curve: Curves.elasticIn))
//        .animate(_controller);
    _animation = Tween(begin: 100.0, end: 200.0)
        .chain(CurveTween(curve: _StairsCurve(5)))
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            _controller.forward();
            if (_controller.status == AnimationStatus.completed){
              _controller.reverse();
            }
          },
          child: Container(
            height: _animation.value,
            width: _animation.value,
            color: Colors.blue,
            alignment: Alignment.center,
            child: Text(
              '点我变大',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class _StairsCurve extends Curve {
  //阶梯的数量
  final int num;
  double _perStairY;
  double _perStairX;

  _StairsCurve(this.num) {
    _perStairY = 1.0 / (num - 1);
    _perStairX = 1.0 / num;
  }

  @override
  double transformInternal(double t) {
    return _perStairY * (t / _perStairX).floor();
  }
}


class MultiControllerDemo extends StatefulWidget {
  @override
  _MultiControllerDemoState createState() => _MultiControllerDemoState();
}

class _MultiControllerDemoState extends State<MultiControllerDemo>
    with TickerProviderStateMixin {
  AnimationController _sizeController;
  AnimationController _colorController;
  Animation<double> _sizeAnimation;
  Animation<Color> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _sizeController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 2000))
      ..addListener(() {
        setState(() {});
      });

    _sizeAnimation = _sizeController
        .drive(CurveTween(curve: Curves.linear))
        .drive(Tween(begin: 100.0, end: 200.0));

    _colorController =
    AnimationController(vsync: this, duration: Duration(milliseconds: 1000))
      ..addListener(() {
        setState(() {});
      });

    _colorAnimation = _colorController
        .drive(CurveTween(curve: Curves.bounceIn))
        .drive(ColorTween(begin: Colors.blue, end: Colors.red));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          _sizeController.forward();
          _colorController.forward();
          if (_sizeController.status == AnimationStatus.completed){
            _sizeController.reverse();
          }
          if (_colorController.status == AnimationStatus.completed){
            _colorController.reverse();
          }
        },
        child: Container(
          height: _sizeAnimation.value,
          width: _sizeAnimation.value,
          color: _colorAnimation.value,
          alignment: Alignment.center,
          child: Text(
            '多个animateCon点我变化',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _sizeController.dispose();
    _colorController.dispose();
  }
}

