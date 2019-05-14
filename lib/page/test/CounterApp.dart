

import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:thj_first_flutter/page/test/mode/Counter.dart';
import 'CounterAppB.dart';
class CounterApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CounterAppState();
  }

}
class CounterAppState extends State<CounterApp> {

  // The widgets here get the value of Counter in three different
  // ways.
  //
  // - Provide<Counter> creates a widget that rebuilds on change
  // - Provide.value<Counter> obtains the value directly
  // - Provide.stream<Counter> returns a stream
  @override
  Widget build(BuildContext context) {
    // Gets the Counter from the nearest ProviderNode that contains a Counter.
    // This does not cause this widget to rebuild when the counter changes.
    final currentCounter = Provide.value<Counter>(context);
    return  Scaffold(
        appBar: AppBar(
          title: Text("provide"),
        ),
        body: Column(children: [
          // Simplest way to retrieve the provided value.
          //
          // Each time the counter changes, this will get rebuilt. This widget
          // requires the value to be a Listenable or a Stream. Otherwise
        Provide<Counter>(
          builder: (context, child, counter) => Text('${counter.value}'),
        ),

        // This widget gets the counter as a stream of changes.
        // The stream is filtered so that this only rebuilds on even numbers.
        StreamBuilder<Counter>(
            initialData: currentCounter,
            stream: Provide.stream<Counter>(context)
                .where((counter) => counter.value % 2 == 0),
            builder: (context, snapshot) =>
                Text('Last even value: ${snapshot.data.value}')),

        // This button just needs to call a method on Counter. No need to rebuild
        // it as the value of Counter changes. Therefore, we can use the value of
        // `Provide.value<Counter>` from above.
        FlatButton(child: Text('increment'), onPressed: currentCounter.increment),

        FlatButton(child: Text('click to  page B '), onPressed: ()=> toB(context)),
        ]),
    );
  }
  toB(context){
    Navigator.push( context,
        new MaterialPageRoute(builder: (context) {
          return CounterAppB();
        }));
  }
}
