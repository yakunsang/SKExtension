
//
//  NSDictionary+SKFoundation.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "NSDictionary+SKFoundation.h"

@implementation NSDictionary (SKFoundation)

- (BOOL)sk_writeToCacheFile:(NSString *)path {
	return [[NSKeyedArchiver archivedDataWithRootObject:self] writeToFile:path atomically:YES];
}

+ (NSDictionary *)sk_readFromCacheFile:(NSString *)path {
	if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
		return [NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfFile:path]];
	} else {
		return @{};
	}
}

- (NSString *)sk_toURLParams {
	__block NSMutableArray *params = [NSMutableArray array];
	[self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
		[params addObject:[NSString stringWithFormat:@"%@=%@", key, obj]];
	}];
	
	return [NSString stringWithFormat:@"?%@", [params componentsJoinedByString:@"&"]];
}

- (NSString *)sk_toJSON {
	NSData *data = [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
	
	return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
