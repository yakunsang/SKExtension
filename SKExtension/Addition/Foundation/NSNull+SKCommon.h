//
//  NSNull+SKCommon.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <Foundation/Foundation.h>

// 防止因为字典为NSNull对象(接口字段为null...),然后dict[@"key"]时导致的崩溃问题
@interface NSNull (SKCommon)

@end
