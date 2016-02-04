//
//  NSObject+Notification.h
//  KDFramework
//
//  Created by LLC on 15/10/13.
//  Copyright (c) 2015年 12304. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KDNOTIFICATION_SET(_name , _df) static NSString * const _name = _df;

@interface NSNotification (KDNotification)

- (BOOL)is:(NSString *)name;
- (BOOL)isKindOf:(NSString *)prefix;

@end

@interface NSObject (Notification)

- (void)handleNotification:(NSNotification *)notification;

- (void)observeNotification:(NSString *)name;
- (void)unobserveNotification:(NSString *)name;

- (void)observeNotification:(NSString *)notificationName object:(id)object;

- (void)unobserveAllNotifications;

+ (BOOL)postNotification:(NSString *)name;
+ (BOOL)postNotification:(NSString *)name withObject:(NSObject *)object;

- (BOOL)postNotification:(NSString *)name;
- (BOOL)postNotification:(NSString *)name withObject:(NSObject *)object;

@end
