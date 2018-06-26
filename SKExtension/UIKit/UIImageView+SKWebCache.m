//
//  UIImageView+SKWebCache.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/24.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "UIImageView+SKWebCache.h"
#import "UIImageView+WebCache.h"
#import "SDWebImageManager.h"

@implementation UIImageView (SKWebCache)

- (void)sk_setImageWithURL:(NSString *)url {
	[self sd_setImageWithURL:[NSURL URLWithString:url]];
}

- (void)sk_setImageWithURL:(NSString *)url placeholderImage:(UIImage *)placeholder {
	[self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder];
}

- (void)sk_setImageWithURL:(NSString *)url completed:(SDExternalCompletionBlock)completedBlock {
	[self sd_setImageWithURL:[NSURL URLWithString:url] completed:completedBlock];
}

- (void)sk_setImageWithURL:(NSString *)url placeholderImage:(UIImage *)placeholder completed:(SDExternalCompletionBlock)completedBlock {
	[self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:completedBlock];
}

@end
