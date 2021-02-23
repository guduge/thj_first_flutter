import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widget/webview.dart';
class MyWebviewTest extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyWebviewState();
  }

}
class MyWebviewState extends State<MyWebviewTest>{
   WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("MyWebview"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 60,
              child: Card(

                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        margin: EdgeInsets.all(10),
                        color: Colors.green,
                        child: InkWell(
                          child: Text("back"),
                          onTap: ()=>{
                            goBack()
                          },
                        ),
                      ),
                      Card(
                        color: Colors.green,
                        child:InkWell(
                        child: Text("forword"),
                        onTap: ()=>{
                          forward()
                        },
                      ),)


                    ],
                  ),
                )
              ),
            ),
            Expanded(

                 child: WebView(initialUrl: "https://wwww.baidu.com",onWebViewCreated: (WebViewController webViewController)=>{
                   _webViewController = webViewController,
                   _webViewController.channel.setMethodCallHandler(_onMethodCall)
                 },
                 ),
            )

          ],
        ),
      ),
    );
  }
  goBack() async {
    print("---------back");
    _webViewController.back().then((res)=>{
      print(res)
    });
  }
   forward() async {
     print("---------back");
     _webViewController.forward();
   }

  Future _onMethodCall(MethodCall call) async {
    print(call.method);
    print(call.arguments);
    throw MissingPluginException(
        '${call.method} was invoked but has no handler');
  }


}