//
//  Define.h
//  Encryption
//
//  Created by 雷传营 on 16/1/10.
//  Copyright © 2016年 leichuanying. All rights reserved.
//

#define ENCRYPT_KEY     @"MfsKyo8IEMb"
#define RSA_Test_secret      @"lXOjdiMhPZjxDGF2eUzv7yD6zEFTLjyclrmPNTdMyEYCQC45d4ruo4QbV9jMN5lKfTxz3dxPIPaT06KxqU5CQVZqkX4Ttrw/anZencm4WnVUs96GIgpI3uY7ohOaG36Ak3cGvkQF6DvCO88MPrdS38DxUa2OSG4G5DVl4c74M4g="
#define RSA_Public_key         @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCcOxsV/kRQ475o2P6b4UoKTtFlizBI8eeqoVT4ytCUiBDN/U9ZDZqZWP1JqyRgRK0miIJrsX6QaWkMzDKG6uzsxF/kFtf1I1s8NxTX6S+kVGdzAKwEwTNqRUQZYmQQsuaun1oDIW8N1yxYF605JleVQgudF0O98FFQL06zxv3VkwIDAQAB"
//私钥
#define RSA_Privite_key        @"MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAJw7GxX+RFDjvmjY/pvhSgpO0WWLMEjx56qhVPjK0JSIEM39T1kNmplY/UmrJGBErSaIgmuxfpBpaQzMMobq7OzEX+QW1/UjWzw3FNfpL6RUZ3MArATBM2pFRBliZBCy5q6fWgMhbw3XLFgXrTkmV5VCC50XQ73wUVAvTrPG/dWTAgMBAAECgYBCFw7iQuoLfgxytjkfIDL+IVGbr0IB2bOzDwSvKr0J2HWjbmE+vu6DqI2duHRu9R56io0Bmdh8ptr1uvw07vTCmywDvnudWEA/fx0KOZWDiPacdvsfesWioGB9zFdIa26wHAZwOdixl/gvaC9O9b/J3f7Z3daykKpmG8iMinQfAQJBAMg7SNsXx5F8uSwsGupiODp6D5Va0tf41vK0gtu/S1bhklnOt+q1EWDOk6FckPfEek1y2yJV9gw/FDXVAe34eaECQQDHvobSaqMQGZxsVw1hM3b5cPB/hlKLZv74jqT/OmPAMoIm08JKjWkCe7DiB+bjfw2ICWASQBs5KWd24kGSsIqzAkAhTVrstaPHmsrhgeRoHzXi4/I7kQOIUCbP7x3klohdRt8keLE2JC9jvnfnWpHx44fD4dp4d3uYxdUCrw7HGZCBAkEAq16AR1jsC60dcioBtao04e+OtqpkeWtlR5UCZGMRH911oqA9aj8Gn/XFHTeQVRA1aMg6X44WjSVDulCF17eVVwJAGENlEFuwFPKJ/IcCSu/F7mh/1ykbqAAcG/fc+2mtfm/5m7MYWv1xt8wQDK0Lhcc1l1da4+fKky9Dz6dnxei0mw=="






#ifdef DEBUG
#define CLog(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define CLog(format, ...)
#endif

/*
 *@bref  系统版本判断
 */
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)
#define kMainScreenWidth   ([UIScreen mainScreen].applicationFrame).size.width //应用程序的宽度
#define kMainScreenHeight   ([UIScreen mainScreen].applicationFrame).size.height //应用程序的高度
#define kMainBoundsHeight   ([UIScreen mainScreen].bounds).size.height //屏幕的高度
#define kMainBoundsWidth    ([UIScreen mainScreen].bounds).size.width //屏幕的宽度
#define kViewSizeWidth      (self.view.frame.size.width)
#define kViewSizeHeight     (self.view.frame.size.height)
#define kVersion                        [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"]
#define kIsIOS7                         ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
#define kIsIOS8                         ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
#define kIsIphone6P                     ([[UIScreen mainScreen] bounds].size.height == 736)
#define kIsIphone6                      ([[UIScreen mainScreen] bounds].size.height == 667)
#define kIsIphone5                      ([[UIScreen mainScreen] bounds].size.height == 568)
#define kIsIphone4                      ([[UIScreen mainScreen] bounds].size.height == 480)
#define kIsSimulator                    (NSNotFound != [[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location)   // 是否模拟器

#define RGBA(r,g,b,a)               [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:a]
#define RGB(r, g, b) [UIColor colorWithRed:(float)r/255.0f green:(float)g/255.0f blue:(float)b/255.0f alpha:1.0f]

#define kColorNavBg                     RGBA(255, 111, 90, 1)
#define kColorViewControllerBg          RGBA(242, 242, 242, 1.f)
#define kColorGrayText                  RGBA(153, 153, 153, 1.f)
#define kColorGrayLine                  RGBA(238, 238, 238, 1.f)
#define kColorSeparateLine              RGBA(216, 216, 216, 1.f)
#define kColorRandom                    RGB((float)(rand() % 255), (float)(rand() % 255), (float)(rand() % 255))

#define kViewControllerHeadHeight (kIsIOS7 ? 64 : 44)

#define kUserDefaultSendGifCount            @"kUserDefaultSendGifCount"
#define kUserDefaultLaunchCount             @"kUserDefaultLaunchCount"
#define kUserDefaultShareList               @"kUserDefaultShareList"

#define kNotificationDownloadProgress       @"kNotificationDownloadProgress"
#define kNotificationDownloadDone           @"kNotificationDownloadDone"
#define kNotificationDownloadFail           @"kNotificationDownloadFail"
#define kNotificationGifRemove              @"kNotificationGifRemove"
#define kNotificationShareToWX              @"kNotificationShareToWX"
#define kNotificationShareSuccess           @"kNotificationShareSuccess"
#define kNotificationLaunchFromKeyboard     @"kNotificationLaunchFromKeyboard"
#define kNotificationGifSortList            @"kNotificationGifSortList"
#define kNotificationShowGuide              @"kNotificationShowGuide"
#define kNotificationFirstIn                @"kNotificationFirstIn"
#define kNotificationFirstInFinished        @"kNotificationFirstInFinished"


