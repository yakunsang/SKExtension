//
//  NSDate+SKFoundation.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDefaultTimeFormat @"HH:mm"
#define kDefaultDateFormat @"yyyy-MM-dd"
#define kDefaultDateTimeFormat @"yyyy-MM-dd HH:mm"

@interface NSDate (SKFoundation)

// 按指定格式转成NSString
- (NSString *)sk_formatToString:(NSString *)format;

// 按默认日期+时间格式转成NSString, @see kDefaultDateTimeFormat
- (NSString *)sk_formatToDateTimeString;

// 按默认日期格式转成NSString, @see kDefaultDateFormat
- (NSString *)sk_formatToDateString;

// 按默认时间格式转成NSString @see kDefaultTimeFormat
- (NSString *)sk_formatToTimeString;

// 判断是否是/今天/明/昨/某天
- (BOOL)sk_isToday;
- (BOOL)sk_isTomorrow;
- (BOOL)sk_isYesterday;
- (BOOL)sk_isDate:(NSDate *)date;

// 根据两个timestamp时间相差多少岁秒(同一天)
+ (NSInteger)sk_secondBetween:(NSInteger)from to:(NSInteger)to;

// 根据NSTimeInterval获取NSDate
+ (NSDate *)sk_dateWithTimeStamp:(NSTimeInterval)timeStamp;

// 根据NSTimeInterval获取NSDateComponent
+ (NSDateComponents *)sk_dateComponentWithTimeStamp:(NSTimeInterval)timeStamp;

// 在当前日期上添加day
+ (NSDate *)sk_dateByAddingDay:(NSInteger)day;

// 根据年月日生产日期
+ (NSDate *)sk_dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

@end
