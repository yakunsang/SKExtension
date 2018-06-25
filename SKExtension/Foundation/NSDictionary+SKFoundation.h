//
//  NSDictionary+SKFoundation.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (SKFoundation)

// 写入文件
- (BOOL)sk_writeToCacheFile:(NSString *)path;

// 从文件中读取
+ (NSDictionary *)sk_readFromCacheFile:(NSString *)path;

// 转成 url params
- (NSString *)sk_toURLParams;

// 转成 json
- (NSString *)sk_toJSON;

@end
