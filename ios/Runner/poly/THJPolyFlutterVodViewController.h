//
//  THJPolyFlutterVodViewController.h
//  Runner
//
//  Created by 赵优路 on 2019/11/22.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PLVVodSDK/PLVVodConstans.h>
NS_ASSUME_NONNULL_BEGIN

@interface THJPolyFlutterVodViewController : UIViewController
@property (nonatomic, copy) NSString *vid;
@property (nonatomic, assign) BOOL isOffline;
@property (nonatomic, assign) PLVVodPlaybackMode playMode;
@end

NS_ASSUME_NONNULL_END
