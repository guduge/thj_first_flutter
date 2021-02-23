import 'dart:math';

/**
 * author : tianhj
 * date : 2020/7/16 16:38
 * description ： TODO:类的作用
 */


import 'package:flutter/material.dart';

import 'like_button/juejin_like.dart';

class AnimationPraiseDemo extends StatefulWidget {
  @override
  _AnimationPraiseDemoState createState() => _AnimationPraiseDemoState();
}

const Icon _unLikeIcon = Icon(
  IconData(0xe60a, fontFamily: 'appIconFonts'),
);

///
/// 点赞icon
///
const Icon _likeIcon = Icon(
  IconData(0xe60c, fontFamily: 'appIconFonts'),
  color: Color(0xFF1afa29),
);

class _AnimationPraiseDemoState extends State<AnimationPraiseDemo>  {

  @override
  Widget build(BuildContext context) {
    print("AnimationBaseDemo-----build------");
    return Scaffold(
      appBar: AppBar(
        title: Text('praise'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 100,
              height: 100,
              child: JueJinLike(),

            ),

          ],
        ),
      ),
    );
  }

}

class AminatePraiseWidget extends StatefulWidget {
  @override
  _AminatePraiseWidgetState createState() => _AminatePraiseWidgetState();
}

class _AminatePraiseWidgetState extends State<AminatePraiseWidget> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  Animation _iconAnimation;
  Animation _circleAnimation;
  bool like = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _iconAnimation = Tween(begin: 1.0, end: 1.3).animate(_animationController);

    _iconAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 1.0, end: 1.3)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.3, end: 1.0), weight: 50),
    ]).animate(_animationController);

    _circleAnimation =
        Tween(begin: 1.0, end: 0.0).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: _buildLikeIcon(),
        ),
        _buildCircle(),

      ],
    );
  }
  _buildLikeIcon() {
    return ScaleTransition(
      scale: _iconAnimation,
      child: like
          ? IconButton(
        padding: EdgeInsets.all(0),
        icon: Icon(Icons.touch_app),
        onPressed: () {
          _clickIcon();
        },
      )
          : IconButton(
        padding: EdgeInsets.all(0),
        icon: Icon(Icons.touch_app,color: Colors.red,),
        onPressed: () {
          _clickIcon();
        },

      ),
    );
  }

  _clickIcon() {
    if (_iconAnimation.status == AnimationStatus.forward ||
        _iconAnimation.status == AnimationStatus.reverse) {
      return;
    }
    setState(() {
      like = !like;
    });
    if (_iconAnimation.status == AnimationStatus.dismissed) {
      _animationController.forward();
    } else if (_iconAnimation.status == AnimationStatus.completed) {
      _animationController.reverse();
    }
  }

  _buildCircle() {
    return !like
        ? Container()
        : AnimatedBuilder(
      animation: _circleAnimation,
      builder: (BuildContext context, Widget child) {
        return Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: Color(0xFF5FA0EC)
                      .withOpacity(_circleAnimation.value),
                  width: _circleAnimation.value * 8)),
        );
      },
    );
  }
  _buildCirclePoint(double radius, Color color) {
    return !like
        ? Container()
        : AnimatedBuilder(
      animation: _circleAnimation,
      builder: (BuildContext context, Widget child) {
        return Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withOpacity(_circleAnimation.value)),
        );
      },
    );
  }
  _buildCirclePoints() {
    return Flow(
      delegate: CirclePointFlowDelegate(),
      children: <Widget>[
        _buildCirclePoint(2, Color(0xFF97B1CE)),
        _buildCirclePoint(5, Color(0xFF4AC6B7)),
        _buildCirclePoint(2, Color(0xFF97B1CE)),
        _buildCirclePoint(5, Color(0xFF4AC6B7)),
        _buildCirclePoint(2, Color(0xFF97B1CE)),
        _buildCirclePoint(5, Color(0xFF4AC6B7)),
        _buildCirclePoint(2, Color(0xFF97B1CE)),
        _buildCirclePoint(5, Color(0xFF4AC6B7)),
        _buildCirclePoint(2, Color(0xFF97B1CE)),
        _buildCirclePoint(5, Color(0xFF4AC6B7)),
        _buildCirclePoint(2, Color(0xFF97B1CE)),
        _buildCirclePoint(5, Color(0xFF4AC6B7)),
        _buildCirclePoint(2, Color(0xFF97B1CE)),
        _buildCirclePoint(5, Color(0xFF4AC6B7)),
        _buildCirclePoint(2, Color(0xFF97B1CE)),
        _buildCirclePoint(5, Color(0xFF4AC6B7)),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
class CirclePointFlowDelegate extends FlowDelegate {
  CirclePointFlowDelegate();

  @override
  void paintChildren(FlowPaintingContext context) {
    var radius = min(context.size.width, context.size.height) / 2.0;
    //中心点
    double rx = radius;
    double ry = radius;
    for (int i = 0; i < context.childCount; i++) {
      if (i % 2 == 0) {
        double x =
            rx + (radius - 5) * cos(i * 2 * pi / (context.childCount - 1));
        double y =
            ry + (radius - 5) * sin(i * 2 * pi / (context.childCount - 1));
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
      } else {
        double x = rx +
            (radius - 5) *
                cos((i - 1) * 2 * pi / (context.childCount - 1) +
                    2 * pi / ((context.childCount - 1) * 3));
        double y = ry +
            (radius - 5) *
                sin((i - 1) * 2 * pi / (context.childCount - 1) +
                    2 * pi / ((context.childCount - 1) * 3));
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) => true;
}
