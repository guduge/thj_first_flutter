//
//  THJPolyFlutterVodManager.h
//  Runner
//
//  Created by 赵优路 on 2019/11/21.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <PLVVodSDK/PLVVodSDK.h>
#import <Flutter/Flutter.h>
#import "PLVVodSkinPlayerController.h"
#import "THJPolyFlutterVodViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface THJPolyFlutterVodManager : NSObject
///  便于管理的View
@property (nonatomic, strong) UIView *mainView;
@property (nonatomic, strong) PLVVodSkinPlayerController *player;
@property (nonatomic, assign) BOOL isOffline;
@property (nonatomic, assign) PLVVodPlaybackMode playMode;
@property (nonatomic, copy) NSString *vid;
@property(nonatomic,strong) THJPolyFlutterVodViewController *polvVC;
@property(nonatomic,strong) FlutterMethodChannel* _channel;
+ (instancetype)sharedSingleton;
- (void)play:(NSString *)url;
- (void)stop;
@end

NS_ASSUME_NONNULL_END
