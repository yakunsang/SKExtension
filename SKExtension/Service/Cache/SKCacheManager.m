
//
//  SKCacheManager.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/24.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "SKCacheManager.h"
#import "SKCacheItem.h"
#import "SKFileManager.h"
#import <malloc/malloc.h>

#define kMaxCacheSize 10000
#define kRemoveExpiredCacheTime (5*60)

static SKCacheManager *manager = nil;

@interface SKCacheManager ()

@property (nonatomic, strong) NSMutableDictionary *data;          // 用于缓存所有缓存数据
@property (nonatomic, strong) NSMutableArray *identifierArray;     // 存放所有缓存数据的key
@property (nonatomic, strong) NSTimer *cacheTimer;                 // 每隔"kRemoveExpiredCacheTime"时间扫描一下过期的缓存数据
@property (nonatomic, assign) NSUInteger totalSize;                // 当前内存中缓存数据的大小

@end

@implementation SKCacheManager

- (instancetype)init {
	if (self = [super init]) {
		_data = [NSMutableDictionary dictionary];
		_identifierArray = [NSMutableArray arrayWithArray:[SKFileManager allFileNamesInCacheDirectory]];
		_cacheTimer = [NSTimer scheduledTimerWithTimeInterval:kRemoveExpiredCacheTime target:self selector:@selector(removeExpiredCache) userInfo:nil repeats:YES];
		
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
		[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground) name:UIApplicationWillEnterForegroundNotification object:nil];
	}
	
	return self;
}

+ (instancetype)sharedInstance {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		manager = [[SKCacheManager alloc] init];
	});
	
	return manager;
}

- (void)dealloc {
	if ([_cacheTimer isValid]) {
		[_cacheTimer invalidate];
	}
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - public method

+ (void)addItem:(id)item forKey:(NSString *)identifier withExpireTime:(NSInteger)seconds {
	[self addItem:item forKey:identifier withExpireTime:seconds];
}

+ (void)addItem:(id)item forKey:(NSString *)identifier withExpireTime:(NSInteger)seconds isProtoBufData:(BOOL)isProtoBufData {
	if (nil == item || nil == identifier || [identifier length] <= 0) {
		return;
	}
	
	[[SKCacheManager sharedInstance] addItemToCache:item forKey:identifier withExpireTime:seconds isProtoBufData:isProtoBufData];
}

+ (void)removeItem:(NSString *)identifier {
	[[SKCacheManager sharedInstance] removeItemFromCache:identifier];
}

+ (id)getItem:(id)identifier {
	return [[SKCacheManager sharedInstance] getItemFromCache:identifier isProtoBufData:YES];
}

+ (id)getItem:(id)identifier isProtoBufData:(BOOL)isProtoBuf {
	return [[SKCacheManager sharedInstance] getItemFromCache:identifier isProtoBufData:isProtoBuf];
}

#pragma mark - notification method

// App进入后台时停止定时器
- (void)applicationDidEnterBackground {
	if ([_cacheTimer isValid]) {
		[_cacheTimer invalidate];
	}
	
	_cacheTimer = nil;
}
// App进入前台时开启定时器
-(void)applicationWillEnterForeground {
	[self applicationDidEnterBackground];
	_cacheTimer = [NSTimer scheduledTimerWithTimeInterval:kRemoveExpiredCacheTime target:self selector:@selector(removeExpiredCache) userInfo:nil repeats:YES];
}

// 扫描并删除过期数据
- (void)removeExpiredCache {
	NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
	
	for (int i = 0; i < [_identifierArray count]; i++) {
		NSString *identifier = [_identifierArray objectAtIndex:i];
		SKCacheItem *item = [_data objectForKey:identifier];
		
		// if the item is not in memory, search cached files
		if (!item) {
			item = [self loadItemFromFile:identifier isProtoBufData:item.isProtoBufData];
		}
		
		if (item) {
			if ([item expired]) {
				[indexSet addIndex:i];
				
				[self substractMemorySize:item];
				[_data removeObjectForKey:identifier];
				[SKCacheManager removeCachedFile:identifier];
			}
		} else {
			[indexSet addIndex:i];
		}
	}
	
	[_identifierArray removeObjectsAtIndexes:indexSet];
}

#pragma mark - private

- (void)addItemToCache:(id)item forKey:(NSString *)identifier withExpireTime:(NSUInteger)seconds isProtoBufData:(BOOL)isProtoBufData {
	SKCacheItem *content = [_data objectForKey:identifier];
	
	// 如果数据已存在缓存中则更新相关信息,否则添加
	if (content) {
		[content setExpiredSeconds:seconds];
		[self substractMemorySize:item];
		[content setCacheData:item];
		[self addMemorySize:item];
	} else {
		content = [SKCacheItem new];
		[content setExpiredSeconds:seconds];
		[content setCacheData:item];
		[self addMemorySize:item];
		[_data setObject:content forKey:identifier];
	}
	
	[self updateItemPriority:identifier];
	[self handleMemorySize:isProtoBufData];
}

- (id)getItemFromCache:(NSString *)identifier isProtoBufData:(BOOL)isProtoBuf {
	SKCacheItem *item = [_data objectForKey:identifier];
	
	// if the item is not in memory, search cached files
	if (!item) {
		item = [self loadItemFromFile:identifier isProtoBufData:isProtoBuf];
	}
	
	if (!item) {
		return nil;
	}
	
	// 数据如果过期则删除
	if ([item expired]) {
		[self removeItemFromCache:identifier];
		return nil;
	}
	
	[self updateItemPriority:identifier];
	
	return [item cacheData];
}

- (void)removeItemFromCache:(NSString *)identifier {
	SKCacheItem *item = [_data objectForKey:identifier];
	
	if (item) {
		[self substractMemorySize:item];
		[_data removeObjectForKey:identifier];
	}
	
	[SKCacheManager removeCachedFile:identifier];
	[_identifierArray removeObject:identifier];
}

- (SKCacheItem *)loadItemFromFile:(NSString *)identifier isProtoBufData:(BOOL)isProtoBuf {
	SKCacheItem *item = nil;
	
	if (isProtoBuf) {
		NSData *data = [SKFileManager cachedProtoBufDataFromFile:identifier];
		
		if (!data) {
			return nil;
		}
	} else {
		NSDictionary *dic = [SKFileManager cachedDictionaryFromFile:identifier];
		
		if (dic.count <= 0) {
			return nil;
		}
	}
	
	if (!item || [item expired]) {
		[SKCacheManager removeCachedFile:identifier];
		
		return nil;
	}
	
	// add the loaded item into cache
	[self addItemToCache:item.cacheData forKey:identifier withExpireTime:[item expiredSeconds] isProtoBufData:NO];
	
	return item;
}

- (void)cacheItemToFile:(NSString *)identifier isProtoBufData:(BOOL)isProtoBuf {
	SKCacheItem *item = [_data objectForKey:identifier];
	
	if (!item.dirty) {
		return;
	}
	
	[SKFileManager writeProtoBufData:item.cacheData toPath:[SKFileManager pathInCacheDir:identifier]];
	[_data removeObjectForKey:identifier];
	[self substractMemorySize:item];
}

+ (void)removeCachedFile:(NSString *)identifier {
	[SKFileManager removeFile:[SKFileManager pathInCacheDir:identifier]];
}

// 更新缓存优先级
- (void)updateItemPriority:(NSString *)identifier {
	[_identifierArray removeObject:identifier];
	[_identifierArray insertObject:identifier atIndex:0];
}

- (void)addMemorySize:(SKCacheItem *)item {
	_totalSize += malloc_size((__bridge const void*) (item));
}

- (void)substractMemorySize:(SKCacheItem *)item {
	_totalSize -= malloc_size((__bridge const void *) (item));
}

- (void)handleMemorySize:(BOOL)isProtoBuf {
	NSUInteger index = _identifierArray.count - 1;
	
	// 当缓存内容超过最大值后,将缓存由内存转为文件式
	while (_totalSize > kMaxCacheSize) {
		if (!_data[_identifierArray[index]]) {
			continue;
		}
		
			  [self cacheItemToFile:_identifierArray[index] isProtoBufData:isProtoBuf];
	}
}
@end
