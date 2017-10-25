//
//  UIViewController+SKMediator.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/23.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "UIViewController+SKMediator.h"

@implementation UIViewController (SKMediator)

#pragma mark - UINavigationController push
- (void)sk_pushViewController:(NSString *)viewController animated:(BOOL)animated {
	[self sk_pushViewController:viewController params:@{} animated:animated];
}

- (void)sk_pushViewController:(NSString *)viewController params:(NSDictionary *)params animated:(BOOL)animated {
	UIViewController *pushVC = [self viewControllerWithName:viewController params:params];
	pushVC.hidesBottomBarWhenPushed = YES;
	
	if (pushVC) {
		[self.navigationController pushViewController:pushVC animated:YES];
	} else {
		NSLog(@"%@  很可能没有在podspec文件中进行配置", viewController);
	}
}

- (void)sk_popViewControllerAnimated:(BOOL)animated {
	[self.navigationController popViewControllerAnimated:animated];
}

- (void)sk_popToRootViewControllerAnimated:(BOOL)animated {
	[self.navigationController popToRootViewControllerAnimated:animated];
}

- (void)sk_popToViewController:(NSString *)viewController animated:(id)animated {
	[self sk_popToViewController:viewController params:@{} animated:animated];
}

- (void)sk_popToViewController:(NSString *)viewController params:(NSDictionary *_Nonnull)params animated:(BOOL)animated {
	NSString *vcName = viewController;
	
	if ([viewController rangeOfString:@"."].location != NSNotFound) {
		vcName = [viewController substringToIndex:[viewController rangeOfString:@"."].location];
	}
	
	UIViewController *popVC = nil;
	
	for (UIViewController *vc in self.navigationController.viewControllers) {
		if ([NSStringFromClass([vc class]) isEqualToString:viewController]) {
			popVC = vc;
			break;
		}
	}
	
	if (popVC) {
		[params enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
			[popVC setValue:obj forKey:key];
		}];
		
		[self.navigationController popToViewController:popVC animated:animated];
	} else {
		NSLog(@"%@  不在 UINavigationController 的堆栈里", viewController);
	}
}

- (void)sk_presentViewController:(NSString *)viewController animated:(BOOL)animated {
	[self sk_presentViewController:viewController params:@{} animated:animated completion:NULL];
}

- (void)sk_presentViewController:(NSString *)ViewController animated:(BOOL)animated completion:(void (^)(void))completion {
	[self sk_presentViewController:ViewController params:@{} animated:animated completion:NULL];
}

- (void)sk_presentViewController:(NSString *)viewController params:(id)params animated:(BOOL)animated {
	[self sk_presentViewController:viewController params:params animated:animated completion:NULL];
}

- (void)sk_presentViewController:(NSString *)viewController params:(id)params animated:(BOOL)animated completion:(void (^)(void))completion {
	UIViewController *presentVC = [self viewControllerWithName:viewController params:params];
	
	if (presentVC) {
		[self presentViewController:presentVC animated:animated completion:completion];
	} else {
		NSLog(@"%@ 很可能没有在podspec文件中进行配置.", viewController);
	}
}

#pragma mark - private

- (UIViewController *)viewControllerWithName:(NSString *)name params:(NSDictionary *_Nonnull)params {
	UIViewController *viewController = nil;
	NSRange range = [name rangeOfString:@"." options:NSBackwardsSearch];
	if (range.location == NSNotFound) {
		viewController = [[NSClassFromString(name) alloc] init]; //init会调用initWithNibName:bundle
	} else {
		NSString *className = [name substringToIndex:range.location];
		NSString *storyboardName = [name substringFromIndex:range.location + 1];
		
		@try {
			viewController = [[UIStoryboard storyboardWithName:storyboardName bundle:nil] instantiateViewControllerWithIdentifier:className];
		}
		@catch (NSException *__unused exception) {
			NSLog(@"storyboard:%@ 很可能没有在podspec文件中进行配置.",storyboardName);
		}
		
		[params enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
			[viewController setValue:obj forKey:key];
		}];
	}
	
	return viewController;
}

@end
