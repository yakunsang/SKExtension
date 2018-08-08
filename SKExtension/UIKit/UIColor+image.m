//
//  UIColor+image.m
//  SKExtension
//
//  Created by syk on 2018/8/8.
//  Copyright © 2018年 CFsyk. All rights reserved.
//

#import "UIColor+image.h"

@implementation UIColor (image)

+ (UIImage *)createImageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndPDFContext();
    
    return image;
}

@end
