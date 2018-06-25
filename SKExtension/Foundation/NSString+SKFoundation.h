//
//  NSString+SKFoundation.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (SKFoundation)
// 格式化手机号(在第3位和第7位后加入空格)
- (NSString *)sk_formateMobileNumber;

// md5
- (NSString *)sk_md5;

// 返回去掉首尾空格和新行的字符串
- (NSString *)sk_stringByTrimmingWhitespeaceAndNewLine;

// 根据"\n"判断有几行
- (NSInteger)sk_numberOfLines;

// 判断字符是否是空字符串
+ (BOOL)sk_isEmpty:(NSString *)str;

// 给字符串添加固定的行间距,系统字体.
- (NSAttributedString *)sk_addLineSpacingWithFontSize:(CGFloat )fontSize;

// 给字符串添加行间距
- (NSAttributedString *)sk_addLineSpacingForString:(NSInteger)lineSpaceing font:(UIFont *)font;

// 给字符串添加字间距
- (NSAttributedString *)sk_addWordSpacingForString:(NSInteger)wordSpaceing font:(UIFont *)font;

// 给字符串添加下划线
- (NSMutableAttributedString *)sk_underLineString;

// 给字符串添加删除线
- (NSMutableAttributedString *)sk_strikethroughString;

// base64处理方法
- (NSString *)sk_encodeToBase64;
+ (NSString *)sk_encodeToBase64:(NSString *)string;
- (NSString *)sk_decodeBase64;
+ (NSString *)sk_decodeBase64:(NSString *)string;
@end
