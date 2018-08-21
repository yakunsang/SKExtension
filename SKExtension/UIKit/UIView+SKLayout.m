//
//  UIView+SKLayout.m
//  SKExtension
//
//  Created by syk on 2018/8/21.
//  Copyright © 2018年 CFsyk. All rights reserved.
//

#import "UIView+SKLayout.h"

@implementation UIView (SKLayout)

- (void)setSk_x:(CGFloat)sk_x {
    CGRect frame = self.frame;
    frame.origin.x = sk_x;
    self.frame = frame;
}

- (CGFloat)sk_x {
    return self.frame.origin.x;
}

- (void)setSk_y:(CGFloat)sk_y {
    CGRect frame = self.frame;
    frame.origin.y = sk_y;
    self.frame = frame;
}

- (CGFloat)sk_y {
    return self.frame.origin.y;
}

- (void)setSk_width:(CGFloat)sk_width {
    CGRect frame = self.frame;
    frame.size.width = sk_width;
    self.frame = frame;
}

- (CGFloat)sk_width {
    return self.frame.size.width;
}

- (void)setSk_height:(CGFloat)sk_height {
    CGRect frame = self.frame;
    frame.size.height = sk_height;
    self.frame = frame;
}

- (void)setSk_size:(CGSize)sk_size {
    CGRect frame = self.frame;
    frame.size = sk_size;
    self.frame = frame;
}

- (CGSize)sk_size {
    return self.frame.size;
}

- (void)setSk_origin:(CGPoint)sk_origin {
    CGRect frame = self.frame;
    frame.origin = sk_origin;
    self.frame = frame;
}

- (CGPoint)sk_origin {
    return self.frame.origin;
}
@end
