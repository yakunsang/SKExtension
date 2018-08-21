//
//  UIView+SKLayout.h
//  SKExtension
//
//  Created by syk on 2018/8/21.
//  Copyright © 2018年 CFsyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SKLayout)
// 高度
@property (nonatomic, assign) CGFloat sk_height;
// 宽度
@property (nonatomic, assign) CGFloat sk_width;
// x
@property (nonatomic, assign) CGFloat sk_x;
// y
@property (nonatomic, assign) CGFloat sk_y;
// size
@property (nonatomic, assign) CGSize sk_size;
// origin
@property (nonatomic, assign) CGPoint sk_origin;

@end
