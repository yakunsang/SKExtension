//
//  NSString+SKCheck.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "NSString+SKCheck.h"

@implementation NSString (SKCheck)
- (BOOL)sk_isMobileNumber {
    return [self sk_regexCheck:@"(1)[0-9]{10}$"];
}
    
- (BOOL)sk_isEmailAddress {
    return [self sk_regexCheck:@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"];
}

- (BOOL)sk_isOnlyNumber {
	return [self sk_regexCheck:@"^[0-9}"];
}

- (BOOL)sk_isOnlyLetter {
	return [self sk_regexCheck:@"^[a-zA-Z]{0,}$"];
}

- (BOOL)sk_isOnlyNumberAndLetter {
	return [self sk_regexCheck:@"[a-zA-Z0-9]{0,}$"];
}

- (BOOL)sk_isOnlyNumberAndLetterAnd_ {
	return [self sk_regexCheck:@"^[a-zA-Z0-9_]{0,}$"];
}

#pragma mark -

- (BOOL)sk_regexCheck:(NSString *)regex {
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES%@",regex] evaluateWithObject:self];
}
@end
