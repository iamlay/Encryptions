//
//  ImageUtil.h
//  ImageProcessing
//
//  Created by Evangel on 10-11-23.
//  Copyright 2010 . All rights reserved.
//

#import <Foundation/Foundation.h>
#include <OpenGLES/ES1/gl.h>
#include <OpenGLES/ES1/glext.h>
#import <UIKit/UIKit.h>


@interface ImageUtil : NSObject


//按指定宽度缩放
+ (UIImage *)imageWithImage:(UIImage *)image scaledToWidth:(CGFloat)width;
//按指定大小缩放
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
+ (UIImage *)rotateImage:(UIImage *)src degrees:(CGFloat)degrees;
+ (CGFloat)degreesToRadians:(CGFloat)degrees;

+ (void)saveImageToDisk:(UIImage *)image imageName:(NSString *)name;

+ (UIImage *)colorizeImage:(UIImage *)inImage color:(UIColor *)theColor;
+ (UIImage *)addImage:(UIImage *)image1 toImage:(UIImage *)image2;
+ (UIImage *)blackWhite:(UIImage *)inImage;
+ (UIImage *)grayImage : (UIImage *) inImage;
+ (UIImage *)cartoon:(UIImage *)inImage;
+ (UIImage *)memory:(UIImage *)inImage;
+ (UIImage *)bopo:(UIImage *)inImage;
+ (UIImage *)scanLine:(UIImage *)inImage;
+ (UIImage *)sepia:(UIImage *)inImage;

CGContextRef CreateRGBABitmapContext (CGImageRef inImage);
void ProviderReleaseData(void *info,const void *data, size_t size);
unsigned char *RequestImagePixelData(UIImage *inImage);

+ (NSString *)saveAlbumImageToDisk:(NSURL *)assetURL;

@end
