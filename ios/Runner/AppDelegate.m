#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "NativeTool.h"
#include <fluwx/FluwxResponseHandler.h>
#include <fluwx/WXApi.h>
#import "THJWebViewFlutterPlugin.h"
#import "THJPolyFlutterPlugin.h"
#import <PLVVodSDK/PLVVodSDK.h>
#import "PLVSchool.h"
//#import <MobPush/MobPush.h>
@implementation AppDelegate
static NSString * const PLVVodKeySettingKey = @"vodKey_preference";
static NSString * const PLVSdkVersionSettingKey = @"sdkVersion_preference";
static NSString * const PLVApplySettingKey = @"apply_preference";

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self configPolv];
//    [MobPush setAPNsForProduction:NO];
    
    [THJWebViewFlutterPlugin registerWithRegistrar: [self registrarForPlugin:@"THJWebViewFlutterPlugin"]];
    [GeneratedPluginRegistrant registerWithRegistry:self];
    [THJPolyFlutterPlugin registerWithRegistrar:[self registrarForPlugin:@"THJPolyFlutterPlugin"]];
    
    
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
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [WXApi handleOpenURL:url delegate:[FluwxResponseHandler defaultManager]];
}
// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    
    return [WXApi handleOpenURL:url delegate:[FluwxResponseHandler defaultManager]];
}

- (void)configPolv {
    
    NSError *error = nil;
    PLVSchool *school = [PLVSchool sharedInstance];
    NSString *vodKey = school.vodKey;
    NSString *decodeKey = school.vodKeyDecodeKey;
    NSString *decodeIv = school.vodKeyDecodeIv;
//    PLVVodSettings *settings = [PLVVodSettings settingsWithUserid:@"e8db0c143a" readtoken:@"" writetoken:@"" secretkey:@"fc69a91460fb43a8b0599c886bc5705a"];
    PLVVodSettings *settings = [PLVVodSettings settingsWithConfigString:vodKey key:decodeKey iv:decodeIv error:&error];
    
    settings.logLevel = PLVVodLogLevelAll;
    
    settings.viewerId = @"观看用户ID";
    settings.viewerName = @"观看用户名称";
    settings.viewerAvatar = @"观看用户头像";
}
@end
