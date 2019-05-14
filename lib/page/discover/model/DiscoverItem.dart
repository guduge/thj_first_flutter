class DiscoverItem {

  /**
   * Title : "2019年二建《公路实务》阶段性复习计划之夯实基础"
   * Intro : ""
   * DefaultPic : "http://wap.niceloo.com//UploadFiles/2018-7/191/F131771594122076.png"
   * AddDate : "2018-07-27"
   * InfoID : 92346
   * Hits : 1259
   */

  String Title;
  String Intro;
  String DefaultPic;
  String AddDate;
  int InfoID;
  int Hits;

  static DiscoverItem fromMap(Map<String, dynamic> map) {
    DiscoverItem discoverItem = new DiscoverItem();
    discoverItem.Title = map['Title'];
    discoverItem.Intro = map['Intro'];
    discoverItem.DefaultPic = map['DefaultPic'];
    discoverItem.AddDate = map['AddDate'];
    discoverItem.InfoID = map['InfoID'];
    discoverItem.Hits = map['Hits'];
    return discoverItem;
  }

  static List<DiscoverItem> fromMapList(dynamic mapList) {
    if (mapList == null) return [];
    List<DiscoverItem> list = new List(mapList.length);
    for (int i = 0; i < mapList.length; i++) {
      list[i] = fromMap(mapList[i]);
    }
    return list;
  }

}
