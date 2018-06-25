//
//  SKFileManager.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/24.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SKFileManager : NSFileManager

// 文件是否存在
+ (BOOL)fileExists:(NSString *)filePath;

// write dictionary into file: path
+ (void)writeDictionary:(NSDictionary *)dic toPath:(NSString *)path;

// write ProtoBuf data into file: path
+ (void)writeProtoBufData:(NSData *)data toPath:(NSString *)path;

// remove the file
+ (void)removeFile:(NSString *)filePath;


// 获取图片缓存目录
+ (NSString *)getAppImgPath;

// get full path with fileName in cache manager's cache path
+ (NSString *)pathInCacheDir:(NSString *)fileName;

// get all the file names in cache manager's cache path
// return: array with file names only, not the absolute path
+ (NSArray *)allFileNamesInCacheDirectory;

// 从缓存目录中读取protobuf 格式的缓存文件
+ (NSData *)cachedProtoBufDataFromFile:(NSString *)fileName;

// 从缓存目录中读取json格式的缓存文件
+ (NSDictionary *)cachedDictionaryFromFile:(NSString *)fileName;

@end
