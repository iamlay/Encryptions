//
//  NSString+NSReplace.h
//  DES
//
//  Created by Toni on 12-12-27.
//  Copyright (c) 2012年 sinofreely. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (NSReplace)
+ (NSString *)sourceStr:(NSString *)destStr replaceStr:(NSString *)sStr fromSrcStr:(NSString *)srcStr;
+ (NSString *)trim:(NSString *)textStr;
@end
