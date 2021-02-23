class UserTest {

  /**
   * brokerAvatar : "broker/getAvatar?key=avatar/b82378ccaccb403c9d8420274372c904"
   * brokerCellphone : "1347282****"
   * brokerName : "王**"
   * brokerSid : "b82378ccaccb403c9d8420274372c904"
   * code : "1512151307270113"
   * cover : "show/getPoster?key=52f30bbce4ef4122919cbc95c2f01c36/52f30bbce4ef4122919cbc95c2f01c36"
   * createdDatetime : "2015-12-15 13:07:28"
   * deliveryAddressSid : "c25c1954ca204dee8fc18f51bcc71a3e"
   * orderStatus : "CLOSED"
   * orderStatusDesp : ""
   * orderType : "1"
   * payType : ""
   * postTicketSid : "65cc6d54300349e984134ecd0faf3ede"
   * receiveDatetime : "2015-12-15 13:07:28"
   * receiver : "张**"
   * receiverAddress : "控江路1209"
   * receiverCellphone : "1502379****"
   * receiverTitle : "先生"
   * remark : ""
   * requestDatetime : "2015-12-15 13:07:28"
   * showName : "Love Radio 品冠 现在你在哪里 巡回演唱会上海站"
   * showSchedule : "2016-01-09 19:30:00"
   * showScheduleSid : "eecfd0657fb445a7a36abedc9b621c89"
   * showSid : "52f30bbce4ef4122919cbc95c2f01c36"
   * sid : "21bc3cc65e9e47af952c1f4f1f0fd85a"
   * stateDesp : "已关闭"
   * ticketSid : "c4583aa8a79a478e8e5cd14691028430"
   * tradeType : "EXPRESS"
   * userCellphone : "1502379****"
   * userLeaveMessage : ""
   * userSid : "a19cf6e3586143d283dd4128c456bfaf"
   * venueAddress : "上海市长宁区武夷路777号"
   * venueName : "上海国际体操中心"
   * isDelete : false
   * isSequential : false
   * brokerStars : 4.5
   * bidding : 2300
   * brokerDealNum : 15
   * deliveryFee : 0
   * evaluateStarts : 0
   * ticketPrice : 88000
   * ticketQuantity : 1
   * totalPrice : 2300
   * orderStatusArray : [{"operateDatetime":"2015-12-15 13:07:28","operateUserSid":"b82378ccaccb403c9d8420274372c904","operateUsername":"王**","orderSid":"21bc3cc65e9e47af952c1f4f1f0fd85a","orderType":"1","sid":"04940ed81540466ea4408f79989a5d54","state":"TAKING"}]
   */

  String brokerAvatar;
  String brokerCellphone;
  String brokerName;
  String brokerSid;
  String code;
  String cover;
  String createdDatetime;
  String deliveryAddressSid;
  String orderStatus;
  String orderStatusDesp;
  String orderType;
  String payType;
  String postTicketSid;
  String receiveDatetime;
  String receiver;
  String receiverAddress;
  String receiverCellphone;
  String receiverTitle;
  String remark;
  String requestDatetime;
  String showName;
  String showSchedule;
  String showScheduleSid;
  String showSid;
  String sid;
  String stateDesp;
  String ticketSid;
  String tradeType;
  String userCellphone;
  String userLeaveMessage;
  String userSid;
  String venueAddress;
  String venueName;
  bool isDelete;
  bool isSequential;
  double brokerStars;
  int bidding;
  int brokerDealNum;
  int deliveryFee;
  int evaluateStarts;
  int ticketPrice;
  int ticketQuantity;
  int totalPrice;
  List<OrderStatusArrayListBean> orderStatusArray;

  static UserTest fromMap(Map<String, dynamic> map) {
    UserTest userTest = new UserTest();
    userTest.brokerAvatar = map['brokerAvatar'];
    userTest.brokerCellphone = map['brokerCellphone'];
    userTest.brokerName = map['brokerName'];
    userTest.brokerSid = map['brokerSid'];
    userTest.code = map['code'];
    userTest.cover = map['cover'];
    userTest.createdDatetime = map['createdDatetime'];
    userTest.deliveryAddressSid = map['deliveryAddressSid'];
    userTest.orderStatus = map['orderStatus'];
    userTest.orderStatusDesp = map['orderStatusDesp'];
    userTest.orderType = map['orderType'];
    userTest.payType = map['payType'];
    userTest.postTicketSid = map['postTicketSid'];
    userTest.receiveDatetime = map['receiveDatetime'];
    userTest.receiver = map['receiver'];
    userTest.receiverAddress = map['receiverAddress'];
    userTest.receiverCellphone = map['receiverCellphone'];
    userTest.receiverTitle = map['receiverTitle'];
    userTest.remark = map['remark'];
    userTest.requestDatetime = map['requestDatetime'];
    userTest.showName = map['showName'];
    userTest.showSchedule = map['showSchedule'];
    userTest.showScheduleSid = map['showScheduleSid'];
    userTest.showSid = map['showSid'];
    userTest.sid = map['sid'];
    userTest.stateDesp = map['stateDesp'];
    userTest.ticketSid = map['ticketSid'];
    userTest.tradeType = map['tradeType'];
    userTest.userCellphone = map['userCellphone'];
    userTest.userLeaveMessage = map['userLeaveMessage'];
    userTest.userSid = map['userSid'];
    userTest.venueAddress = map['venueAddress'];
    userTest.venueName = map['venueName'];
    userTest.isDelete = map['isDelete'];
    userTest.isSequential = map['isSequential'];
    userTest.brokerStars = map['brokerStars'];
    userTest.bidding = map['bidding'];
    userTest.brokerDealNum = map['brokerDealNum'];
    userTest.deliveryFee = map['deliveryFee'];
    userTest.evaluateStarts = map['evaluateStarts'];
    userTest.ticketPrice = map['ticketPrice'];
    userTest.ticketQuantity = map['ticketQuantity'];
    userTest.totalPrice = map['totalPrice'];
    userTest.orderStatusArray = OrderStatusArrayListBean.fromMapList(map['orderStatusArray']);
    return userTest;
  }

  static List<UserTest> fromMapList(dynamic mapList) {
    if (mapList == null) return [];
    List<UserTest> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}

class OrderStatusArrayListBean {

  /**
   * operateDatetime : "2015-12-15 13:07:28"
   * operateUserSid : "b82378ccaccb403c9d8420274372c904"
   * operateUsername : "王**"
   * orderSid : "21bc3cc65e9e47af952c1f4f1f0fd85a"
   * orderType : "1"
   * sid : "04940ed81540466ea4408f79989a5d54"
   * state : "TAKING"
   */

  String operateDatetime;
  String operateUserSid;
  String operateUsername;
  String orderSid;
  String orderType;
  String sid;
  String state;

  static OrderStatusArrayListBean fromMap(Map<String, dynamic> map) {
    OrderStatusArrayListBean orderStatusArrayListBean = new OrderStatusArrayListBean();
    orderStatusArrayListBean.operateDatetime = map['operateDatetime'];
    orderStatusArrayListBean.operateUserSid = map['operateUserSid'];
    orderStatusArrayListBean.operateUsername = map['operateUsername'];
    orderStatusArrayListBean.orderSid = map['orderSid'];
    orderStatusArrayListBean.orderType = map['orderType'];
    orderStatusArrayListBean.sid = map['sid'];
    orderStatusArrayListBean.state = map['state'];
    return orderStatusArrayListBean;
  }

  static List<OrderStatusArrayListBean> fromMapList(dynamic mapList) {
    if (mapList == null) return [];
    List<OrderStatusArrayListBean> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }
}


