//
//  UIButton+SKClickInterval.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/23.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "UIButton+SKClickInterval.h"

#define kDefaultClickInterval 0.5f

@implementation UIButton (SKClickInterval)

+ (void)load {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		[self sk_swizzledMethod:@selector(sendAction:to:forEvent:) and:@selector(swizzled_sendAction:to:forEvent:)];
	});
}

+ (void)sk_swizzledMethod:(SEL)originalSelector and:(SEL)swizzledSelector {
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
}

- (void)swizzled_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
	static BOOL ignoreEvent = NO;
	
	//相机点击事件会进行2次此方法,所以不拦截
	if (![@"cameraShutterPressed:" isEqualToString:NSStringFromSelector(action)]) {
		if (ignoreEvent) {
			return;
		}
		
		ignoreEvent = YES;
		
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kDefaultClickInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
			ignoreEvent = NO;
		});
	}
	
	[self swizzled_sendAction:action to:target forEvent:event];
}
@end
