#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "NativeTool.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
  [GeneratedPluginRegistrant registerWithRegistry:self];
    
    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;
    
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                            methodChannelWithName:@"com.youlueducation/aes"
                                            binaryMessenger:controller];

    
    [channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
        
        if ([@"AESEncryptText" isEqualToString:call.method]) {
            NSString * str =[NativeTool AESEncryptText:call.arguments];
            result(str);
            NSLog(@"%@",call.arguments);
            NSLog(@"AESEncryptText=====%@",str);
        }else if ([@"AESDencryptText" isEqualToString:call.method]){
            NSString * resultStr =[NativeTool AESDencryptText:call.arguments];
            result(resultStr);
            NSLog(@"%@",call.arguments);
            NSLog(@"AESEncryptText=====%@",resultStr);
        }
        
        // TODO
    }];
    
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
    
}

@end
