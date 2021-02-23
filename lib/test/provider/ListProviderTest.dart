import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mode/ListModel.dart';
import 'mode/CounterModel.dart';
class ListProviderTest extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListProviderState();
  }

}
class ListProviderState extends State<ListProviderTest>{
  ListModel listModel = new ListModel();
//  CounterProvider counterModel ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState');

//    final listModel = Provider.of<ListModel>(context);
    listModel.requestArrList().then((res)=>{
      done()
    });
  }
  done(){
    if(mounted){
      listModel.notifyListeners();
    }

  }
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();
    print('didChangeDependencies');
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();


  }
  @override
  Widget build(BuildContext context) {
    print('build');
    // TODO: implement build
    return  MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (_) => listModel ,),
        ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("ttttttt"),
        ),
        body: Consumer<ListModel>(
            builder:(context,model,_){
              return  ListView.builder(
                  itemCount: model.arr.length,
                  itemBuilder:(BuildContext context, int index){
                    return Card(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: InkWell(child: Center(child: Text(model.arr[index]),)  ,onTap: ()=> Provider.of<CounterModel>(context).increment(),),
                      ),
                    );
                  }
              );
            }
        )
        ),
    );
  }

}