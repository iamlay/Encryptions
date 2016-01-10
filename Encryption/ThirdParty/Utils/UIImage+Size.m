//
//  UIImage+Size.m
//  TogetherInvest
//
//  Created by Hope on 3/11/15.

//

#import "UIImage+Size.h"

@implementation UIImage (SIZE)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    
    @autoreleasepool {
        
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        
        UIGraphicsBeginImageContext(rect.size);
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        CGContextSetFillColorWithColor(context,
                                       
                                       color.CGColor);
        
        CGContextFillRect(context, rect);
        
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        
        UIGraphicsEndImageContext();
        
        return img;
        
    }
    
}

@end
