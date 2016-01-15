//
//  Define.h
//  Encryption
//
//  Created by 雷传营 on 16/1/10.
//  Copyright © 2016年 leichuanying. All rights reserved.
//

#define ENCRYPT_KEY     @"MfsKyo8IEMb"
#define RSA_Test_secret      @"lXOjdiMhPZjxDGF2eUzv7yD6zEFTLjyclrmPNTdMyEYCQC45d4ruo4QbV9jMN5lKfTxz3dxPIPaT06KxqU5CQVZqkX4Ttrw/anZencm4WnVUs96GIgpI3uY7ohOaG36Ak3cGvkQF6DvCO88MPrdS38DxUa2OSG4G5DVl4c74M4g="
#define RSA_Public_key         @"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCxuWhp6EgQfrrSBtxlBwbU35lhjC67X0Y1KrhqolIfYo3/yWV1eryYVUhk5xeHsbKg9RHD9TpIZRUWIW5a8MrMBcgr1A/dgIHi2EM28drH4JRTmkTLVHReggFbb046k0ISpLW3XVW0jHB3/z3S1c/NT9V63SQK6WJ65/YP5xISNQIDAQAB"
//私钥
#define RSA_Privite_key        @"MIICdwIBADANBgkqhkiG9w0BAQEFAASCAmEwggJdAgEAAoGBALG5aGnoSBB+utIG3GUHBtTfmWGMLrtfRjUquGqiUh9ijf/JZXV6vJhVSGTnF4exsqD1EcP1OkhlFRYhblrwyswFyCvUD92AgeLYQzbx2sfglFOaRMtUdF6CAVtvTjqTQhKktbddVbSMcHf/PdLVz81P1XrdJArpYnrn9g/nEhI1AgMBAAECgYBEbsMAvLs69sFS6+djU1BTGYIC6Kp55ZawFDIMhVIf2aAZ1N+nW8pQ0c3dZIpP6qGAjrz3em6lv55d9iN7Cura/g57Rk4S3SRo5u4hWUd16NeIVP+HfreKIgZ6jwKQTfXt2KzDuIAHudvwT2UJBePgIIDQoKMEq4khtFiRGS1UgQJBAN/KpSOiRiGup8h/Iqespwfxyrqn5/4iyw1tpJCWzHddP7nJGpYmOL+ELWs/pReYclAOqH9ZIzOT2K8ZLt6yBOECQQDLTXZowK8wFgMudAE5TStC/zl3TAKMu/Gu5wlXSMoa+nwSy/FSIQZyypGeHR2X8QhbZ1Qz+uBCJm7gEGOWMWPVAkEAp5ajsFm3V0XqE/VRSGu88fAaN0nCK8h2cunm0Ph8ye6k6EY3iLW6zYD4WlZhFZhuEpHHkQZ5nAhdvlKHjPGXQQJAYOtF1rx9B/SGgb/F0ZZrWF4p/ChdUtBKcHIt7tGBoAjn22IkYl3iIBlYAEOrFwNOU5zX9IvWG1MNKn5Fq5VSHQJBAJG5xSY0IKzXWDsGnPIa9XlSTv1zl7RCGNDo7O1zh+5J/kjDpU9M2fIXEtzvGYHiOffz9FBh5ka69JJNFWoWAiw="






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


