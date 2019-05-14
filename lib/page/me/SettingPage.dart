import 'package:flutter/material.dart';
import 'component/SettingItemWidget.dart';
import 'ChangeThemePageState.dart';
class SettingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _buildWidget(context) ;
  }
  itemOnTap(context,route){
    Navigator.push( context,
        new MaterialPageRoute(builder: (context) {
          return route;
        }));
  }
  Widget  _buildWidget(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("设置"),
         ),
         body: ListView(
           children: <Widget>[
             new SettingItemWidget( name:"帮助中心", content:"常见问题"),
             new SettingItemWidget( name:"清楚缓存", content:"3.44M"),
             new Container(
               height: 10,
               decoration: new BoxDecoration(
                 color: Color(0xfff5f5f5),
               ),

             ),
             new SettingItemWidget( name:"APP版本", content:"当前版本2.1.3"),
             new SettingItemWidget( name:"分享应用", content:"将APP分享给他人"),
             new SettingItemWidget( name:"权限管理", content:"APP运行需要一些权限"),
             new SettingItemWidget( name:"设备管理", content:"修改密码，查看绑定设备"),
             new SettingItemWidget( name:"关于我们", content:"优路教育公司介绍"),
             new SettingItemWidget( name:"切换主题", content:"选择你喜欢的主题",onTap: ()=>{
               itemOnTap(context,new ChangeThemePage())
             },),
           ],
         ),
    );
  }

}