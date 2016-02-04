//
//  UIColor+Extension.m
//  LCKit
//
//  Created by LLC on 16/1/15.
//  Copyright © 2016年 Orange. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0x"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

+ (UIColor *)colorWithHexValue:(NSUInteger)hex
{
    NSUInteger a = ((hex >> 24) & 0x000000FF);
    float fa = ((0 == a) ? 1.0f : (a * 1.0f) / 255.0f);
    
    return [UIColor colorWithHexValue:hex alpha:fa];
}

+ (UIColor *)colorWithHexValue:(NSUInteger)hex alpha:(CGFloat)alpha
{
    if ( hex == 0xECE8E3 ) {
        
    }
    NSUInteger r = ((hex >> 16) & 0x000000FF);
    NSUInteger g = ((hex >> 8) & 0x000000FF);
    NSUInteger b = ((hex >> 0) & 0x000000FF);
    
    float fr = (r * 1.0f) / 255.0f;
    float fg = (g * 1.0f) / 255.0f;
    float fb = (b * 1.0f) / 255.0f;
    
    return [UIColor colorWithRed:fr green:fg blue:fb alpha:alpha];
}
@end
