//
//  LCUserDefaults.m
//  LCKit
//
//  Created by LLC on 16/1/15.
//  Copyright © 2016年 Orange. All rights reserved.
//

#import "LCUserDefaults.h"


@implementation LCUserDefaults

+(BOOL) setObject:(id)object forKey:(NSString *)key
{
    [STANDAR_USER_DEFAULTS setObject:object forKey:key];
    return [STANDAR_USER_DEFAULTS synchronize];
}

+(id) objectForKey:(NSString *)key
{
    return [STANDAR_USER_DEFAULTS objectForKey:key];
}

@end
