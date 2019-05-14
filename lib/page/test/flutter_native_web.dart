//import 'package:flutter/material.dart';
//
//import 'package:flutter_native_web/flutter_native_web.dart';
//import 'package:flutter/gestures.dart';
//import 'package:flutter/foundation.dart';
//
//
//class FlutterWebView extends StatefulWidget {
//  @override
//  _MyAppState createState() => new _MyAppState();
//}
//
//class _MyAppState extends State<FlutterWebView> {
//
//  WebController webController;
//
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//
//    FlutterNativeWeb flutterWebView = new FlutterNativeWeb(
//      onWebCreated: onWebCreated,
//      gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
//        Factory<OneSequenceGestureRecognizer>(
//              () => TapGestureRecognizer(),
//        ),
//      ].toSet(),
//    );
//
//    return new MaterialApp(
//      home: new Scaffold(
//          appBar: new AppBar(
//            title: const Text('Native WebView as Widget'),
//          ),
//          body: new SingleChildScrollView(
//            child: new Column(
//              children: <Widget>[
//                Container(
//                  child: flutterWebView,
//                  width: MediaQuery.of(context).size.width,
//                  height: 700,
//                )
//
//              ],
//            ),
//          )
//      ),
//    );
//  }
//
//  void onWebCreated(webController) {
//    this.webController = webController;
//    this.webController.loadData("<style> img{width:100%;}</style>　　据了解，住房和城乡建设部发布的新版《建筑业企业资质标准》，明确了二级建造师在资质认定方面的必要性，对施工企业专业资质中建造师的人数、专业方面提出了更高的要求。较之前的企业资质等级标准，新标准在原有基础上提高了对市政专业、机电专业建造师的要求。<br />\r\n　　<strong>二级建造师含金量</strong><br />\r\n　　新标准的出台，对全国百万建造师考生来说是一个好消息。这是对前阶段关于建造师考试可能会被取消的一个响亮回应，彻底打消了大家的疑虑。基于建筑领域的特殊性，专业人才具有不可替代的作用，所以，二级建造师考试不仅不会取消，而且会越来越重要。<br />\r\n　　新版《建筑业企业资质标准》进一步规范了建筑企业资质评定，刺激了对建造师的需求，引起了业内外的高度关注。住建部此举不仅规范了行业标准，体现了实务工作中的专业性，同时也拓宽了建造师的就业前景，对于广大持证人员来说，不仅证书不会受到影响，反而证书含金量会更高。这就意味着二级建造师在报考、增项时对专业的选择有了更多的余地。<br />\r\n　　虽然建造师考试历经十余载，建造师人数达到数十万人，但依然供不应求，需求缺口巨大，新标准出台后，建造师的需求又将得到进一步的提升。同时，新标准对建造师的专业进行了更为明确的要求，这将使企业在人才引进和培养方面有所变化，建造师中建筑专业一家独大的局面会被逐步改变，机电和市政专业的建造师将有更多选择。<br />\r\n　　在新标准下，无论是企业，还是建造师都面临着新的机遇和考验，建筑行业将愈加成熟规范，在市场的引导下，高素质的二级建造师将变得更加稀缺，二级建造师的发展前景也会也来越好!");
//    this.webController.onPageStarted.listen((url) =>
//        print("Loading $url")
//    );
//    this.webController.onPageFinished.listen((url) =>
//        print("Finished loading $url")
//    );
//  }
//}