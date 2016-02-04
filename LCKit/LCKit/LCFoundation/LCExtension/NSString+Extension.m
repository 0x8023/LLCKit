//
//  NSString+Extension.m
//  KDFramework
//
//  Created by LLC on 15/10/13.
//  Copyright (c) 2015年 12304. All rights reserved.
//

#import "NSString+Extension.h"
#import "NSData+Extension.h"

@implementation NSString (Extension)

@dynamic MD5;
@dynamic MD5Data;

- (NSString *)MD5
{
    NSData * value;
    
    value = [NSData dataWithBytes:[self UTF8String] length:[self length]];
    value = [value MD5];
    
    if ( value )
    {
        char			tmp[16];
        unsigned char *	hex = (unsigned char *)malloc( 2048 + 1 );
        unsigned char *	bytes = (unsigned char *)[value bytes];
        unsigned long	length = [value length];
        
        hex[0] = '\0';
        
        for ( unsigned long i = 0; i < length; ++i )
        {
            sprintf( tmp, "%02X", bytes[i] );
            strcat( (char *)hex, tmp );
        }
        
        NSString * result = [NSString stringWithUTF8String:(const char *)hex];
        free( hex );
        return result;
    }
    else
    {
        return nil;
    }
}

- (NSData *)MD5Data
{
    // TODO:
    return nil;
}


- (BOOL)isEmail
{
    NSString *		regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *	pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

- (BOOL)isUrl
{
    NSString *		regex = @"http(s)?:\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?";
    NSPredicate *	pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [pred evaluateWithObject:self];
}

- (BOOL)isTelephone
{
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    return  [regextestmobile evaluateWithObject:self]   ||
    [regextestphs evaluateWithObject:self]      ||
    [regextestct evaluateWithObject:self]       ||
    [regextestcu evaluateWithObject:self]       ||
    [regextestcm evaluateWithObject:self];
}

- (BOOL)isCarNo
{
    //冀BPJ686 京A00001
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{5}$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    return [carTest evaluateWithObject:self];
}

// position：保留小数点第几位，
-(NSString *)roundUpAfterPoint:(int)position
{
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:position raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *ouncesDecimal;
    NSDecimalNumber *roundedOunces;
    ouncesDecimal = [[NSDecimalNumber alloc] initWithFloat:[self floatValue]];
    roundedOunces = [ouncesDecimal decimalNumberByRoundingAccordingToBehavior:roundingBehavior];

    return [NSString stringWithFormat:@"%@",roundedOunces];
}
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
- (CGSize)sizeWithFont:(UIFont *)font byWidth:(CGFloat)width
{
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
    
    CGSize size = CGSizeMake(width, 999999.0f);
    
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    size = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    return size;
    
#else
    
    return [self sizeWithFont:font
            constrainedToSize:CGSizeMake(width, 999999.0f)
                lineBreakMode:NSLineBreakByWordWrapping];
    
#endif
}

- (CGSize)sizeWithFont:(UIFont *)font byHeight:(CGFloat)height
{
    
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
    
    CGSize size = CGSizeMake(999999.0f, height);
    
    NSDictionary * tdic = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,nil];
    size = [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading attributes:tdic context:nil].size;
    
    return size;
    
#else
    
    return [self sizeWithFont:font
            constrainedToSize:CGSizeMake(999999.0f, height)
                lineBreakMode:NSLineBreakByWordWrapping];
    
#endif
}

- (CGFloat)widthWithFont:(UIFont *)font byHeight:(CGFloat)height
{
    return [self sizeWithFont:font byHeight:height].width;
}

- (CGFloat)heightWithFont:(UIFont *)font byWidth:(CGFloat)width
{
    return [self sizeWithFont:font byWidth:width].height;
}

#endif	// #if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

- (BOOL)empty
{
    return [self length] > 0 ? NO : YES;
}

- (BOOL)notEmpty
{
    return [self length] > 0 ? YES : NO;
}

//ARC 中 oc 和 cf 对象的内存管理 http://www.cnblogs.com/zzltjnh/p/3885012.html
+ (NSString *) uuid
{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    CFRelease(uuid_ref);

    NSString *uuid = [NSString stringWithString:(__bridge NSString*)uuid_string_ref];
    
    return uuid;
}

- (NSString *)trim
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
