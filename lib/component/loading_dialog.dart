
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog extends Dialog {

  final String text;
  final Function dismiss;
  LoadingDialog({Key key, this.text,this.dismiss}) : super(key: key);

  @override
  Color get backgroundColor => Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return new Material( //创建透明层
      color: Colors.transparent,
      child: new Center( //保证控件居中效果
        child: new SizedBox(
          width: 100.0,
          height: 100.0,
          child: new Container(
            decoration: ShapeDecoration(
              color: Colors.black54,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            ),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new SpinKitCircle(
                  color: Colors.white,
                  size: 40,
                ),
                new Padding(
                  padding: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: new Text(
                    text == null || ''== text ? "加载中..." : text,
                    style: new TextStyle(fontSize: 12.0,color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



