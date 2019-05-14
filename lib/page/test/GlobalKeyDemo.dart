import 'package:flutter/material.dart';

class GlobalKeyDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GlobalKeyDemoState();
  }

}
class GlobalKeyDemoState extends State<GlobalKeyDemo>{

  final GlobalKey<SwitcherScreenState> switcher = GlobalKey<SwitcherScreenState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Global Key"),
      ),
      body: Column(
        children: <Widget>[
          SwitcherScreen(
            key: switcher,
          ),
          GloabelKeyTest(

          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        switcher.currentState.changeState();
      }),
    );
  }

}

class SwitcherScreen extends StatefulWidget{

  const SwitcherScreen({Key key, this.unip}):super(key : key);
  final String unip;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SwitcherScreenState();
  }

}
class SwitcherScreenState extends State<SwitcherScreen> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Switch.adaptive(
            value: isActive,
            onChanged: (bool currentStatus) {
              isActive = currentStatus;
              setState(() {});
            }),
    );
  }

  changeState() {
    isActive = !isActive;
    print("xxxxxxx");

    setState(() {

    });
  }
}

class  GloabelKeyTest extends StatelessWidget {
  const GloabelKeyTest({Key key,}):super(key : key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Text("xxxxxxxxxxx"),
    );
  }

  test(){
    print("点击我");
  }

}