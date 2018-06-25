//
//  NSDate+SKFoundation.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "NSDate+SKFoundation.h"
#import "NSString+SKDate.h"

#define kSecondOfDay (24 * 60 * 60)
static NSDateFormatter *fmt = nil;
static NSCalendar *calendar = nil;

@implementation NSDate (SKFoundation)

+ (void)load {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		fmt = [[NSDateFormatter alloc] init];
		fmt.locale = [NSLocale currentLocale];
	
		calendar = [NSCalendar currentCalendar];
	});
}

- (NSString *)sk_formatToString:(NSString *)format {
	[fmt setDateFormat:format];

	return [fmt stringFromDate:self];
}

- (NSString *)sk_formatToDateTimeString {
	return [self sk_formatToString:kDefaultDateTimeFormat];
}

- (NSString *)sk_formatToDateString {
	return [self sk_formatToString:kDefaultDateFormat];
}

- (NSString *)sk_formatToTimeString {
	return [self sk_formatToString:kDefaultTimeFormat];
}

- (BOOL)sk_isToday {
	return  [calendar isDateInToday:self];
}

- (BOOL)sk_isTomorrow {
	return [calendar isDateInTomorrow:self];
}

- (BOOL)sk_isYesterday {
	return [calendar isDateInYesterday:self];
}

- (BOOL)sk_isDate:(NSDate *)date {
	return [calendar isDate:self inSameDayAsDate:date];
}

+ (NSInteger)sk_secondBetween:(NSInteger)from to:(NSInteger)to {
	NSDate *formDate = [self sk_dateWithTimeStamp:from];
	NSDate *toDate = [self sk_dateWithTimeStamp:to];

	unsigned unitFlags = NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;

	NSDateComponents *components = [calendar components:unitFlags fromDate:formDate toDate:toDate options:0];
	NSInteger second = (components.day * kSecondOfDay) + (components.hour * 60 * 60) + (components.minute * 60) + components.second;

	return second;
}

+ (NSDate *)sk_dateWithTimeStamp:(NSTimeInterval)timeStamp {
	return [calendar dateFromComponents:[self sk_dateComponentWithTimeStamp:timeStamp]];
}

+ (NSDateComponents *)sk_dateComponentWithTimeStamp:(NSTimeInterval)timeStamp {
	NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeStamp / 1000];
	
	NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour |
	NSCalendarUnitMinute | NSCalendarUnitSecond ;
	
	return [calendar components:unitFlags fromDate:date];
}

+ (NSDate *)sk_dateByAddingDay:(NSInteger)day {
	NSDate *date = [NSDate date];
	
	NSDateComponents *components = [[NSDateComponents alloc] init];
	[components setDay:day];
	
	return [calendar dateByAddingComponents:components toDate:date options:0];
}

+ (NSDate *)sk_dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day {
	NSCalendar *calendar = [NSCalendar currentCalendar];
	
	NSDateComponents *components = [[NSDateComponents alloc] init];
	[components setYear:year];
	[components setMonth:month];
	[components setDay:day];
	
	return [calendar dateFromComponents:components];
}

@end
