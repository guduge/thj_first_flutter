import 'mode/CounterModel.dart';

import 'package:provider/provider.dart'; //状态共享框架google 推荐
import 'package:flutter/material.dart';

export 'ExampleLocalizations.dart';
export 'mode/CounterModel.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("MyHomePage--build-------");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Count()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        /// Calls `context.read` instead of `context.watch` so that it does not rebuild
        /// when [Counter] changes.
        onPressed: () => context.read<CounterModel>().increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
class Count extends StatelessWidget {
  const Count({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Count----build-------");
    return Consumer<CounterModel>(builder: (context, counterModel, child) {
      return Text(

        /// Calls `context.watch` to make [MyHomePage] rebuild when [Counter] changes.
          '${counterModel.count}',
          style: Theme.of(context).textTheme.headline4);
    });
  }
}
class MyHomePage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomePageState();
  }

}
class MyHomePageState extends State<MyHomePage2>  {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("MyHomePageState----build-------");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Count()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        /// Calls `context.read` instead of `context.watch` so that it does not rebuild
        /// when [Counter] changes.
        onPressed: () => context.read<CounterModel>().increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void initState() {
    print("MyHomePageState---initState----");
  }

}