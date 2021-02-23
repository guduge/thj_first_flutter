//
//  THJPolyFlutterView.h
//  Runner
//
//  Created by 赵优路 on 2019/11/21.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
#import "THJPolyFlutterVodManager.h"
NS_ASSUME_NONNULL_BEGIN

@interface THJPolyFlutterView : NSObject <FlutterPlatformView>
- (instancetype)initWithWithFrame:(CGRect)frame
 viewIdentifier:(int64_t)viewId
      arguments:(id _Nullable)args
binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;
- (UIView*)view;
@end

NS_ASSUME_NONNULL_END
