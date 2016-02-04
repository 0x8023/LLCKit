//
//  UIColor+Extension.h
//  LCKit
//
//  Created by LLC on 16/1/15.
//  Copyright © 2016年 Orange. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

/**
 *  十六进制字符串转成color
 *
 *  @param color @"#666666"| @"0x666666" | @"666666"
 *
 *  @return UIColor
 */
+ (UIColor *) colorWithHexString: (NSString *)color;

/**
 *  十六进制值转成color
 *
 *  @param hex 0x666666
 *
 *  @return UIColor
 */
+ (UIColor *) colorWithHexValue:(NSUInteger)hex;
+ (UIColor *) colorWithHexValue:(NSUInteger)hex alpha:(CGFloat)alpha;

@end
