//
//  DES3EncryptUtil.h
//  NiceLooEducationCRM
//
//  Created by 优路教育  on 2017/5/3.
//  Copyright © 2018年 NiceLoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DES3EncryptUtil : NSObject
// 加密方法
+ (NSString *)encrypt:(NSString *)plainText;
// 解密方法
+ (NSString *)decrypt:(NSString *)encryptText;
@end
