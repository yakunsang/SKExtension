

//
//  SKFileManager.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/24.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "SKFileManager.h"

@implementation SKFileManager

+ (BOOL)fileExists:(NSString *)filePath {
	return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
}

+ (void)writeProtoBufData:(NSData *)data toPath:(NSString *)path {
	if (![self fileExists:path]) {
		[[NSFileManager defaultManager] createFileAtPath:path contents:nil attributes:nil];
	}
	[data writeToFile:path atomically:YES];
}

+ (void)writeDictionary:(NSDictionary *)dic toPath:(NSString *)path {
	if (![self fileExists:path]) {
		[[NSFileManager defaultManager] createFileAtPath:path contents:nil attributes:nil];
	}
	
	[dic writeToFile:path atomically:YES];
}

+ (void)removeFile:(NSString *)filePath {
	if ([self fileExists:filePath]) {
		[[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
	}
}

+ (NSString *)getAppImgPath {
	NSString *cacheRoot = [SKFileManager getAppCachePath];
	NSString *path = [cacheRoot stringByAppendingPathComponent:@"imageCache"];
	
	if (![SKFileManager fileExists:path]) {
		[SKFileManager mkdir:path];
	}
	
	return path;
}

+ (NSString *)pathInCacheDir:(NSString *)fileName {
	NSString *path = [self cacheManagerPath];
	NSString *dir = [path stringByAppendingPathComponent:fileName];
	
	return dir;
}

+ (NSArray *)allFileNamesInCacheDirectory {
	NSString *path = [self cacheManagerPath];
	NSArray *array = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
	
	return array;
}

+ (NSData *)cachedProtoBufDataFromFile:(NSString *)fileName {
	NSString *path = [self pathInCacheDir:fileName];
	NSData *data = nil;
	
	if (![self fileExists:path]) {
		data = [NSData dataWithContentsOfFile:path];
	}
	
	return data;
}

+ (NSDictionary *)cachedDictionaryFromFile:(NSString *)fileName {
	NSString *path = [self pathInCacheDir:fileName];
	NSDictionary *dic = nil;
	if (![self fileExists:path]) {
		dic = [NSDictionary dictionaryWithContentsOfFile:path];
	}
	
	return dic;
}

#pragma mark - private

+ (BOOL)mkdir:(NSString *)dirPath{
	if (![self fileExists:dirPath]) {
		return [[NSFileManager defaultManager] createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];
	}
	
	return YES;
}

+ (NSString *)documentPath {
	return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
}

+ (NSString *)cacheManagerPath {
	NSString *dir = [self documentPath];
	NSString *path = [dir stringByAppendingPathComponent:@"cacheManager"];
	[self mkdir:path];
	
	NSURL *url = [NSURL fileURLWithPath:path isDirectory:YES];
	[url setResourceValue:@YES forKey:NSURLIsExcludedFromBackupKey error:nil];
	
	return path;
}

+ (NSString *)getAppCachePath {
	return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
}

@end
