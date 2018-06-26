//
//  UIImageView+SKWebCache.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/24.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDWebImageManager.h"

@interface UIImageView (SKWebCache)

// 异步加载图片
- (void)sk_setImageWithURL:(NSString *)url;
- (void)sk_setImageWithURL:(NSString *)url placeholderImage:(UIImage *)placeholder;
- (void)sk_setImageWithURL:(NSString *)url completed:(SDExternalCompletionBlock)completedBlock;
- (void)sk_setImageWithURL:(NSString *)url placeholderImage:(UIImage *)placeholder completed:(SDExternalCompletionBlock)completedBlock;

@end
