//
//  NSObject+SKSwizzled.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SKSwizzled)

// 是否包含某个属性
- (BOOL)sk_hasProperty:(NSString *)name;
+ (BOOL)sk_hasProperty:(NSString *)name;

// AOP
+ (void)sk_swizzledMethod:(SEL)originalSelector and:(SEL)swizzledSelector;

@end
