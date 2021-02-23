import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:thj_first_flutter/test/scoped_model/CounterModel.dart';
import 'CounterHome.dart';
class ScopedModelPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

//    return ScopedModel<CounterModel>(
//      model: CounterModel(),
//      child: MaterialApp(
//        title: 'Scoped Model Demo',
//        home: CounterHome('Scoped Model Demo'),
//      ),
//    );
    return Scaffold(
        appBar: AppBar(title: Text("ScopedModel")
        ),
        body: Center(
          child: Text("xxxxxx"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>{
          Navigator.push( context,
          new MaterialPageRoute(builder: (context) {
          return CounterHome("CounterModel");
          }))
          },
          child: Text("to CounterModel"),
        ),
      );
  }
}
