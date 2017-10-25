//
//  UINavigationBar+Transition.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/23.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (Transition)

// 设置背景色
- (void)sk_setBackgroundColor:(UIColor *)backgroundColor;

// 恢复初始状态
- (void)sk_reset;

@end
