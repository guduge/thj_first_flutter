//
//  FlutterWebView.m
//  Runner
//
//  Created by 赵优路 on 2019/6/28.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "THJFlutterWebView.h"

@implementation THJWebViewFactory {
    NSObject<FlutterBinaryMessenger>* _messenger;
}
- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger {
    self = [super init];
    if (self) {
        _messenger = messenger;
    }
    return self;
}
- (NSObject<FlutterMessageCodec> *)createArgsCodec {
     return [FlutterStandardMessageCodec sharedInstance];
}

- (NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args{
    THJFlutterWebView* webviewController =
    [[THJFlutterWebView alloc] initWithWithFrame:frame
                                     viewIdentifier:viewId
                                          arguments:args
                                    binaryMessenger:_messenger];
    return webviewController;
}
@end


@implementation THJFlutterWebView
{
    WKWebView* _webView;
    int64_t _viewId;
    FlutterMethodChannel* _channel;
}
- (instancetype)initWithWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    if ([super init]) {
        _viewId = viewId;
        _webView = [[WKWebView alloc] initWithFrame:frame];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        NSString* channelName = [NSString stringWithFormat:@"plugins.flutter.io/thjwebview_%lld", viewId];
        _channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        
        __weak __typeof__ (self)weakSelf = self;
        
        [_channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
            [weakSelf onMethodCall:call result:result];
        }];
        NSDictionary<NSString*, id>* settings = args[@"settings"];
        [self applySettings:settings];
        NSString* initialUrl = args[@"initialUrl"];
        if (initialUrl) {
            [self loadUrl:initialUrl];
        }
    }
    return self;
}
- (UIView*)view {
    return _webView;
}

- (void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([[call method] isEqualToString:@"updateSettings"]) {
        [self onUpdateSettings:call result:result];
    } else if ([[call method] isEqualToString:@"loadUrl"]) {
        [self onLoadUrl:call result:result];
    } else if ([[call method] isEqualToString:@"back"]) {
        if (_webView.canGoBack) {
            [_webView goBack];
            result(@YES);
        }else{
            result(@NO);
        }
        
    }else if ([[call method] isEqualToString:@"forward"]) {
        if (_webView.canGoForward) {
            [_webView goForward];
            result(@YES);
        }else{
            result(@NO);
        }
        
    }
    else {
        result(FlutterMethodNotImplemented);
    }
}
- (void)onUpdateSettings:(FlutterMethodCall*)call result:(FlutterResult)result {
    [self applySettings:[call arguments]];
    result(nil);
}
- (void)onLoadUrl:(FlutterMethodCall*)call result:(FlutterResult)result {
    NSString* url = [call arguments];
    if (![self loadUrl:url]) {
        result([FlutterError errorWithCode:@"loadUrl_failed"
                                   message:@"Failed parsing the URL"
                                   details:[NSString stringWithFormat:@"URL was: '%@'", url]]);
    } else {
        result(nil);
    }
}
- (void)applySettings:(NSDictionary<NSString*, id>*)settings {
    for (NSString* key in settings) {
        if ([key isEqualToString:@"jsMode"]) {
            NSNumber* mode = settings[key];
            [self updateJsMode:mode];
        } else {
            NSLog(@"webview_flutter: unknown setting key: %@", key);
        }
    }
}

- (void)updateJsMode:(NSNumber*)mode {
    WKPreferences* preferences = [[_webView configuration] preferences];
    switch ([mode integerValue]) {
        case 0:  // disabled
            [preferences setJavaScriptEnabled:NO];
            break;
        case 1:  // unrestricted
            [preferences setJavaScriptEnabled:YES];
            break;
        default:
            NSLog(@"webview_flutter: unknown javascript mode: %@", mode);
    }
}

- (bool)loadUrl:(NSString*)url {
    NSURL* nsUrl = [NSURL URLWithString:url];
    if (!nsUrl) {
        return false;
    }
    NSURLRequest* req = [NSURLRequest requestWithURL:nsUrl];
    [_webView loadRequest:req];
    return true;
}

#pragma mark navigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
     [_channel invokeMethod:@"onPageStart" arguments:@{@"url" : webView.URL.absoluteString}];
    
}
- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    [_channel invokeMethod:@"onPageError" arguments:@{@"url" : webView.URL.absoluteString}];
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
     [_channel invokeMethod:@"onPageFinished" arguments:@{@"url" : webView.URL.absoluteString}];
}


@end
