//
//  NSBundle+SKLanguage.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "NSBundle+SKLanguage.h"

static const char kBundleKey = 0;

@interface SKBundle : NSBundle

@end

@implementation SKBundle

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName {
	NSBundle *bundle = objc_getAssociatedObject(self, &kBundleKey);
	
	if (bundle) {
		return [bundle localizedStringForKey:key value:value table:tableName];
	} else {
		return [super localizedStringForKey:key value:value table:tableName];
	}
}

@end

@implementation NSBundle (SKLanguage)

+ (void)sk_setLanguage:(NSString *)language {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		object_setClass([NSBundle mainBundle], [SKBundle class]);
	});
	
	id value = language ? [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:language ofType:@"lproj"]] : nil;
	objc_setAssociatedObject([NSBundle mainBundle], &kBundleKey, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
