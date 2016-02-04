//
//  LCTools.h
//  LCKit
//
//  Created by LLC on 16/1/15.
//  Copyright © 2016年 Orange. All rights reserved.
//

#ifndef LCTools_h
#define LCTools_h

#define LC_DEVICE_WIDTH  ([[UIScreen mainScreen] bounds].size.width)
#define LC_DEVICE_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

#define LC_KEYWINDOW ((UIView*)[UIApplication sharedApplication].keyWindow)
#define LC_APPDELEGATE ((AppDelegate*)([UIApplication sharedApplication].delegate))

#define LC_RGB(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0f]
#define LC_RGBA(R,G,B,A) [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]

#define LC_WEAK_SELF __weak __typeof(self) weakSelf = self

#pragma mark - String

#define KD_NSSTRING_IS_INVALID(s) ( !s || s.length <= 0 || [s isEqualToString:@"(null)"] || [s isKindOfClass:[NSNull class]])

#define DEFAULT_FONT(sizeint)           [UIFont fontWithName:@"Helvetica" size:sizeint]
#define DEFAULT_BUTTON_FONT(sizeint)    [UIFont fontWithName:@"Helvetica-Bold" size:sizeint]


#endif /* LCTools_h */
