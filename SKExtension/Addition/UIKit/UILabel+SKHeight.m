//
//  UILabel+SKHeight.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/23.
//  Copyright © 2017年 CFsyk. All rights reserved.
//

#import "UILabel+SKHeight.h"

@implementation UILabel (SKHeight)

- (CGFloat)sk_requiredHeight {
	static UILabel *tempLabel;
	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		tempLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, CGFLOAT_MAX)];
		tempLabel.numberOfLines = 0;
		tempLabel.lineBreakMode = NSLineBreakByWordWrapping;
	});
	
	tempLabel.font = self.font;
	tempLabel.text = self.text;
	
	[tempLabel sizeToFit];
	
	return tempLabel.frame.size.height;
}
@end
