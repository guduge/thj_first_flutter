
/**
 * author : tianhj
 * date : 2020/7/10 16:32
 * description ： TODO:类的作用
 */
import 'count_state.dart';
import 'action.dart';
/**
 * reducer会根据传进来的action生成新的CountState
 */
CountState reducer(CountState state,action){
  //匹配Action
  if(action == Action.increment){
    return CountState(state.count+1);
  }
  return state;
}

