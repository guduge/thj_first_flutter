import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// ignore: must_be_immutable
class NetLoadingDialog extends StatefulWidget {
  String loadingText;
  bool outsideDismiss;


  NetLoadingDialog(
      {Key key,
      this.loadingText = "正在加载中...",
      this.outsideDismiss = true,})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoadingDialog();
  }
}

class LoadingDialog extends State<NetLoadingDialog> {

  dismissDis() {
    Navigator.of(context).pop();
    print("xxxxx");
  }

  @override
  void initState() {

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return   Material(
        type: MaterialType.transparency,
        child: new Center(
          child: new SizedBox(
            width: 120.0,
            height: 120.0,
            child: new Container(
              decoration: ShapeDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              child: new Column(
                //CircularProgressIndicator
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new CupertinoActivityIndicator(radius: 15,),
                  new Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: new Text(
                      widget.loadingText,
                      style: new TextStyle(fontSize: 13.0,color: Colors.white),
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
