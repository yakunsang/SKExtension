


//
//  UIButton+SKWebCache.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/24.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "UIButton+SKWebCache.h"
#import "UIButton+WebCache.h"

@implementation UIButton (SKWebCache)

- (void)sk_setImageWithURL:(NSString *)url forState:(UIControlState)state {
	[self sd_setImageWithURL:[NSURL URLWithString:url] forState:state];
}

- (void)sk_setImageWithURL:(NSString *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder {
	[self sd_setImageWithURL:[NSURL URLWithString:url] forState:state placeholderImage:placeholder];
}

- (void)sk_setimageWithURL:(NSString *)url forState:(UIControlState)state completed:(SDExternalCompletionBlock)completedBlock {
	[self sd_setImageWithURL:[NSURL URLWithString:url] forState:state completed:completedBlock];
}

- (void)sk_setImageWithURL:(NSString *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder completed:(SDExternalCompletionBlock)completedBlock {
	[self sd_setImageWithURL:[NSURL URLWithString:url] forState:state placeholderImage:placeholder completed:completedBlock];
}
@end
