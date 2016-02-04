//
//  LCUserDefaults.h
//  LCKit
//
//  Created by LLC on 16/1/15.
//  Copyright © 2016年 Orange. All rights reserved.
//

#import <Foundation/Foundation.h>

#define STANDAR_USER_DEFAULTS [NSUserDefaults standardUserDefaults]

@interface LCUserDefaults : NSUserDefaults

+ (BOOL)setObject:(id)object forKey:(NSString *)key;

+ (id)objectForKey:(NSString *)key;

@end
