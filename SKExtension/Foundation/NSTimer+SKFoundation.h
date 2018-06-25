//
//  NSTimer+SKFoundation.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (SKFoundation)

// 暂停
- (void)sk_pause;

// 从暂停中恢复
- (void)sk_resume;

@end
