//
//  NSString+SKFoundation.m
//  SKExtension
//
//  Created by CFsyk on 2017/10/20.
//  Copyright © 2017年 CFsyk. All rights reserved.
//
#import "NSString+SKCheck.h"
#import "NSString+SKFoundation.h"
#import <CommonCrypto/CommonDigest.h>
#import <CoreText/CoreText.h>


@implementation NSString (SKFoundation)

- (NSString *)sk_formateMobileNumber {
	if ([self sk_isMobileNumber]) {
		NSMutableString *mobileNumber = [NSMutableString stringWithString:self];
		[mobileNumber insertString:@" " atIndex:3];
		[mobileNumber insertString:@" " atIndex:8];
		
		return mobileNumber;
	}
	
	return self;
}

- (NSString *)sk_md5 {
	const char *cStr = self.UTF8String;
	
	unsigned char result[CC_MD5_DIGEST_LENGTH];
	CC_MD5(cStr, (CC_LONG) strlen(cStr), result);
	
	return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X", result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7], result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]];
}

- (NSString *)sk_stringByTrimmingWhitespeaceAndNewLine {
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSInteger)sk_numberOfLines {
	return [self componentsSeparatedByString:@"\n"].count + 1;
}

+ (BOOL)sk_isEmpty:(NSString *)str {
	return (!str || [str isEqualToString:@""] || [str isEqual:[NSNull null]]);
}

- (NSAttributedString *)sk_addLineSpacingWithFontSize:(CGFloat )fontSize{
	NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
	paragraphStyle.lineSpacing = 5;
	
	return [[NSMutableAttributedString alloc] initWithString:self attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName : paragraphStyle}];
}

- (NSAttributedString *)sk_addLineSpacingForString:(NSInteger)lineSpaceing font:(UIFont *)font {
	NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
	paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
	paragraphStyle.lineSpacing = lineSpaceing;
	
	return [[NSMutableAttributedString alloc] initWithString:self attributes:@{NSFontAttributeName : font, NSParagraphStyleAttributeName : paragraphStyle}];
}

- (NSAttributedString *)sk_addWordSpacingForString:(NSInteger)wordSpaceing font:(UIFont *)font {
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
	[attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, attributedString.length)];
	
	CFNumberRef numberRef = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt8Type, &wordSpaceing);
	[attributedString addAttribute:(id) kCTKernAttributeName value:(__bridge id) numberRef range:NSMakeRange(0, attributedString.length)];
	CFRelease(numberRef);
	
	return attributedString;
}

- (NSMutableAttributedString *)sk_underLineString {
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
	[attributedString addAttribute:NSUnderlineStyleAttributeName value:@(NSUnderlineStyleSingle) range:NSMakeRange(0, self.length)];
	
	return attributedString;
}

- (NSMutableAttributedString *)sk_strikethroughString {
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self];
	[attributedString addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, self.length)];
	
	return attributedString;
}

- (NSString *)sk_encodeToBase64 {
	return [NSString sk_encodeToBase64:self];
}

+ (NSString *)sk_encodeToBase64:(NSString *)string {
	NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
	
	return [data base64EncodedStringWithOptions:0];
}

- (NSString *)sk_decodeBase64 {
	return [NSString sk_decodeBase64:self];
}

+ (NSString *)sk_decodeBase64:(NSString *)string {
	NSData *data = [[NSData alloc] initWithBase64EncodedString:string options:0];
	
	return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
