//
//  UIViewController+SKMediator.h
//  SKExtension
//
//  Created by CFsyk on 2017/10/23.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SKMediator)

// 通过UINavigationController推出ViewController,params中的key必须与对应viewcontroller的属性一致才会自动赋值
- (void)sk_pushViewController:(NSString *_Nonnull)viewController animated:(BOOL)animated;
- (void)sk_pushViewController:(NSString *_Nonnull)viewController params:(NSDictionary *_Nonnull)params animated:(BOOL)animated;

// 通过UINavigationController跳转到指定ViewController,指定ViewController必须在UINavigationController的堆栈中
- (void)sk_popToViewController:(NSString *_Nonnull)viewController animated:(Bool)animated;
- (void)sk_popToViewController:(NSString *_Nonnull)viewController params:(NSDictionary *_Nonnull)params animated:(BOOL)animated;
- (void)sk_popViewControllerAnimated:(BOOL)animated;
- (void)sk_popToRootViewControllerAnimated:(BOOL)animated;

// 通过UIViewController来present出ViewController, params中的key必须与对应viewcontroller中的属性一致才会自动赋值
- (void)sk_presentViewController:(NSString *_Nonnull)viewController animated:(BOOL)animated;
- (void)sk_presentViewController:(NSString *_Nonnull)ViewController animated:(BOOL)animated completion:(void (^__nullable)(void))completion;
- (void)sk_presentViewController:(NSString *_Nonnull)viewController params:(NSDictonary *_Nonnull)params animated:(BOOL)animated;
- (void)sk_presentViewController:(NSString *_Nonnull)viewController params:(NSDictonary *_Nonnull)params animated:(BOOL)animated completion:(void (^__nullable)(void))completion;
@end
