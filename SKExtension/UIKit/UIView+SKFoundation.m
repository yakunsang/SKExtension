//
//  UIView+SKFoundation.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/23.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "UIView+SKFoundation.h"

@implementation UIView (SKFoundation)
@dynamic cornerRadius;
@dynamic borderColor;
@dynamic borderWidth;

#pragma mark - setter/getter

- (UIViewController *)sk_viewController {
	UIResponder *responder = [self nextResponder];
	
	while (responder) {
		if ([responder isKindOfClass:[UIViewController class]]) {
			return (UIViewController *)responder;
		}
		
		responder = [responder nextResponder];
	}
	
	return nil;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
	self.layer.cornerRadius = cornerRadius;
	self.layer.masksToBounds = YES;
}

- (void)setBorderColor:(UIColor *)borderColor {
	self.layer.borderColor = borderColor.CGColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
	self.layer.borderWidth = borderWidth;
}

#pragma mark -
- (void)sk_setRoundedCorners:(CGFloat)radius {
	[self layoutIfNeeded];
	
	UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
												   byRoundingCorners:radius
														 cornerRadii:CGSizeMake(radius, radius)];
	
	CAShapeLayer *maskLayer = [CAShapeLayer layer];
	maskLayer.frame = self.bounds;
	maskLayer.path = maskPath.CGPath;
	self.layer.mask = maskLayer;
}

@end
