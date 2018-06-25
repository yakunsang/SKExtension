//
//  NSString+SKCheck.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SKCheck)
// 是否为手机号 (1开头的11位数字)
- (BOOL)sk_isMobileNumber;

// 是否为邮箱地址
- (BOOL)sk_isEmailAddress;
    
// 是否仅包含数字
- (BOOL)sk_isOnlyNumber;

// 是否仅包含字母
- (BOOL)sk_isOnlyLetter;

// 是否仅包含字母和数字
- (BOOL)sk_isOnlyNumberAndLetter;
    
// 是否仅包含字母, 数字, 下划线
- (BOOL)sk_isOnlyNumberAndLetterAnd_;
    
// 判断字符串是否符合传入的正则表达式
- (BOOL)sk_regexCheck:(NSString *)regex;

@end
