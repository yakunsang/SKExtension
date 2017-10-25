//
//  UIView+SKFoundation.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/23.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <UIKit/UIKit.h>

//IB_DESIGNABLE
@interface UIView (SKFoundation)

// 获取视图所在的viewcontroller
@property (nonatomic, weak, readonly)UIViewController *sk_viewController;

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, strong) IBInspectable UIColor *borderColor;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

// 设置边界圆角,使用于列表
- (void)sk_setRoundedCorners:(CGFloat)radius;
@end
