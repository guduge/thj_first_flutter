import 'dart:convert';
import 'package:thj_first_flutter/common/LocalStorage.dart';
import 'package:thj_first_flutter/model/UserInfo.dart';
import 'package:thj_first_flutter/utils/HttpRequest.dart';
import 'package:thj_first_flutter/Constants/Constants.dart';

class UserUtil {
  static bool isLogin = false;

  static Future login(userName, password) async {
    Map requestParams = {
      "UserName": userName,
      "MachineCode": "",
      "Version": "2.1.2",
      "UserKey": "",
      "Simulator":"PhoneBrand",
      "Password":password
    };
    var res = await HttpReuest.postRequest("http://uat1appjk.niceloo.com/api/Login/Login", requestParams);
    Map resMap = json.decode(res);
    Map dataMap = resMap["Data"];
    if (dataMap != null) {
      UserInfo userInfo = UserInfo.fromJson(dataMap);
      await LocalStorage.save(Constants.USER_INFO, json.encode(userInfo.toJson()));
    }
    return res;
  }
  static Future getUserInfoLocal() async {

    var userText = await LocalStorage.get(Constants.USER_INFO);
    if (userText != null) {
      var userMap = json.decode(userText);
      UserInfo userInfo = UserInfo.fromJson(userMap);
      return userInfo;
    } else {
      return null;
    }
  }
  static checkLogin() async{
    UserInfo userInfo = await UserUtil.getUserInfoLocal();
    print("userInfo-------");
    print(userInfo);
    if(userInfo !=null){
      UserUtil.isLogin = userInfo.Phone.length>0;
      return userInfo.Phone.length>0;
    }else{
      UserUtil.isLogin = false;
      return false;
    }
  }

  ///初始化用户信息
}
