import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'CounterModel.dart';
import 'ThemeModel.dart';

/**
 * author : tianhj
 * date : 2020/7/8 11:29
 * description ： TODO:类的作用
 */
List<SingleChildWidget> providers = [
  ...independentProviders
];

List<SingleChildWidget> independentProviders = [
  ChangeNotifierProvider<CounterModel>(create: (context) => CounterModel()),
  ChangeNotifierProvider<ThemeModel>(create: (context) => ThemeModel(),)
];