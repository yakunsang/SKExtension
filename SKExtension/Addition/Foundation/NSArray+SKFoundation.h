//
//  NSArray+SKFoundation.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SKFoundation)

// 写入文件
- (BOOL)sk_writeToCacheFile:(NSString *)path;

// 从文件中读取
- (NSArray *)sk_readFromCacheFile:(NSString *)path;

// 转成 json
- (NSString *)sk_toJSON;

// 根据数据元素中的key进行排序
- (NSArray *)sk_sortWithDescriptorKey:(NSString *)key;

// 打乱数组元素顺序
- (NSArray *)sk_shuffledArray;

// 随机取出一个元素
- (id)sk_randomObject;

// 反转数组
- (NSArray *)sk_reverse;

// deep 复制数组
- (NSMutableArray *)sk_deepMutableCopy;

@end
