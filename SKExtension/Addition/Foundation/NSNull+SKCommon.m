
//
//  NSNull+SKCommon.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "NSNull+SKCommon.h"

@implementation NSNull (SKCommon)

- (void)forwardInvocation:(NSInvocation *)anInvocation {
	if ([self respondsToSelector:[anInvocation selector]]) {
		[anInvocation invokeWithTarget:self];
	}
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
	NSMethodSignature *sig = [[NSNull class] instanceMethodSignatureForSelector:aSelector];
	if (sig == nil) {
		sig = [NSMethodSignature signatureWithObjCTypes:"@^v^c"];
	}
	return sig;
}
@end
