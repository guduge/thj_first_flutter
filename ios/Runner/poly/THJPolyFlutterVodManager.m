//
//  THJPolyFlutterVodManager.m
//  Runner
//
//  Created by 赵优路 on 2019/11/21.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "THJPolyFlutterVodManager.h"

@implementation THJPolyFlutterVodManager

+ (instancetype)sharedSingleton {
    static THJPolyFlutterVodManager *_sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedSingleton = [[super allocWithZone:NULL] init];
        _sharedSingleton.mainView = [[UIView alloc]initWithFrame:CGRectZero];
    });
    return _sharedSingleton;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [THJPolyFlutterVodManager sharedSingleton];
}

- (id)copyWithZone:(nullable NSZone *)zone {
    return [THJPolyFlutterVodManager sharedSingleton];
}

- (id)mutableCopyWithZone:(nullable NSZone *)zone {
    return [THJPolyFlutterVodManager sharedSingleton];
}
/// 播放
- (void)play:(NSString *)url{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didChangeRotate:) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
    
    [self setupPlayer];
}
- (void)didChangeRotate:(NSNotification*)notice {
    if (self._channel){
        if ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationPortrait) {
            [THJPolyFlutterVodManager.sharedSingleton._channel invokeMethod:@"orientationChange" arguments:@{@"orientation":@"portrait"}];
        } else if ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationPortraitUpsideDown) {
            [THJPolyFlutterVodManager.sharedSingleton._channel invokeMethod:@"orientationChange" arguments:@{@"orientation":@"upsideDown"}];
        } else if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeRight){
            [THJPolyFlutterVodManager.sharedSingleton._channel invokeMethod:@"orientationChange" arguments:@{@"orientation":@"right"}];
        } else if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft) {
            [THJPolyFlutterVodManager.sharedSingleton._channel invokeMethod:@"orientationChange" arguments:@{@"orientation":@"left"}];
        } else {
            
        }
    }
    
        
}
- (void)stop {
    [self.mainView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.polvVC = nil;
    self._channel = nil;
}
- (void)setupPlayer {
    [self.mainView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    THJPolyFlutterVodViewController *vc = [[THJPolyFlutterVodViewController alloc]init];
    vc.view.frame = self.mainView.bounds;
    self.polvVC = vc;
    [self.mainView addSubview:vc.view];
    
//    self.mainView.backgroundColor = [UIColor greenColor];
//    // 初始化播放器
//    PLVVodSkinPlayerController *player = [[PLVVodSkinPlayerController alloc] initWithNibName:nil bundle:nil];
//    // 因播放器皮肤的部分控件，需根据'防录屏'开关决定是否显示，因此若需打开，请在addPlayerOnPlaceholderView前设置
//     player.videoCaptureProtect = YES;
//    [self.mainView addSubview:player.videoView];
//    [player addPlayerOnPlaceholderView:self.mainView rootViewController:[self appRootViewController]];
//    self.player = player;
//    self.player.rememberLastPosition = YES;
//    self.player.enableBackgroundPlayback = YES;
//    self.player.autoplay = YES;
//    self.player.enableLocalViewLog = YES;
////    self.vid = @"e8db0c143ab341321b4c7d0f3d05e16a_e";
//    self.vid = @"e97dbe3e646bb7c3afcadb5380a1404c_e";
//
//    NSString *vid = self.vid;
//    if (self.isOffline){
//
//        // 离线视频播放
//        __weak typeof(self) weakSelf = self;
//
//        // 根据资源类型设置默认播放模式。本地音频文件设定音频播放模式，本地视频文件设定视频播放模式
//        // 只针对开通视频转音频服务的用户
//        self.player.playbackMode = self.playMode;
//
//        [PLVVodVideo requestVideoPriorityCacheWithVid:self.vid completion:^(PLVVodVideo *video, NSError *error) {
//            weakSelf.player.video = video;
//            dispatch_async(dispatch_get_main_queue(), ^{
//
//            });
//        }];
//    }
//    else{
//        // 在线视频播放，默认会优先播放本地视频
//        __weak typeof(self) weakSelf = self;
//        [PLVVodVideo requestVideoWithVid:vid completion:^(PLVVodVideo *video, NSError *error) {
//            if (error){
//                // 用于播放重试
//                self.player.vid = vid;
//                if (self.player.playerErrorHandler) {
//                    self.player.playerErrorHandler(self.player, error);
//                };
//            }
//            else{
//                weakSelf.player.video = video;
//                dispatch_async(dispatch_get_main_queue(), ^{
////                    weakSelf.title = video.title;
//                });
//            }
//        }];
//    }
}

- (UIViewController *)appRootViewController

{
    
    UIViewController *RootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIViewController *topVC = RootVC;
    
    while (topVC.presentedViewController) {
        
        topVC = topVC.presentedViewController;
        
    }
    
    return topVC;
    
}

@end
