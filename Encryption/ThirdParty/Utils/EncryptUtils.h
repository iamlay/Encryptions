//
//  EncryptUtils.h
//  TogetherInvest
//
//  Created by Hope on 3/10/15.

//

#import <Foundation/Foundation.h>

@interface EncryptUtils : NSObject

+ (NSString*)getSysTimeStamp;
+ (NSString *)md5:(NSString *)str;

@end
