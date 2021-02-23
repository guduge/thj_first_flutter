
/**
 * author : tianhj
 * date : 2019-11-21 15:05
 * description ： TODO:类的作用
 */
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

typedef void VodPlayerViewWidgetCreatedCallback(VodPlayerController controller);

class VodVideoWidget extends StatefulWidget {
  final VodPlayerViewWidgetCreatedCallback callback;
  final x;
  final y;
  final width;
  final height;

  VodVideoWidget({
    Key key,
    @required this.callback,
    @required this.x,
    @required this.y,
    @required this.width,
    @required this.height,
  });
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _VodVideoWidgetState();
  }
}

class _VodVideoWidgetState extends State<VodVideoWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return UiKitView(
      viewType: "POLVFlutterVodPlayerView",
      onPlatformViewCreated: _onPlatformViewCreated,
        creationParams: <String, dynamic>{
          "x":widget.x,
          "y":widget.y,
          "width":widget.width,
          "height":widget.height,
        },
      creationParamsCodec: new StandardMessageCodec(),

    );
  }

  void _onPlatformViewCreated(int id) {
    if (widget.callback == null) {
      return;
    }
    widget.callback(VodPlayerController._(id));
  }
}

class VodPlayerController {
  VodPlayerController._(int id)
      : _channel = MethodChannel('POLVFlutterVodPlayerView_$id'){
    _channel.setMethodCallHandler(_onMethodCall);
  }

  final MethodChannel _channel;

  Future<void> play(String url) async {
    return _channel.invokeMethod('play', url);
  }

  Future<void> stop() async {
    return _channel.invokeMethod('stop');
  }

  Future<bool> _onMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'orientationChange':
        final String orientation = call.arguments['orientation'];
        print("orientation----------------"+orientation);
        print("call.arguments----------------");
        print(call.arguments);
        return true;

    }
    throw MissingPluginException(
        '${call.method} was invoked but has no handler');
  }

}
