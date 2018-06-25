//
//  NSString+SKURL.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SKURL)

// 将URL中的"特殊字符"转成"%3A%2E%2F"
+ (NSString *)sk_encodeURLString:(NSString *)url;

// 将URL中的"%3A%2E%2F"转成正常字符
+ (NSString *)sk_decodeURLString:(NSString *)url;

@end
