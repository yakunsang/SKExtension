//
//  SKCacheManager.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/24.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKCacheManager : NSObject

// 增加缓存数据, 并制定identifier等字段
+ (void)addItem:(id)item forKey:(NSString *)identifier withExpireTime:(NSInteger)seconds;
+ (void)addItem:(id)item forKey:(NSString *)identifier withExpireTime:(NSInteger)seconds isProtoBufData:(BOOL)isProtoBufData;

// 根据identifier 获取缓存数据
+ (id)getItem:(id)identifier;
+ (id)getItem:(id)identifier isProtoBufData:(BOOL)isProtoBuf;

// 根据identifier删除缓存数据
+ (void)removeItem:(NSString *)identifier;

@end
