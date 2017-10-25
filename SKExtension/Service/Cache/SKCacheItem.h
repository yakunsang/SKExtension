//
//  SKCacheItem.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/25.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKCacheItem : NSObject

@property (nonatomic, strong) id cacheData;           // 数据内容
@property (nonatomic, strong) NSDate *expiredDate;    // 超时时间
@property (nonatomic, assign) BOOL dirty;             // 如为ture,则该数据会被从内存删除.
@property (nonatomic, assign) BOOL isProtoBufData;    // 数据传输格式是否为protobuf,默认:NO
@property (nonatomic, assign) NSInteger expiredSeconds; // 过期时间

// 根据protobuf数据生成cacheItem对象
+ (instancetype)itemWithProtoBufData:(NSData *)data;

// 根据dict数据生成cacheItem对象
+ (instancetype)itemWithDictionary:(NSDictionary *)dic;

// 数据是否过期
- (BOOL)expired;

@end
