//
//  THJPolyFlutterPlugin.m
//  Runner
//
//  Created by 赵优路 on 2019/7/29.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "THJPolyFlutterPlugin.h"
#import "THJPolyFlutterVodPlayerFactory.h"
@implementation THJPolyFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar{
    THJPolyFlutterVodPlayerFactory *vodFactory = [[THJPolyFlutterVodPlayerFactory alloc] initWithMessenger:registrar.messenger];
    [registrar registerViewFactory:vodFactory withId:@"POLVFlutterVodPlayerView"];
    
}

@end
