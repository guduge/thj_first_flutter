import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

typedef void WebViewCreatedCallback(WebViewController controller);

enum JavaScriptMode {
  /// JavaScript execution is disabled.
  disabled,

  /// JavaScript execution is not restricted.
  unrestricted,
}

class WebView extends StatefulWidget {
  const WebView({
    Key key,
    this.onWebViewCreated,
    this.initialUrl,
    this.javaScriptMode = JavaScriptMode.unrestricted,
    this.gestureRecognizers,
  })  : assert(javaScriptMode != null),
        super(key: key);

  final WebViewCreatedCallback onWebViewCreated;

  /// Which gestures should be consumed by thonPageStarte web view.
  ///
  /// It is possible for other gesture recognizers to be competing with the web view on pointer
  /// events, e.g if the web view is inside a [ListView] the [ListView] will want to handle
  /// vertical drags. The web view will claim gestures that are recognized by any of the
  /// recognizers on this list.
  ///
  /// When this set is empty or null, the web view will only handle pointer events for gestures that
  /// were not claimed by any other gesture recognizer.
  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers;

  /// The initial URL to load.
  final String initialUrl;

  /// Whether JavaScript execution is enabled.
  final JavaScriptMode javaScriptMode;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WebViewState();
  }


}
class _WebViewState extends State<WebView>{

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  _WebSettings _settings;


  @override
  Widget build(BuildContext context) {

    print("webview--------build");
    if (defaultTargetPlatform == TargetPlatform.android) {
      return GestureDetector(
        // We prevent text selection by intercepting long press event.
        // This is a temporary workaround to prevent a native crash on a second
        // text selection.
        // TODO(amirh): remove this when the selection handles crash is resolved.
        // https://github.com/flutter/flutter/issues/21239
        onLongPress: () {},
        child: AndroidView(
          viewType: 'plugins.flutter.io/webview',
          onPlatformViewCreated: _onPlatformViewCreated,
          gestureRecognizers: widget.gestureRecognizers,
          // WebView content is not affected by the Android view's layout direction,
          // we explicitly set it here so that the widget doesn't require an ambient
          // directionality.
          layoutDirection: TextDirection.rtl,
          creationParams: _CreationParams.fromWidget(widget).toMap(),
          creationParamsCodec: const StandardMessageCodec(),
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'plugins.flutter.io/thjwebview',
        onPlatformViewCreated: _onPlatformViewCreated,
        gestureRecognizers: widget.gestureRecognizers,
        creationParams: _CreationParams.fromWidget(widget).toMap(),
        creationParamsCodec: const StandardMessageCodec(),
      );
    }
    return Text(
        '$defaultTargetPlatform is not yet supported by the webview_flutter plugin');
    // TODO: implement build
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("webview--------initstate");
    _settings = _WebSettings.fromWidget(widget);
  }

  @override
  void didUpdateWidget(WebView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("webview--------didUpdateWidget");
    final _WebSettings newSettings = _WebSettings.fromWidget(widget);
    final Map<String, dynamic> settingsUpdate =
    _settings.updatesMap(newSettings);
    _updateSettings(settingsUpdate);
    _settings = newSettings;

  }
  Future<void> _updateSettings(Map<String, dynamic> update) async {
    print("webview--------_updateSettings");
    if (update == null) {
      return;
    }
    final WebViewController controller = await _controller.future;
    controller._updateSettings(update);
  }
  Future back() async{
    final WebViewController controller = await _controller.future;
    return await controller.back();
  }


  void _onPlatformViewCreated(int id) {
    print("webview--------_onPlatformViewCreated");
    final WebViewController controller = WebViewController._(id);
    _controller.complete(controller);

    if (widget.onWebViewCreated != null) {
      print("webview--------onWebViewCreated");
      widget.onWebViewCreated(controller);
    }
  }

}

class _CreationParams {

  _CreationParams({this.initialUrl, this.settings});

  static _CreationParams fromWidget(WebView widget) {
    print("webview--------_CreationParams");
    return _CreationParams(
      initialUrl: widget.initialUrl,
      settings: _WebSettings.fromWidget(widget),
    );
  }

  final String initialUrl;
  final _WebSettings settings;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'initialUrl': initialUrl,
      'settings': settings.toMap(),
    };
  }
}






class _WebSettings {
  _WebSettings({
    this.javaScriptMode,
  });

  static _WebSettings fromWidget(WebView widget) {
    print("webview--------_WebSettings");

    return _WebSettings(javaScriptMode: widget.javaScriptMode);
  }

  final JavaScriptMode javaScriptMode;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jsMode': javaScriptMode.index,
    };
  }

  Map<String, dynamic> updatesMap(_WebSettings newSettings) {
    if (javaScriptMode == newSettings.javaScriptMode) {
      return null;
    }
    return <String, dynamic>{
      'jsMode': newSettings.javaScriptMode.index,
    };
  }
}


class WebViewController {
  WebViewController._(int id)
      : channel = MethodChannel('plugins.flutter.io/thjwebview_$id'){

  }

  final MethodChannel channel;

  /// Loads the specified URL.
  ///
  /// `url` must not be null.
  ///
  /// Throws an ArgumentError if `url` is not a valid URL string.
  Future<void> loadUrl(String url) async {
    print("webview--------loadUrl");
    assert(url != null);
    _validateUrlString(url);
    return channel.invokeMethod('loadUrl', url);
  }
  Future<void> _updateSettings(Map<String, dynamic> update) async {
    print("webview--------_updateSettings");
    return channel.invokeMethod('updateSettings', update);
  }
  Future back() async{
    print("WebViewController-----back");
    return channel.invokeMethod('back',"");
  }
  Future forward() async{
    print("WebViewController-----forward");
    return channel.invokeMethod('forward',"");
  }

}

void _validateUrlString(String url) {
  try {
    final Uri uri = Uri.parse(url);
    if (uri.scheme.isEmpty) {
      throw ArgumentError('Missing scheme in URL string: "$url"');
    }
  } on FormatException catch (e) {
    throw ArgumentError(e);
  }
}