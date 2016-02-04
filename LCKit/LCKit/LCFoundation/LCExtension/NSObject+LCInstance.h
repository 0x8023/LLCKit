//
//  NSObject+LCInstance.h
//  LCKit
//
//  Created by LLC on 16/1/15.
//  Copyright © 2016年 Orange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LCInstance)

+ (instancetype) LCInstance;
+ (NSString *) currentInstenceInfo;

@end
