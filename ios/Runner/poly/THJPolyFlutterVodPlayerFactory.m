//
//  THJPolyFlutterVodPlayerFactory.m
//  Runner
//
//  Created by 赵优路 on 2019/11/21.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

#import "THJPolyFlutterVodPlayerFactory.h"
#import "THJPolyFlutterView.h"
@implementation THJPolyFlutterVodPlayerFactory
{
     NSObject<FlutterBinaryMessenger>* _messenger;
}
- (instancetype)initWithMessenger:(NSObject<FlutterBinaryMessenger>*)messenger{
    self = [super init];
    if (self){
        _messenger = messenger;
    }
    return self;
}
- (NSObject<FlutterMessageCodec> *)createArgsCodec {
     return [FlutterStandardMessageCodec sharedInstance];
}
- (NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args{

   
    return  [[THJPolyFlutterView alloc] initWithWithFrame:frame
                                        viewIdentifier:viewId
                                             arguments:args
                                       binaryMessenger:_messenger];;
}

@end
