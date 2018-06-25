//
//  NSTimer+SKFoundation.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "NSTimer+SKFoundation.h"

@implementation NSTimer (SKFoundation)

- (void)sk_pause {
	if (![self isValid]) {
		return;
	}
	
	[self setFireDate:[NSDate distantFuture]];
}

- (void)sk_resume {
	if (![self isValid]) {
		return;
	}
	
	[self setFireDate:[NSDate date]];
}
@end
