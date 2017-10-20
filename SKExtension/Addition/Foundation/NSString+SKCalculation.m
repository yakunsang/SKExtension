//
//  NSString+SKCalculation.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "NSString+SKCalculation.h"

@implementation NSString (SKCalculation)
- (NSString *)sk_adding:(NSString *)str {
	NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:self];
	NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:str];
	
	return [[num1 decimalNumberByAdding:num2] stringValue];
}

- (NSString *)sk_subtracting:(NSString *)str {
	NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:self];
	NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:str];
	
	return [[num1 decimalNumberBySubtracting:num2] stringValue];
}

- (NSString *)sk_multiplying:(NSString *)str {
	NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:self];
	NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:str];
	
	return [[num1 decimalNumberByMultiplyingBy:num2] stringValue];
}

- (NSString *)sk_dividing:(NSString *)str {
	NSDecimalNumber *num1 = [NSDecimalNumber decimalNumberWithString:self];
	NSDecimalNumber *num2 = [NSDecimalNumber decimalNumberWithString:str];
	
	return [[num1 decimalNumberByDividingBy:num2] stringValue];
}

@end
