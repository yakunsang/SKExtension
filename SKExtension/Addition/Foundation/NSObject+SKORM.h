//
//  NSObject+SKORM.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const identifier;

@interface NSObject (SKORM)

/**
 *  For the corresponding database table primary key id
 */
@property (nonatomic, copy) NSString *ID;

/**
 *  Properties and corresponding values
 */
@property (nonatomic, readonly) NSMutableDictionary *keyValues;

/**
 *  The key is the best as the property name，if not. @see mapping
 */
- (instancetype)initWithDictionary:(NSDictionary *)keyValues;

/**
 *  If the property type is a custom class, you need to overwrite this method.
 *
 *  @return key is property name, value is model class, default return @{};
 */
- (NSDictionary *)objectPropertys;

/*
 *  If the property type is a NSArray<...>, you need to overwrite this method.
 *
 *  @return key is property name, value is generic, default return @{};
 */
- (NSDictionary *)genericForArray;

/**
 *  If the property name and the JSON keys is not the same key, you need to overwrite this method.
 *
 *  @return key is datasource's key, value is property name, default return @{}.
 */
- (NSDictionary *)mapping;

/**
 *  If the model class name and the table name is different, you need to overwrite this method.
 *
 *  @return default return the class name.
 */
+ (NSString *)tableName;

@end
