//
//  LCFileManager.h
//  LCKit
//
//  Created by LLC on 16/1/15.
//  Copyright © 2016年 Orange. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCFileManager : NSFileManager

+ (BOOL) removeItemAtPath:(NSString *)path error:(NSError **)error;

+ (BOOL) copyItemAtPath:(NSString *)path toPath:(NSString *)toPath error:(NSError **)error;

+ (BOOL) moveItemAtPath:(NSString *)path toPath:(NSString *)toPath error:(NSError **)error;

+ (BOOL) fileExistsAtPath:(NSString *)path;

+ (BOOL) touch:(NSString *)path;

+ (BOOL) setSkipBackupAttribute:(NSString *)path;

// kb
+ (float) fileSizeWithPath:(NSString *)path;

@end
