/**
 * author : tianhj
 * date : 2019-11-21 18:43
 * description ： TODO:类的作用
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thj_first_flutter/widget/VodVideoWidget.dart';

class PolvTestPage extends StatefulWidget {
  @override
  _PolvTestPageState createState() => _PolvTestPageState();
}

class _PolvTestPageState extends State<PolvTestPage> {
  VodPlayerController polvController;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onWillPop() {
    polvController.stop();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          title: Text("发现"),
        ),
        body: Stack(

          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width:  MediaQuery.of(context).size.width,
              child:Column(
                children: <Widget>[
                  Container(
                    height: 200,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Center(
                      child: Text("这是flutter的widget"),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              height: 200,
              top: 0,
              left: 0,
              child: getFull(),
            )

          ],
        )
      ),
    );
  }
  Widget getFull(){
    return VodVideoWidget(
      x: 0,
      y: 0,
      height: 200,
      width: MediaQuery.of(context).size.width,
      callback: (VodPlayerController controller) {
        polvController = controller;
        controller.play("");
      },
    );
  }
  Widget getnotFull(){
    return Column(
      children: <Widget>[

        SafeArea(
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: VodVideoWidget(
              x: 0,
              y: 0,
              height: 200,
              width: MediaQuery.of(context).size.width,
              callback: (VodPlayerController controller) {
                polvController = controller;
                controller.play("");
              },
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: Center(
            child: Text("这是flutter的widget"),
          ),
        )
      ],
    );
  }
}
