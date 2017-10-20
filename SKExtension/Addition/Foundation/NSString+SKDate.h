//
//  NSString+SKDate.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SKDate)

// 按默认时间格式转成NSDate, @see KDefaultTimeFormat
- (NSDate *)sk_formatToTime;

// 按默认时间格式转成NSDate, @see kDefaultDateFormat
- (NSDate *)sk_formatToDate;

// 按默认日期+时间格式转成NSDate
- (NSDate *)sk_formatToDateTime;

// 按指定格式转成NSDate
- (NSDate *)sk_dateFormat:(NSString *)format;

@end
