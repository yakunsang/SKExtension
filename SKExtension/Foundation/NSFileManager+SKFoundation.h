//
//  NSFileManager+SKFoundation.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (SKFoundation)

// 在 cache 目录下建自己的文件夹,方便管理
+ (NSString *)sk_rootCacheDirectory;
+ (NSString *)sk_imagesCacheDirectory;
+ (NSString *)sk_filesCacheDirectory;

// 递归清理目录
- (void)sk_clearDirectory:(NSString *)directory;

// 递归获取目录下所有文件大小
- (unsigned long long)sk_sizeOfDirectory:(NSString *)directory;

// 获取某文件大小
- (NSString *)sk_fileSize:(NSString *)filePath;

@end
