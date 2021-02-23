import 'package:flutter/services.dart';

class NativeInteractionInvokeMethod {
  static const encrypt = "AESEncrypt";
  static const decrypt = "AESDencrypt";

  static const getIsNetworkAvailable = "getIsNetworkAvailable";
  static const getLoginEmployeeId = "getLoginEmployeeId";
  static const loginPage = "sample://loginPage";
}


class NativeInteraction {
  MethodChannel platformMethodChannel;
  factory NativeInteraction() =>_sharedInstance();
  static NativeInteraction _instance;

  NativeInteraction._() {
    platformMethodChannel = const MethodChannel('com.niceloo_teacher_flutter');
  }

  static NativeInteraction _sharedInstance() {
    if (_instance == null) {
      _instance = NativeInteraction._();
    }
    return _instance;
  }
}