//
//  LCSanbox.h
//  LCKit
//
//  Created by LLC on 16/1/15.
//  Copyright © 2016年 Orange. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  沙盒目录
 */
@interface LCSanbox : NSObject

+ (NSString *)appPath;		// 程序目录，不能存任何东西
+ (NSString *)docPath;		// 文档目录，需要ITUNES同步备份的数据存这里
+ (NSString *)libPrefPath;	// 配置目录，配置文件存这里
+ (NSString *)libCachePath;	// 缓存目录，系统永远不会删除这里的文件，ITUNES会删除
+ (NSString *)tmpPath;		// 缓存目录，APP退出后，系统可能会删除这里的内容

@end
