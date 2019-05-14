
class MyMap {
  static getValue( Map map , String key){
    bool isHasKey = map.containsKey(key);
    return isHasKey ? map[key] : "";
  }
}