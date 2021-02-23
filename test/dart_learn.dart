
import 'dart:async';
void main(){
//  testFuture();
//  testScheduleMicrotatsk();
//  testCompleter();
//  testAwait2();
//  testCall();
  testMakeAdder();
}


testAwait2(){
  print("11111111");
  testAwait3();
}
testCall() {
  var wf = new WannabeFunction();
  var out = wf("Hi","there,","gang");
  print(out.runtimeType);
}
testAwait3() async {
  print("22222222");
  await Future.delayed(Duration(seconds: 1),()=>{
    print("333333")
  });
  print("4444444");

}
void testAwait() async{
  print("11111");
  await Future.delayed(Duration(seconds: 3),()=>{
    print("22222222")
  });
  print("333333333");

}
void testFuture() {

  Future f1 = new Future(() => print('f1'));
  Future f2 = new Future(() =>  null);
  Future f3 = new Future.delayed(Duration(seconds: 1) ,() => print('f2'));
  Future f4 = new Future(() => null);
  Future f5 = new Future(() => null);

  f5.then((_) => print('f3'));
  f4.then((_) {
    print('f4');
    new Future(() => print('f5'));
    f2.then((_) {
      print('f6');
    });
  });
  f2.then((m) {
    print('f7');
  });
  print('f8');
}

void testScheduleMicrotatsk() {

  scheduleMicrotask(() => print('Mission_1'));

//注释1
  new Future.delayed(new Duration(seconds: 1), () => print('Mission_2'));

//注释2
  new Future(() => print('Mission_3')).then((_) {
    print('Mission_4');
    scheduleMicrotask(() => print('Mission_5'));
  }).then((_) => print('Mission_6'));

//注释3
  new Future(() => print('Mission_7'))
      .then((_) => new Future(() => print('Mission_8')))
      .then((_) => print('Mission_9'));

//注释4
  new Future(() => print('Mission_10'));

  scheduleMicrotask(() => print('Mission_11'));

  print('Mission_12');
}

void testCompleter(){
  var completer = Completer();

  var future = completer.future;
// 需要的话串上回调函数。
  print("111111111");
  future.then((value)=> print('$value'));

//做些其它事情
  print("444444");
// 设置为完成状态
  completer.complete("done");
  print("555555");



}
class WannabeFunction {

  call(String a, String b, String c) => '$a $b $c!';

}
Function testMakeAdder () {
  var add1 =  makeAdder(2);
  print(add1(3));

}
Function makeAdder(num addBy) {
  return (num i) => addBy + i;
}