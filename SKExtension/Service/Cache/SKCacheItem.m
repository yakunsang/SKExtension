

//
//  SKCacheItem.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/25.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "SKCacheItem.h"

@implementation SKCacheItem
- (instancetype)init {
	if (self = [super init]) {
		_expiredDate = [NSDate dateWithTimeIntervalSince1970:0];
		_isProtoBufData = NO;
	}
	
	return self;
}

+ (instancetype)itemWithProtoBufData:(NSData *)data {
	SKCacheItem *item = [[SKCacheItem alloc] init];
	[item setCacheData:data];
	item.isProtoBufData = YES;
	
	return item;
}

+ (instancetype)itemWithDictionary:(NSDictionary *)dic {
	SKCacheItem *item = [[SKCacheItem alloc] init];
	item.isProtoBufData = NO;
	
	return item;
}

- (BOOL)expired {
	return ([[NSDate date] compare:self.expiredDate] == NSOrderedDescending);
}

#pragma mark - setter/getter
- (void)setCacheData:(id)cacheData {
	_cacheData = cacheData;
	_dirty = YES;
}

- (void)setExpiredSeconds:(NSInteger)expiredSeconds {
	self.expiredDate = [NSDate dateWithTimeIntervalSinceNow:expiredSeconds];
}

- (NSInteger)expiredSeconds {
	return [self.expiredDate timeIntervalSinceDate:[NSDate date]];
}

@end
