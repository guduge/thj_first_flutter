//
//  THJPolyFlutterVodViewController.m
//  Runner
//
//  Created by 赵优路 on 2019/11/22.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "THJPolyFlutterVodViewController.h"
#import <PLVVodSDK/PLVVodSDK.h>
#import "PLVVodSkinPlayerController.h"
@interface THJPolyFlutterVodViewController ()
@property (weak, nonatomic) IBOutlet UIView *playerPlaceholder;
@property (nonatomic, strong) PLVVodSkinPlayerController *player;
@end

@implementation THJPolyFlutterVodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.vid = @"e97dbe3e646bb7c3afcadb5380a1404c_e";//e8db0c143ab341321b4c7d0f3d05e16a_e
    self.vid = @"e97dbe3e646bb7c3afcadb5380a1404c_e";
    [self setupPlayer];
}
- (void)setupPlayer {
    // 初始化播放器
    PLVVodSkinPlayerController *player = [[PLVVodSkinPlayerController alloc] initWithNibName:nil bundle:nil];
    // 因播放器皮肤的部分控件，需根据'防录屏'开关决定是否显示，因此若需打开，请在addPlayerOnPlaceholderView前设置
     player.videoCaptureProtect = YES;
    [player addPlayerOnPlaceholderView:self.playerPlaceholder rootViewController:self];
    self.player = player;
    self.player.rememberLastPosition = YES;
    self.player.enableBackgroundPlayback = YES;
    self.player.autoplay = YES;
    self.player.enableLocalViewLog = YES;
    
    NSString *vid = self.vid;
    if (self.isOffline){
        
        // 离线视频播放
        __weak typeof(self) weakSelf = self;
        
        // 根据资源类型设置默认播放模式。本地音频文件设定音频播放模式，本地视频文件设定视频播放模式
        // 只针对开通视频转音频服务的用户
        self.player.playbackMode = self.playMode;
        
        [PLVVodVideo requestVideoPriorityCacheWithVid:self.vid completion:^(PLVVodVideo *video, NSError *error) {
            weakSelf.player.video = video;
            dispatch_async(dispatch_get_main_queue(), ^{
                weakSelf.title = video.title;
            });
        }];
    }
    else{
        // 在线视频播放，默认会优先播放本地视频
        __weak typeof(self) weakSelf = self;
        [PLVVodVideo requestVideoWithVid:vid completion:^(PLVVodVideo *video, NSError *error) {
            if (error){
                // 用于播放重试
                self.player.vid = vid;
                if (self.player.playerErrorHandler) {
                    self.player.playerErrorHandler(self.player, error);
                };
            }
            else{
                weakSelf.player.video = video;
                dispatch_async(dispatch_get_main_queue(), ^{
                    weakSelf.title = video.title;
                });
            }
        }];
    }
}
- (BOOL)prefersStatusBarHidden {
    return self.player.prefersStatusBarHidden;
}
    
- (UIStatusBarStyle)preferredStatusBarStyle {
    return self.player.preferredStatusBarStyle;
}
    
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}
    
- (BOOL)shouldAutorotate{
    if (self.player.isLockScreen){
        return NO;
    }
    return YES;
}
//- (instancetype)init{
//
//    return self;
//}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (void)dealloc
{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
