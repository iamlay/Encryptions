//
//  LSHelper.m
//  LaShouGroup
//
//  Created by  on 14-5-6.
//  Copyright (c) 2014年 . All rights reserved.
//

#import "LSHelper.h"
#import "sys/utsname.h"

@implementation LSHelper

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
    [alertView show];
}

+ (CGSize)sizeForLabelWithString:(NSString *)labelString withFontSize:(CGFloat)fontsize constrainedToSize:(CGSize)maxLabelSize{
    if(labelString.length == 0){
        return CGSizeZero;
    }
    
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        CGSize expectedLabelSize = [labelString sizeWithFont:
                                    [UIFont systemFontOfSize:fontsize]
                                           constrainedToSize:maxLabelSize
                                               lineBreakMode:0];
        
        return expectedLabelSize;
    } else {
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:fontsize],NSFontAttributeName,nil];
        CGSize actualsize = [labelString boundingRectWithSize:maxLabelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:tdic context:nil].size;
        //得到的宽度为0，返回最大宽度
        if(actualsize.width == 0){
            
        }
        
        return actualsize;
    }
}

+ (CGFloat)widthForLabelWithString:(NSString *)labelString withFontSize:(CGFloat)fontsize withWidth:(CGFloat)width withHeight:(CGFloat)height
{
    if(labelString.length == 0){
        return 0.0;
    }
    
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        CGSize maximumLabelSize = CGSizeMake(width,height);
        CGSize expectedLabelSize = [labelString sizeWithFont:[UIFont systemFontOfSize:fontsize]
                                           constrainedToSize:maximumLabelSize
                                               lineBreakMode:0];
        
        return (expectedLabelSize.width);
    } else {
        CGSize size = CGSizeMake(width, height);
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:fontsize],NSFontAttributeName,nil];
        CGSize actualsize = [labelString boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:tdic context:nil].size;
        
        //得到的宽度为0，返回最大宽度
        if(actualsize.width == 0){
            return width;
        }
        
        return actualsize.width;
    }
}

+ (CGFloat)heightForLabelWithString:(NSString *)labelString withFontSize:(CGFloat)fontsize withWidth:(CGFloat)width withHeight:(CGFloat)height {
    
    if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
        CGSize maximumLabelSize = CGSizeMake(width, height);
        CGSize expectedLabelSize = [labelString sizeWithFont:[UIFont systemFontOfSize:fontsize]
                                           constrainedToSize:maximumLabelSize
                                               lineBreakMode:0];
        
        return (int)(expectedLabelSize.height);
    } else {
        CGSize size = CGSizeMake(width, height);
        NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:fontsize],NSFontAttributeName,nil];
        CGSize actualsize = [labelString boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:tdic context:nil].size;
        return actualsize.height;
    }
}

/**
 *	@brief	将json数据转换成id
 *
 *	@param data 数据
 *
 *	@return	 id类型的数据
 */
+ (id)parserJsonData:(id)jsonData{
    
    NSError *error;
    id jsonResult = nil;
    if (jsonData&&[jsonData isKindOfClass:[NSData class]])
    {
        jsonResult = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    }
    if (jsonResult != nil && error == nil)
    {
        return jsonResult;
    }
    else{
        // 解析错误
        return nil;
    }
}

//json获取数据去空操作
+ (id)getUsedData:(NSDictionary *)dictionary key:(NSString *)key oldValue:(id)oldValue {
    id value = nil;
    if ([dictionary objectForKey:key] && ![[dictionary objectForKey:key] isKindOfClass:[NSNull class]]) {
        value = [dictionary objectForKey:key];
        if ([[dictionary objectForKey:key] isKindOfClass:[NSString class]] &&
            ([[dictionary objectForKey:key] isEqualToString:@"(null)"] || [[dictionary objectForKey:key] isEqualToString:@""])) {
            value = nil;
        }
    }
    if (!value) {
        value = oldValue;
    }
    return value;
}

+ (NSString *)getDeviceVersionInfo
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithFormat:@"%s", systemInfo.machine];
    
    return platform;
}

+ (NSString *)correspondVersion
{
    NSString *correspondVersion = [LSHelper getDeviceVersionInfo];
    
    if ([correspondVersion isEqualToString:@"i386"])        return@"Simulator";
    if ([correspondVersion isEqualToString:@"x86_64"])       return @"Simulator";
    
    if ([correspondVersion isEqualToString:@"iPhone1,1"])   return@"iPhone 1";
    if ([correspondVersion isEqualToString:@"iPhone1,2"])   return@"iPhone 3";
    if ([correspondVersion isEqualToString:@"iPhone2,1"])   return@"iPhone 3S";
    if ([correspondVersion isEqualToString:@"iPhone3,1"] || [correspondVersion isEqualToString:@"iPhone3,2"])   return@"iPhone 4";
    if ([correspondVersion isEqualToString:@"iPhone4,1"])   return@"iPhone 4S";
    if ([correspondVersion isEqualToString:@"iPhone5,1"] || [correspondVersion isEqualToString:@"iPhone5,2"])   return @"iPhone 5";
    if ([correspondVersion isEqualToString:@"iPhone5,3"] || [correspondVersion isEqualToString:@"iPhone5,4"])   return @"iPhone 5C";
    if ([correspondVersion isEqualToString:@"iPhone6,1"] || [correspondVersion isEqualToString:@"iPhone6,2"])   return @"iPhone 5S";
    if ([correspondVersion isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([correspondVersion isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    
    if ([correspondVersion isEqualToString:@"iPod1,1"])     return@"iPod Touch 1";
    if ([correspondVersion isEqualToString:@"iPod2,1"])     return@"iPod Touch 2";
    if ([correspondVersion isEqualToString:@"iPod3,1"])     return@"iPod Touch 3";
    if ([correspondVersion isEqualToString:@"iPod4,1"])     return@"iPod Touch 4";
    if ([correspondVersion isEqualToString:@"iPod5,1"])     return@"iPod Touch 5";
    
    if ([correspondVersion isEqualToString:@"iPad1,1"])     return@"iPad 1";
    if ([correspondVersion isEqualToString:@"iPad2,1"] || [correspondVersion isEqualToString:@"iPad2,2"] || [correspondVersion isEqualToString:@"iPad2,3"] || [correspondVersion isEqualToString:@"iPad2,4"])     return@"iPad 2";
    if ([correspondVersion isEqualToString:@"iPad2,5"] || [correspondVersion isEqualToString:@"iPad2,6"] || [correspondVersion isEqualToString:@"iPad2,7"] )      return @"iPad Mini";
    if ([correspondVersion isEqualToString:@"iPad3,1"] || [correspondVersion isEqualToString:@"iPad3,2"] || [correspondVersion isEqualToString:@"iPad3,3"] || [correspondVersion isEqualToString:@"iPad3,4"] || [correspondVersion isEqualToString:@"iPad3,5"] || [correspondVersion isEqualToString:@"iPad3,6"])      return @"iPad 3";
    
    return correspondVersion;
}


+ (NSString *)removeReturnSuffix:(NSString *)string {
    if (string.length > 2) {
        NSString *suffix = [string substringFromIndex:string.length - 1];
        if ([suffix isEqualToString:@"\n"]) {
            return [string substringToIndex:string.length - 1];
        }
    }
    return string;
}

@end
