/**
 * author : tianhj
 * date : 2020/7/9 14:36
 * description ： TODO:类的作用
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_model.dart';
import 'good_screen.dart';

void good_main() {
  final counter = CounterModel();
  final textSize = 48;

  runApp(
    MultiProvider(providers: [
      Provider<int>(
        create: (_) => textSize,
      ),
      ChangeNotifierProvider<CounterModel>.value(value: counter),
    ], child: GoodsMyApp()),
  );
}

class GoodsMyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
//      home: AnswerStatisticsPage(),
      home: SafeArea(
        bottom: false,
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: TabBar(tabs: [
              Tab(
                text: 'CounterDemo',
                icon: Icon(Icons.create),
              ),
              Tab(
                text: 'SelectorDemo',
                icon: Icon(Icons.shopping_cart),
              ),
              Tab(
                text: 'SelectorUpdateDemo',
                icon: Icon(Icons.sentiment_satisfied),
              ),
            ]),
            body: TabBarView(
              children: [
                FirstScreen(),
                GoodsListScreen(),
                OrderListScreen(),
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}
class AnswerStatisticsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AnswerStatisticsState();
  }

}
class AnswerStatisticsState extends State<AnswerStatisticsPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    print("pageinitState----------");
    _tabController = new TabController(vsync: this, length: 3,);
  }

  @override
  void didChangeDependencies() {
//    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "答疑统计",
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
//            height: 45.0,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(
                        color: Color.fromRGBO(0, 0, 0, 0.1), width: 1))),
            child: TabBar(
              tabs: [
            Tab(
              text: 'CounterDemo',
              icon: Icon(Icons.create),
            ),
            Tab(
              text: 'SelectorDemo',
              icon: Icon(Icons.shopping_cart),
            ),
            Tab(
              text: 'SelectorUpdateDemo',
              icon: Icon(Icons.sentiment_satisfied),
            ),
          ],
              isScrollable: false,
              labelColor: Color(0xFF333333),
              unselectedLabelColor: Color(0xFF999999),
              controller: _tabController,

            ),
          ),
          Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  FirstScreen(),
                  GoodsListScreen(),
                  OrderListScreen()
                ]
              ))
        ],
      ),
    );
  }
}
