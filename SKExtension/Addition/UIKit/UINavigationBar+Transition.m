//
//  UINavigationBar+Transition.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/23.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "UINavigationBar+Transition.h"

@implementation UINavigationBar (Transition)
static char overlayKey;

- (void)sk_setBackgroundColor:(UIColor *)backgroundColor {
	if (self.overlay) {
		[self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
		self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20)];
		self.overlay.userInteractionEnabled = NO;
		self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
		[self insertSubview:self.overlay atIndex:0];
	}
	
	self.overlay.backgroundColor = backgroundColor;
}

- (void)sk_reset {
	[self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
	
	[self.overlay removeFromSuperview];
	self.overlay = nil;
}

#pragma mark -
- (UIView *)overlay {
	return objc_getAssociatedObject(self, &overlayKey);
}

- (void)setOverlay:(UIView *)overlay {
	objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
