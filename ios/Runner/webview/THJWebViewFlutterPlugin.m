
//
//  WebViewFlutterPlugin.m
//  Runner
//
//  Created by 赵优路 on 2019/6/30.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "THJWebViewFlutterPlugin.h"
#import "THJFlutterWebView.h"

@implementation THJWebViewFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar{
    THJWebViewFactory* webviewFactory =
    [[THJWebViewFactory alloc] initWithMessenger:registrar.messenger];
    [registrar registerViewFactory:webviewFactory withId:@"plugins.flutter.io/thjwebview"];
}
@end
