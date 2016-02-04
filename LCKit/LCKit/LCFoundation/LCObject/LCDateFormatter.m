//
//  LCDateFormatter.m
//  LCKit
//
//  Created by LLC on 16/1/15.
//  Copyright © 2016年 Orange. All rights reserved.
//

#import "LCDateFormatter.h"

@interface LCDateFormatter ()

@property (nonatomic, retain) NSCalendar *calendar;

@end

@implementation LCDateFormatter

@dynamic calendar;


+ (id) getInstence {
    
    static LCDateFormatter *formatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        formatter = [[self alloc] init];
    });
    return formatter;
}

- (id) init {
    
    if (self = [super init]) {
        
        self.calendar = [NSCalendar currentCalendar];
        [self.calendar setTimeZone: [NSTimeZone systemTimeZone]];
        [self.calendar setLocale: [[NSLocale alloc] initWithLocaleIdentifier: @"zh_CN"]];
    }
    
    return self;
}


/**
 *  NSDate日期格式化转为NSString
 *
 *  @param date      待格式化Date
 *  @param formatter style
 *
 *  @return 格式化字符串
 */
+ (NSString *) stringFromDate:(NSDate *)date toFormatter: (NSString *) formatter {
    
    if (date && [formatter length] > 0) {
        
        [[LCDateFormatter getInstence] setDateFormat: formatter];
        return [[LCDateFormatter getInstence] stringFromDate: date];
    }
    
    return nil;
}

/**
 *  NSString日期格式化转为NSDate
 *
 *  @param string    待格式化字符串
 *  @param formatter style
 *
 *  @return 格式化NSDate
 */
+ (NSDate *) dateFromString:(NSString *)string toFormatter: (NSString *) formatter {
    
    if ([string length] > 0 && [formatter length] > 0) {
        
        [[LCDateFormatter getInstence] setDateFormat: formatter];
        return [[LCDateFormatter getInstence] dateFromString: string];
    }
    return nil;
}

/**
 *  根据date获取DateEnum
 *
 *  @param date 日期对象
 *
 *  @return DateEnum
 */
- (LCDateEnum) dateEnumFromDate: (NSDate *) date {
    
    LCDateEnum dateEnum;
    if (date) {
        
        NSDateComponents *components = [self.calendar components: NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond
                                                        fromDate: date];
        dateEnum.day = components.day;
        dateEnum.hour = components.hour;
        dateEnum.minute = components.minute;
        dateEnum.second = components.second;
    }
    
    return dateEnum;
}

/**
 *  根据毫秒数返回日期
 *
 *  @param string 毫秒数字符串
 *
 *  @return 毫秒数具体日期
 */
- (NSDate *) dateFromTimeIntervalString: (NSString *) string {
    
    NSDate *date = nil;
    if ([string length] > 0) {
        
        NSTimeInterval interval = [[LCDateFormatter getInstence] secondOfTime: string];
        date = [NSDate dateWithTimeIntervalSince1970: interval];
    }
    return date;
}

/**
 *  获取时间戳的秒数
 *
 *  @param time 时间戳字符串
 *
 *  @return 秒
 */
- (NSTimeInterval) secondOfTime: (NSString *) time {
    
    return [time length] > 0 ? [time doubleValue] / 1000 : 0.0f;
}

@end
