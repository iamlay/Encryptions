//
//  LSHelper.h
//  LaShouGroup
//
//  Created by  on 14-5-6.
//  Copyright (c) 2014年 . All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LSHelper : NSObject

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message;

/** 将json数据转换成id */
+ (id)parserJsonData:(id)jsonData;

+ (CGSize)sizeForLabelWithString:(NSString *)labelString withFontSize:(CGFloat)fontsize constrainedToSize:(CGSize)maxLabelSize;

+ (CGFloat)widthForLabelWithString:(NSString *)labelString withFontSize:(CGFloat)fontsize withWidth:(CGFloat)width withHeight:(CGFloat)height;

+ (CGFloat)heightForLabelWithString:(NSString *)labelString withFontSize:(CGFloat)fontsize withWidth:(CGFloat)width withHeight:(CGFloat)height;

+ (id)getUsedData:(NSDictionary *)dictionary key:(NSString *)key oldValue:(id)oldValue;

+ (NSString *)correspondVersion;
//删除字符串最后的换行符
+ (NSString *)removeReturnSuffix:(NSString *)string;

@end
