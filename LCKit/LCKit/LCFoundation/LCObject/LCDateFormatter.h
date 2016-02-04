//
//  LCDateFormatter.h
//  LCKit
//
//  Created by LLC on 16/1/15.
//  Copyright © 2016年 Orange. All rights reserved.
//

#import <Foundation/Foundation.h>

struct LCDateEnum {
    
    NSInteger day;
    NSInteger hour;
    NSInteger minute;
    NSInteger second;
};
typedef struct LCDateEnum LCDateEnum;


@interface LCDateFormatter : NSDateFormatter

+ (id) getInstence;

/**
 *  NSDate日期格式化转为NSString
 *
 *  @param date      待格式化Date
 *  @param formatter style
 *
 *  @return 格式化字符串
 */
+ (NSString *) stringFromDate:(NSDate *)date toFormatter: (NSString *) formatter;

/**
 *  NSString日期格式化转为NSDate
 *
 *  @param string    待格式化字符串
 *  @param formatter style
 *
 *  @return 格式化NSDate
 */
+ (NSDate *) dateFromString:(NSString *)string toFormatter: (NSString *) formatter;


/**
 *  根据date获取DateEnum
 *
 *  @param date 日期对象
 *
 *  @return DateEnum
 */
- (LCDateEnum) dateEnumFromDate: (NSDate *) date ;

/**
 *  根据毫秒数返回日期
 *
 *  @param string 毫秒数字符串
 *
 *  @return 毫秒数具体日期
 */
- (NSDate *) dateFromTimeIntervalString: (NSString *) string ;

/**
 *  获取时间戳的秒数
 *
 *  @param time 时间戳字符串
 *
 *  @return 秒
 */
- (NSTimeInterval) secondOfTime: (NSString *) time ;
@end
