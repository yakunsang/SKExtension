//
//  NSBundle+SKLanguage.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kAppDisplayName [NSBundle mainBundle].infoDictionary[@"CFBundleDisplayName"]
#define kAppBundleName [NSBundle mainBundle].infoDictionary[@"CFBundleName"]
#define kAppBundleId [NSBundle mainBundle].infoDictionary[@"CFBundleIdentifier"]
#define kAppVersion [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"]

@interface NSBundle (SKLanguage)

+ (void)sk_setLanguage:(NSString *)language;
@end
