/**
 * author : tianhj
 * date : 2020/7/10 16:31
 * description ： TODO:类的作用
 */
import 'package:meta/meta.dart';

@immutable
class CountState{
  int _count;
  get count => _count;

  CountState(this._count);
  CountState.initState(){ _count = 0;}
}