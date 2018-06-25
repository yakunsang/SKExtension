//
//  UIImage+SKFoundation.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/23.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "UIImage+SKFoundation.h"

@implementation UIImage (SKFoundation)

- (UIImage *)sk_resizableFromCenter {
	CGPoint center = CGPointMake(self.size.width/2.0f, self.size.height/2.0f);
	
	return [self resizableImageWithCapInsets:UIEdgeInsetsMake(center.y, center.x, center.y, center.x) resizingMode:UIImageResizingModeStretch];
}

+ (UIImage *)sk_imageWithColor:(UIColor *)color {
	CGRect rect = CGRectMake(0, 0, 1, 1);
	UIGraphicsBeginImageContext(rect.size);
	CGContextRef content = UIGraphicsGetCurrentContext();
	
	CGContextSetFillColorWithColor(content, [color CGColor]);
	CGContextFillRect(content, rect);
	
	UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return image;
}

- (UIImage *)sk_tintColor:(UIColor *)color {
	UIGraphicsBeginImageContextWithOptions(self.size, NO, self.scale);
	
	CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
	[self drawInRect:rect];
	
	[color set];
	
	UIRectFillUsingBlendMode(rect, kCGBlendModeSourceAtop);
	UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return tintedImage;
}
@end
