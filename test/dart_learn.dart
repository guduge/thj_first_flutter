
import 'dart:async';

void main(){
//  testFuture();
  testScheduleMicrotatsk();
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