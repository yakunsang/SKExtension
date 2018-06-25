//
//  NSObject+SKSwizzled.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "NSObject+SKSwizzled.h"


@implementation NSObject (SKSwizzled)

- (BOOL)sk_hasProperty:(NSString *)name {
	return [[self class] sk_hasProperty:name];
}

+ (BOOL)sk_hasProperty:(NSString *)name {
	return (class_getProperty(self, name.UTF8String) != NULL);
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
@end
