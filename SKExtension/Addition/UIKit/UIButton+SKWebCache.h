//
//  UIButton+SKWebCache.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/24.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDWebImageManager.h"

@interface UIButton (SKWebCache)

// 异步加载图片
- (void)sk_setImageWithURL:(NSString *)url forState:(UIControlState)state;
- (void)sk_setImageWithURL:(NSString *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder;
- (void)sk_setimageWithURL:(NSString *)url forState:(UIControlState)state completed:(SDExternalCompletionBlock)completedBlock;
- (void)sk_setImageWithURL:(NSString *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder
				 completed:(SDExternalCompletionBlock)completedBlock;

@end
