import 'package:flutter/material.dart';
class SettingItemWidget extends StatelessWidget {

  final String name;
  final String content;
  final Function onTap;

  const SettingItemWidget({
    Key key,
    this.name,
    this.content,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 44,
      padding: new EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border(bottom: new BorderSide(
            color :const Color(0xFFe2e2e2),
            width : 0.5,
            style :BorderStyle.solid,
        )),
      ),
      child: Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            this.name,
            style: new TextStyle(

          ),
          ),
          new GestureDetector(
            onTap: this.onTap,
            child:Row(
              children: <Widget>[
                Text(this.content,style: TextStyle(color: Color(0xff666666)),),
                new Icon(Icons.chevron_right,color: Color(0xff666666),)
              ],
            ) ,
          )

        ],
      )
    ) ;
  }

}