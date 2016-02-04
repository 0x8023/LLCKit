//
//  NSObject+Notification.m
//  KDFramework
//
//  Created by LLC on 15/10/13.
//  Copyright (c) 2015年 12304. All rights reserved.
//

#import "NSObject+Notification.h"
#import "LCLog.h"

@implementation NSNotification (KDNotification)
- (BOOL)is:(NSString *)name
{
    return [self.name isEqualToString:name];
}

- (BOOL)isKindOf:(NSString *)prefix
{
    
    return [self.name hasPrefix:prefix];
}

@end

#pragma mark -

@implementation NSObject (Notification)

- (void)handleNotification:(NSNotification *)notification
{
    
}

- (void)observeNotification:(NSString *)notificationName
{
    INFO(@"[KDNotification] observe : %@ receiver : %@",notificationName,[self class]);
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:notificationName
                                               object:nil];
}

- (void)unobserveNotification:(NSString *)name
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:name
                                                  object:nil];
}

- (void)observeNotification:(NSString *)notificationName object:(id)object
{
    INFO(@"[KDNotification] observe : %@ receiver : %@",notificationName,[self class]);
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:notificationName
                                               object:object];
}

- (void)unobserveAllNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (BOOL)postNotification:(NSString *)name
{
    INFO(@"[KDNotification] post : %@ sponsor : %@",name,[self class]);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:nil];
    return YES;
}

+ (BOOL)postNotification:(NSString *)name withObject:(NSObject *)object
{
    INFO(@"[KDNotification] post : %@ sponsor : %@",name,[self class]);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:name object:object];
    return YES;
}

- (BOOL) postNotification:(NSString *)name
{
    return [[self class] postNotification:name withObject:self];
}

- (BOOL)postNotification:(NSString *)name withObject:(NSObject *)object
{
    return [[self class] postNotification:name withObject:object];
}


@end
