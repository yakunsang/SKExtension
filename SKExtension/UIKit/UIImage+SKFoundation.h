//
//  UIImage+SKFoundation.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/23.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SKFoundation)

// 从图片中心点根据图片size拉伸图片
- (UIImage *)sk_resizableFromCenter;

// 根据颜色生产图片
+ (UIImage *)sk_imageWithColor:(UIColor *)color;

// 修改图片的前景色
- (UIImage *)sk_tintColor:(UIColor *)color;

@end
