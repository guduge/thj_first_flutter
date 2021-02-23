import 'package:flutter/material.dart';
class HomeComponent extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeComponentState();
  }


}
class HomeComponentState extends State<HomeComponent>{
  @override
  Widget build(BuildContext context) {
    print("HomeComponentState----build");
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Text("HomeComponent"),
      ),
      body: Center(
        child: InkWell(child: Text("HomeComponent"),onTap: ()=>{
        },)

      ),
    );
  }

}