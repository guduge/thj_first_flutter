import 'package:flutter/material.dart';

class ButtonAnimateDemo extends StatefulWidget {
  @override
  _ButtonAnimateDemoState createState() => _ButtonAnimateDemoState();
}

class _ButtonAnimateDemoState extends State<ButtonAnimateDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonAnimateDemo"),
      ),
      body: SafeArea(
        child: new Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.grey,
                Colors.white,

              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Flexible(
                  child: GridView.count(
                    //垂直子Widget之间间距
                    mainAxisSpacing: 10.0,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    //子Widget宽高比例
//              childAspectRatio: 1.5,
                    children: <Widget>[
                      MyInkWell(),
                      MyIconButton(),
                      MyRaisedButton(),
//                      MyOutlineButton(),
                      MyCustonFlutBtn(),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: MyOutlineButton(),
                ),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: RaisedButton(
                    color: Colors.yellow,
                    highlightColor: Colors.blue[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.redAccent,
                    child: Text("Submit"),
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () => {},
                  ),
                ),
                SizedBox(height: 180,),
              ],
            ),
          ),
        )
      )
    );
  }

  Widget MyInkWell() {
    return Material(
      color: Colors.green[300],
      child: InkWell(
        focusColor: Colors.lightGreenAccent,
        highlightColor: Colors.indigoAccent,
        hoverColor: Colors.deepOrange,
        splashColor: Colors.red,
        onTap: () {

        },
        child: Container(
//        margin: EdgeInsets.fromLTRB(10.0, 4.0, 10.0, 4.0),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Center(
              child: Text(
                "MyInkWell",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.subhead,
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget MyRaisedButton(){
    return RaisedButton(
      color: Colors.white,
      splashColor: Colors.redAccent,
      child: Text("RaisedButton"),
      onPressed: () => {},
    );
  }
  Widget MyFlatButton(){
    return FlatButton(
      child: Text("FlatButton"),
      onPressed: () => {},
      splashColor: Colors.redAccent,
    );
  }
  Widget MyIconButton(){
    return Material(
      child: IconButton(
        icon: Icon(Icons.thumb_up),
        tooltip: "good",
        iconSize: 50,
        hoverColor: Colors.pink,
        color: Colors.blue,
        highlightColor: Colors.redAccent,
        splashColor: Colors.yellow,
        focusColor: Colors.grey,
        onPressed: () => {},
      ),
    );
  }
  Widget MyOutlineButton(){
    return OutlineButton(
      child: Text("Outline"),
      highlightElevation:5,
      disabledBorderColor: Colors.lightBlueAccent,
      color: Colors.blue,
      focusColor: Colors.white ,
      hoverColor: Colors.white,
      splashColor: Colors.redAccent,
      highlightedBorderColor: Colors.red[800],
      onPressed: () => {},
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
    );
  }
  Widget MyCustonFlutBtn(){
    return RaisedButton(
      color: Colors.blueAccent[100],
      highlightColor: Colors.blue[900],
      colorBrightness: Brightness.dark,
      splashColor: Colors.redAccent,
      child: Text("Submit"),
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      onPressed: () => {},
    );
  }

}
