//
//  NSString+SKURL.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "NSString+SKURL.h"

@implementation NSString (SKURL)

+ (NSString *)sk_encodeURLString:(NSString *)url {
	return [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

+ (NSString *)sk_decodeURLString:(NSString *)url {
	return url.stringByRemovingPercentEncoding;
}

@end
