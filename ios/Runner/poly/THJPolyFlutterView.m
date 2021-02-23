//
//  THJPolyFlutterView.m
//  Runner
//
//  Created by 赵优路 on 2019/11/21.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "THJPolyFlutterView.h"

@implementation THJPolyFlutterView
- (instancetype)initWithWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    if ([super init]) {
        NSDictionary *dic = args;
        CGFloat x = [dic[@"x"] floatValue];
        CGFloat y = [dic[@"y"] floatValue];
        CGFloat width = [dic[@"width"] floatValue];
        CGFloat height = [dic[@"height"] floatValue];
        THJPolyFlutterVodManager.sharedSingleton.mainView.frame = CGRectMake(x, y, width, height);
        NSString *channelName = [NSString stringWithFormat:@"POLVFlutterVodPlayerView_%lld",viewId];
        THJPolyFlutterVodManager.sharedSingleton._channel  = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];
        __weak __typeof__ (self) weakSelf = self;
        [THJPolyFlutterVodManager.sharedSingleton._channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
            [weakSelf onMethodCall:call result:result];
        }];

    }
    return self;
}
- (UIView*)view {
    return THJPolyFlutterVodManager.sharedSingleton.mainView;
}
- (void)onMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result{
    if ([[call method] isEqualToString:@"play"]){
        NSString *url = [call arguments];
        [THJPolyFlutterVodManager.sharedSingleton play:url];
    } else if ([[call method] isEqualToString:@"stop"]){
         [THJPolyFlutterVodManager.sharedSingleton stop];
    } else {
        result(FlutterMethodNotImplemented);
    }
}
@end
