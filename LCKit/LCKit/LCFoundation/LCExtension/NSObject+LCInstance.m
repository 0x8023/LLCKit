//
//  NSObject+LCInstance.m
//  LCKit
//
//  Created by LLC on 16/1/15.
//  Copyright © 2016年 Orange. All rights reserved.
//

#import "NSObject+LCInstance.h"

static NSMutableDictionary * instanceDatasource = nil;

@implementation NSObject (LCInstance)

+ (instancetype) LCInstance
{
    NSMutableDictionary * datasource = [[self class] shareInstanceDatasource];
    
    NSString * selfClass = [[self class] description];
    
    id __singleton__ = datasource[selfClass];
    
    if (datasource[selfClass]) {
        return __singleton__;
    }
    
    __singleton__ = [[self alloc] init];
    
    [[self class] setObjectToInstanceDatasource:__singleton__];
    
    return __singleton__;
}

+(NSMutableDictionary *) shareInstanceDatasource
{
    @synchronized(self){
        
        if (!instanceDatasource) {
            instanceDatasource = [[NSMutableDictionary alloc] init];
        }
        
    }
    return instanceDatasource;
}

+(BOOL) setObjectToInstanceDatasource:(id)object
{
    NSString * objectClass = [[object class] description];
    
    if (!object) {
        return NO;
    }
    
    if (!objectClass) {
        return NO;
    }
    
    [[[self class] shareInstanceDatasource] setObject:object forKey:objectClass];
    
    return YES;
}

+ (NSString *)currentInstenceInfo
{
    NSDictionary * datasource = [NSObject shareInstanceDatasource];
    
    if (!datasource) {
        return @"[LCInstance] No instence , or no use NSObject+LCInstance.";
    }
    
    NSMutableString * info = [NSMutableString stringWithFormat:@"  * count : %d\n",(int)(datasource.allKeys.count)];
    
    for (NSString * key in datasource.allKeys) {
        
        NSString * oneInfo = datasource[key];
        
        [info appendFormat:@"  * %@\n",[oneInfo class]];
    }
    
    return info;
}
@end
