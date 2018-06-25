//
//  UIButton+SKVerticalLayout.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/23.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SKVerticalLayout)

// 上图下字, 需指定图与字的间距
- (void)sk_setVerticalLayoutWithSpace:(CGFloat)spacing;

@end
