import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:thj_first_flutter/model/UserInfo.dart';
import 'package:thj_first_flutter/utils/UserUtil.dart';
import 'package:toast/toast.dart';
import 'package:thj_first_flutter/Constants/Constants.dart';
import 'package:thj_first_flutter/utils/DataUtil.dart';
import 'package:flutter/cupertino.dart';
import '../../../events/LoginEvent.dart';
class LoginPage extends StatefulWidget{


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginStatePage();
  }

}
class LoginStatePage extends State<LoginPage>{

  void loginrequest(context) async{

    UserUtil.login("18301379671", "123456").then((res)=>{

        Toast.show("sssss", context,gravity:Toast.CENTER ),
        UserUtil.isLogin = true,
        Navigator.pop(context),

    });

  }
  _loginAction(context){
    loginrequest(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  createLoginPage(context);
  }
  Widget createLoginPage(BuildContext context){
    return new Scaffold(

      appBar: new AppBar(
        elevation: 0.5,
        title: Text(""),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
      new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Container(
        width: 290,
        height: 40,
        margin: new EdgeInsets.only(top: 10),
        child: FlatButton(
            onPressed: ()=>{
            _loginAction(context)
        },
        color: Color(0xFFFFECE8),
        child: Text("登录"),
        textColor: Color(0xFFFF4040),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
      ),
    )
    ],
    ),
    ],
    )

    );

  }

}