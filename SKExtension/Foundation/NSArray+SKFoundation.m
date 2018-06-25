
//
//  NSArray+SKFoundation.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "NSArray+SKFoundation.h"

@implementation NSArray (SKFoundation)

- (BOOL)sk_writeToCacheFile:(NSString *)path {
	return [[NSKeyedArchiver archivedDataWithRootObject:self] writeToFile:path atomically:YES];
}

- (NSArray *)sk_readFromCacheFile:(NSString *)path {
	if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
		return [NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfFile:path]];
	}
	else {
		return @[];
	}
}

- (NSString *)sk_toJSON {
	NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
	
	return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSArray *)sk_sortWithDescriptorKey:(NSString *)key {
	NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:key ascending:YES];
	
	return [self sortedArrayUsingDescriptors:[NSArray arrayWithObject:descriptor]];
}

- (NSArray *)sk_shuffledArray {
	NSMutableArray *array = [self mutableCopy];
	
	if (array.count > 1) {
		for (NSUInteger i = array.count - 1; i > 0;  --i) {
			[array exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform((int32_t)i + 1)];
		}
	}
	
	return array;
}

- (id)sk_randomObject {
	if (self.count > 0) {
		return self[arc4random_uniform((int)self.count)];
	} else {
		return nil;
	}
}

- (NSArray *)sk_reverse {
	return [[self reverseObjectEnumerator] allObjects];
}

- (NSMutableArray *)sk_deepMutableCopy {
	return (__bridge_transfer NSMutableArray *)CFPropertyListCreateDeepCopy(kCFAllocatorDefault, (__bridge CFArrayRef) self, kCFPropertyListMutableContainers);
}

@end
