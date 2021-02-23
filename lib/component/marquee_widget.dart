import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 上下滚动的消息轮播
class MarqueeWidget extends StatefulWidget {
  // 轮播的高度
  final double height;

  //左边widget
  final Widget leadingWidget;

  // 子视图数量
  final int count;

  /// 子视图构造器
  final IndexedWidgetBuilder itemBuilder;

  /// 滚动方向，水平或者垂直
  final Axis scrollAxis;

  /// 背景颜色
  final Color color;

  MarqueeWidget({
    Key key,
    @required this.leadingWidget,
    @required this.count,
    this.height: 25,
    this.itemBuilder,
    this.scrollAxis: Axis.vertical,
    this.color: Colors.white,
  })  : assert(count != null),
        assert(itemBuilder != null),
        super(key: key);

  @override
  _MarqueeWidgetState createState() => _MarqueeWidgetState();
}

class _MarqueeWidgetState extends State<MarqueeWidget> {
  PageController _controller;
  Timer _timer;

  @override
  void initState() {
    super.initState();

    _controller = PageController();
    _timer = Timer.periodic(Duration(milliseconds: 3000), (timer) {
      // 如果当前位于最后一页，则直接跳转到第一页，两者内容相同，跳转时视觉上无感知
      if (_controller.page.round() >= widget.count) {
        _controller.jumpToPage(0);
      }
      _controller.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      height: widget.height,
      color: widget.color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          widget.leadingWidget != null
              ? Container(
                  margin: EdgeInsets.only(left: 6 , right: 6),
                  child: widget.leadingWidget,
                )
              : Container(),
          Expanded(
            child: PageView.builder(
              scrollDirection: widget.scrollAxis,
              controller: _controller,
              itemBuilder: (buildContext, index) {
                if (index < widget.count) {
                  return widget.itemBuilder(buildContext, index);
                } else {
                  return widget.itemBuilder(buildContext, 0);
                }
              },
              itemCount: widget.count + 1, // 在原数据末尾添加一笔数据(即第一笔数据)，用于实现无限循环滚动效果
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _timer.cancel();
  }
}
