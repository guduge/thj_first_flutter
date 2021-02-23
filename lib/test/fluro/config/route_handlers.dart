import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:thj_first_flutter/test/fluro/components/demo/demo_simple_component.dart';
import 'package:thj_first_flutter/test/fluro/components/home/home_component.dart';
import 'package:thj_first_flutter/test/fluro/helpers/ColorHelpers.dart';

var rootHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return new HomeComponent();
    });
var demoRouteHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String message = params["message"]?.first;
      String colorHex = params["color_hex"]?.first;
      String result = params["result"]?.first;
      Color color = new Color(0xFFFFFFFF);
      if (colorHex != null && colorHex.length > 0) {
        color = new Color(ColorHelpers.fromHexString(colorHex));
      }
      return new DemoSimpleComponent(
          message: message, color: color, result: result);
    });