class UserTest1 {

  /**
   * orderStatus : "CLOSED"
   * isDelete : false
   * isSequential : false
   * orderStatusArray : ["xx","name","xxxx"]
   */

  String orderStatus;
  bool isDelete;
  bool isSequential;
  List<String> orderStatusArray;

  static UserTest1 fromMap(Map<String, dynamic> map) {
    UserTest1 userTest1 = new UserTest1();
    userTest1.orderStatus = map['orderStatus'];
    userTest1.isDelete = map['isDelete'];
    userTest1.isSequential = map['isSequential'];

    List<dynamic> dynamicList0 = map['orderStatusArray'] ?? [];
    userTest1.orderStatusArray = new List();
    userTest1.orderStatusArray.addAll(dynamicList0.map((o) => o.toString()));

    return userTest1;
  }

  static List<UserTest1> fromMapList(dynamic mapList) {
    if (mapList == null) return [];
    List<UserTest1> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}
