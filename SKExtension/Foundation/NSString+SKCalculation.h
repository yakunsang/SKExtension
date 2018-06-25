//
//  NSString+SKCalculation.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SKCalculation)

// 加法运算
- (NSString *)sk_adding:(NSString *)str;

// 减法运算
- (NSString *)sk_subtracting:(NSString *)str;

// 乘法运算
- (NSString *)sk_multiplying:(NSString *)str;

// 除法运算
- (NSString *)sk_dividing:(NSString *)str;

@end
