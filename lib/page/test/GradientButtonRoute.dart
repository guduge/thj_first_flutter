import 'package:flutter/material.dart';
import '../../component/GradientButton.dart';
class GradientButtonRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    onTap() {
      print("button click");
    };

    return new Scaffold(

        appBar: new AppBar(
          backgroundColor: Colors.white,
          title: new Text(
            '自定义button',
            style: new TextStyle(color: Color(0xFF333333)),
          ),
        ),
        body: new Container(
          child: Column(
            children: <Widget>[
              GradientButton(
                colors: [Colors.orange, Colors.red],
                height: 50.0,
                child: Text("Submit"),
                onTap: onTap,
              ),
              GradientButton(
                height: 50.0,
                colors: [Colors.lightGreen, Colors.green[700]],
                child: Text("Submit"),
                onTap: onTap,
              ),
              GradientButton(
                height: 50.0,
                colors: [Colors.lightBlue[300], Colors.blueAccent],
                child: Text("Submit"),
                onTap: onTap,
              ),
            ],
          ),
        ));
  }
}
