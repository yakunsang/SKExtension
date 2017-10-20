//
//  NSString+SKDate.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "NSString+SKDate.h"
#import "NSDate+SKFoundation.h"

static NSDateFormatter *fmt = nil;

@implementation NSString (SKDate)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
		fmt = [[NSDateFormatter alloc] init];
		fmt.locale = [NSLocale currentLocale];
    });
}

- (NSDate *)sk_formatToTime {
	return [self sk_dateFormat:kDefaultTimeFormat];
}

- (NSDate *)sk_formatToDate {
	return [self sk_dateFormat:kDefaultDateFormat];
}

- (NSDate *)sk_formatToDateTime {
	return [self sk_dateFormat:kDefaultDateTimeFormat];
}

- (NSDate *)sk_dateFormat:(NSString *)format {
	fmt.dateFormat = format;

	return [fmt dateFromString:self];
}
@end
