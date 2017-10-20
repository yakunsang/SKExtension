//
//  NSFileManager+SKFoundation.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "NSFileManager+SKFoundation.h"

@implementation NSFileManager (SKFoundation)

+ (NSString *)sk_rootCacheDirectory {
	NSString *rootDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"iCache"];
	
	if (![[NSFileManager defaultManager] fileExistsAtPath:rootDir]) {
		[[NSFileManager defaultManager] createDirectoryAtPath:rootDir withIntermediateDirectories:YES
												   attributes:nil error:nil];
	}
	
	return rootDir;
}

+ (NSString *)sk_imagesCacheDirectory {
	NSString *imagesDir = [[self sk_rootCacheDirectory] stringByAppendingPathComponent:@"images"];
	
	if (![[NSFileManager defaultManager] fileExistsAtPath:imagesDir]) {
		[[NSFileManager defaultManager] createDirectoryAtPath:imagesDir withIntermediateDirectories:YES attributes:nil error:nil];
	}
	
	return imagesDir;
}

+ (NSString *)sk_filesCacheDirectory {
	NSString *fileDir = [[self sk_rootCacheDirectory] stringByAppendingPathComponent:@"files"];
	
	if (![[NSFileManager defaultManager] fileExistsAtPath:fileDir]) {
		[[NSFileManager defaultManager] createDirectoryAtPath:fileDir withIntermediateDirectories:YES attributes:nil error:nil];
	}
	
	return fileDir;
}
- (void)sk_clearDirectory:(NSString *)directory {
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
		NSError *error;
		NSArray *contents = [self contentsOfDirectoryAtPath:directory error:&error];
		
		if (!error) {
			for (NSString *content in contents) {
				NSString *path = [directory stringByAppendingPathComponent:content];
				
				if ([[self attributesOfItemAtPath:path error:nil].fileType isEqualToString:NSFileTypeDirectory]) {
					[self sk_clearDirectory:path];
				} else {
					[self removeItemAtPath:path error:nil];
				}
			}
		}
	});
}

- (unsigned long long)sk_sizeOfDirectory:(NSString *)directory {
	unsigned long long size = 0;
	
	NSError *error;
	NSArray *contents = [self contentsOfDirectoryAtPath:directory error:&error];
	
	if (!error) {
		for (NSString *content in contents) {
			NSDictionary *attributes = [self attributesOfItemAtPath:[directory stringByAppendingPathComponent:content] error:&error];
		
			if (!error) {
				if ([attributes.fileType isEqualToString:NSFileTypeDirectory]) {
					size += [self sk_sizeOfDirectory:[directory stringByAppendingPathComponent:content]];
				} else {
					size += attributes.fileSize;
				}
			}
		}
	}
	
	return size;
}

- (NSString *)sk_fileSize:(NSString *)filePath {
	unsigned long long size = 0;
	if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
		size = [[[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil] fileSize];
	}
	
	return [NSString stringWithFormat:@"%.2gM",(size / (1024.0f * 1024.0f)) > 0.1 ?: 0.0f];
}
@end
