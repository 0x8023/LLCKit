//
//  NSObject+Swizzle.h
//  KDFramework
//
//  Created by LLC on 15/10/13.
//  Copyright (c) 2015年 12304. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma mark -

@interface UIView (LCSwizzle)

@end

#pragma mark -

@interface NSArray (LCSwizzle)

@end

#pragma mark -

@interface NSDictionary (LCSwizzle)

@end

#pragma mark -

@interface NSMutableDictionary (LCSwizzle)

@end

#pragma mark -
@interface NSObject (Swizzle)

+ (BOOL) swizzleAll;

+ (BOOL) swizzleMethod:(SEL)oldSel withMethod:(SEL)newSel error:(NSError **)error ;

@end
