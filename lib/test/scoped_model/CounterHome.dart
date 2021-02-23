import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'CounterModel.dart';
class CounterHome extends StatelessWidget {
  final String title;

  CounterHome(this.title);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CounterModel>(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You have pushed the button this many times:'),
              // Create a ScopedModelDescendant. This widget will get the
              // CounterModel from the nearest parent ScopedModel<CounterModel>.
              // It will hand that CounterModel to our builder method, and
              // rebuild any time the CounterModel changes (i.e. after we
              // `notifyListeners` in the Model).
              ScopedModelDescendant<CounterModel>(
                builder: (context, child, model) {
                  return Text(
                    model.counter.toString(),
                    style: Theme.of(context).textTheme.display1,
                  );
                },
              ),
            ],
          ),
        ),
        // Use the ScopedModelDescendant again in order to use the increment
        // method from the CounterModel
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          builder: (context, child, model) {
            return FloatingActionButton(
              onPressed: model.increment,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}