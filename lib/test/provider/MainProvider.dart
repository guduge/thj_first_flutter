import 'package:flutter/material.dart';
import 'MyHomePage.dart';
import 'package:provider/provider.dart';

import 'mode/provider_manager.dart';
import 'mode/ThemeModel.dart';
import 'mode/CounterModel.dart';
//状态共享框架google 推荐
class MainProvoder extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
  print("MainProvoder-----build-----");
//    var counter = Provider.of<CounterProvider>(context);

    // TODO: implement build
    return MultiProvider(
        providers: providers,
        child:  MaterialApp(
        home: MyHomePage2(),
      )
    );
  }
}
//Consumer2<CounterProvider,DataInfo>(
//        builder: (context, counter,dataInfo, _) {
//          return MaterialApp(
//            supportedLocales: const [Locale('en')],
//            localizationsDelegates: [
//              DefaultMaterialLocalizations.delegate,
//              DefaultWidgetsLocalizations.delegate,
//              ExampleLocalizationsDelegate(counter.count),
//            ],
//            home: const MyHomePage(),
//            theme: dataInfo.themeData,
//          );
//        },
//      ),