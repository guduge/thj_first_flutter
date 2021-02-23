import 'package:flutter/material.dart';
import 'UnderPage.dart';
import 'package:thj_first_flutter/test/bloC/BlocProvider.dart';
class CountBloCPage extends StatefulWidget {
  @override
  _CountBloCPageState createState() => _CountBloCPageState();
}

class _CountBloCPageState extends State<CountBloCPage> {
//  final bloc = BlocProvider.of(context);


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Navigator.pop(context);

  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("xxxx"),
      ),
      body: Center(
      child: StreamBuilder<int>(
          stream: bloc.stream,
          initialData: bloc.value,
    builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
    return Text(
    'You hit me: ${snapshot.data} times',
    style: Theme.of(context).textTheme.display1,
    );
    }),
    ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.navigate_next),
          onPressed: ()=>{
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => UnderPage()))
      }),
    );
  }
}
