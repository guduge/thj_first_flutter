import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// MyApp is a StatefulWidget. This allows us to update the state of the
// Widget whenever an item is removed.
class SlideDelete extends StatefulWidget {
  SlideDelete({Key key}) : super(key: key);

  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<SlideDelete> {
  final items = List<String>.generate(10, (i) => "Item ${i + 1}");
  final snackBar = new SnackBar(
    content: new Text('删除信息'),
    action: new SnackBarAction(
        label: '撤消',
        onPressed: () {
          // do something to undo
        }
    ),
  );
  @override
  Widget build(BuildContext context) {
    final title = 'Dismissing Items';

    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];

            return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify Widgets.
              key: Key(item),
              // We also need to provide a function that tells our app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from our data source.
                setState(() {
                  items.removeAt(index);
                });
                // Then show a snackbar!
                Scaffold.of(context)
                    .showSnackBar(snackBar);
              },
              // Show a red background as the item is swiped away
              background: Container(color: Colors.red),
              child: ListTile(title: Text('$item')),
            );
          },
        ),
      ),
    );
  }
}
