//
//  Define.h
//  Encryption
//
//  Created by 雷传营 on 16/1/10.
//  Copyright © 2016年 leichuanying. All rights reserved.
//

#define ENCRYPT_KEY     @"MfsKyo8IEMb"
#define RSA_Test_secret      @"lXOjdiMhPZjxDGF2eUzv7yD6zEFTLjyclrmPNTdMyEYCQC45d4ruo4QbV9jMN5lKfTxz3dxPIPaT06KxqU5CQVZqkX4Ttrw/anZencm4WnVUs96GIgpI3uY7ohOaG36Ak3cGvkQF6DvCO88MPrdS38DxUa2OSG4G5DVl4c74M4g="
#define RSA_Public_key         @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCeScUz3X3lsRyJLre8RRdw+evjhFjlqo7dNnBtlCF40PAzczkKyVmzWk4c0fac/xUZKUlNx+qI9o0JC1zYFRlUK4GUzWlGOlbSltCdbon70czzGF3gRYs/X+REtFlARobZoqO2v/5PTg73nUyZvkcNx4nmNdq/x53+RhOWK3kB6wIDAQAB"
//私钥
#define RSA_Privite_key        @"MIICdQIBADANBgkqhkiG9w0BAQEFAASCAl8wggJbAgEAAoGBALRcVEz+aEbA/VDuEfMl+wDrdyEiwf61W1T2FAYCPvevQhsliRNckcdx2B4A3y9v0Xr0tY2jHfvWdkYQd4hyhdj/sZfzoq1SkKCuwE4TYGgxRazWmCfjBUeJeNKy55cF/QWkU2emFN4V2YKtuJgr891GwpYAvQf0Sl5ZxZ4+0HaBAgMBAAECgYB02gzUBU/R5183e8atXcINioCYO0ismRsfJH88lV/uYOHXbK4umR7ptNxsM+xlc3Co1Lp7lV7rtrrSEgEfqfME2FZD8GxI/J5CXyyDUk/wig7QJ/H2BJxPJlLg2DiNhtLgEn8YEZa0Q9iw9xbpgezjJgjN6kgf3p7ktBEsS0pZAQJBAO5YCSIzDaLZqAu5hb8LzJ2qUXvUem6zO4z7adFJRLKcYJVAs5Hq5N6QFFp1KRVeZmpn4rZJSyep1viDna7D+OkCQQDBuLJyUWWbjsAfWvvA6KrzeaDRhuQvHYWXbZ5B3DgKyJIecMSFtpyRYanYzIjQ2QJPiVezXz/VY5DKr2sC8xHZAkBdPlW8amqwRiSHCbp4Rj5zhBlCr5qCSl5GxmjcdqSIl8L1QQ2/TTzikU1VIjbDZF3+zMuV8tCTIM+4A42hvItZAkBfS6tEvzPbnRJ3mjtD/3CxCwEIcXHol34zKrJyNZHABECVBuY13MoSXle+FYesLUSMucRRsaZmI2+DtV1P+yCpAkBEwLltbSXpRauTu0JN48SLa8Rom6BjYl/3PNAXRXtM5Ns0GaJ6v0sOYq6OCWKn1D/6ZKqNYbrEyXWg8yodbdIw"






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


