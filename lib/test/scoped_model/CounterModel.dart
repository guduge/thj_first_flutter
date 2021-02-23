import 'package:scoped_model/scoped_model.dart';
class CounterModel extends Model {
  int _counter = 0;

  int get counter => _counter;

  void increment() async{
    // First, increment the counter
    _counter++;
    Future.delayed(Duration(seconds: 3),()=>{

      notifyListeners()
    });
    // Then notify all the listeners.

  }
}