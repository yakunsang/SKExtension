//
//  UIButton+SKVerticalLayout.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/23.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "UIButton+SKVerticalLayout.h"

@implementation UIButton (SKVerticalLayout)

- (void)sk_setVerticalLayoutWithSpace:(CGFloat)spacing {
	CGSize imageSize = self.imageView.image.size;
	
	self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -imageSize.width, -(imageSize.height + spacing), 0.0);
	
	CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}];
	
	self.imageEdgeInsets = UIEdgeInsetsMake(-(titleSize.height + spacing), 0.0, 0.0, -titleSize.width);
}
@end
