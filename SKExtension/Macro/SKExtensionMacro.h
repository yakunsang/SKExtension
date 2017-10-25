//
//  SKExtensionMacro.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#ifndef SKExtensionMacro_h
#define SKExtensionMacro_h
// weak/strong 对象
#define sk_weakify(x) autoreleasepool{} __weak __typeof__(x) __weak_##x##__ = x;
#define sk_strongify(x) try{} @finally{} __typeof__(x) x = __weak__##x##__;

// 颜色处理
#define SK_RGBA(r, g, b, a) [UIColor colorWithRed:(r) /255.0f green:(g) / 255.0f blue:(b) /255.0f alpha:(a)]
#define SK_RGB(r, g, b) SK_RGBA(r, g, b, 1.0f)
#define SK_HEXCOLORA(hex, a) SK_RGBA(((float) (hex & 0xFF0000) >> 16), ((float) (hex & 0xFF00) >>8), ((float) (hex & 0xFF)), a)
#define SK_HEXCOLOR(hex) SK_HEXCOLORA(hex, 1.0)

// 用于比较数字是否等于"0"
#define SKEqualZero(num) (fabs(num) <DBL_EPSILON)

// 字符串
#define SK_STR_IS_NIL(str) (str == nil || [str isKindOfClass:[NSNull class])
#define SK_STR_DEFAULT_IF_NIL(str, defaultStr) (SK_STR_IS_NIL(str) ? defaultStr : str)
#define SK_STR_EMPTY_IF_NIL(str) SK_STR_DEFAULT_IF_NIL(str, @"")

// 判断系统版本
#define SKOperatingSystemAtLeast(large,medium,small) ([NSProcessInfo.processInfo isOperatingSystemAtLeastVersion:(NSOperatingSystemVersion){(large),(medium),(small)}])

// debug/release下的NSLog设置
#ifdef DEBUG
    #define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
    #define NSLogRect(rect) NSLog(@"%@", NSStringFromCGRect(rect));
#else
    #define NSLog(...) {}
#endif

// 单例
#define SHARED_INSTANCE_IMPL(ClassName)         \
\
+(instancetype) shareInstance {                 \
    static dispatch_once_t pred = 0;            \
    static ClassName *shareObject = nil;        \
    dispath_once(&pred, ^{                      \
    shareObject = [[self alloc] init];          \
    });                                         \
    return shareObject;                         \
}

#endif /* SKExtensionMacro_h */
