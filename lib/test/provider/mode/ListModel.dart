import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class ListModel with ChangeNotifier{
  List arr = [];
  bool isDis = false;
//  get arr => _arr;
  Future requestArrList() async {

    await Future.delayed(Duration(seconds: 3),()=>{
      arr = ["11","3rgr","23r43r3r","xrgewge"],
    });
    return arr;


  }
  done(){

    print("xxxx");
    arr = ["11","3rgr","23r43r3r","xrgewge"];
    if(isDis){

    }else{
      notifyListeners();
    }

  }
  @override
  void dispose() {
    // TODO: implement dispose
    isDis = true;
//    removeListener(()=>{});
    super.dispose();
  }



}