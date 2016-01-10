//
//  RegularHelp.h
//  3DES加密解密
//
//  Created by 黎跃春 on 14-10-17.
//  Copyright (c) 2014年 黎跃春. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegularHelp : NSObject

+ (BOOL) validateUserAge:(NSString *)str;
+ (BOOL) validateUserEmail:(NSString *)str;
+ (BOOL) validateUserPhone:(NSString *)str;
+ (BOOL) validatePositiveNumber:(NSString *)str;
+ (BOOL) validateMoney:(NSString *)str;

@end




