//
//  FlutterWebView.h
//  Runner
//
//  Created by 赵优路 on 2019/6/28.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import <WebKit/WebKit.h>



NS_ASSUME_NONNULL_BEGIN

@interface THJFlutterWebView : NSObject <FlutterPlatformView ,WKUIDelegate,WKNavigationDelegate>
- (instancetype)initWithWithFrame:(CGRect)frame
                   viewIdentifier:(int64_t)viewId
                        arguments:(id _Nullable)args
                  binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;
- (UIView*)view;
@end


@interface THJWebViewFactory : NSObject <FlutterPlatformViewFactory>
- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;
@end


NS_ASSUME_NONNULL_END
