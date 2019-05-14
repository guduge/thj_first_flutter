//
//  AES.h
//  NiceLooEducation
//
//  Created by 优路教育  on 2018/2/13.
//  Copyright © 2018年 NiceLoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AES : NSObject
// 解密
+ (NSData *)AESDencryptText:(NSString *)text;
// 加密
+ (NSString *)AESEncryptText:(NSString *)text;
@end
