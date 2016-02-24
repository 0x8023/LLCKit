//
//  LCLog.h
//  LCKit
//
//  Created by LLC on 16/1/15.
//  Copyright © 2016年 Orange. All rights reserved.
//

#import <Foundation/Foundation.h>

#undef	NSLog
#define	NSLog(desc,...) LCLog(desc, ##__VA_ARGS__)


#undef  INFO
#define INFO(desc,...) LCInfo(desc, ##__VA_ARGS__) /* Special "NSLog". For example:LC ✨INFO✨ ⥤ hello word! */


#undef  ERROR
#define ERROR(desc,...) LCError(LC_THIS_FILE, LC_THIS_METHOD, LC_THIS_LINE, desc, ##__VA_ARGS__) /* The ERROR is not affected by LC_DEBUG_ENABLE and could set the local filelogs. For example:LC 👿ERROR👿 ⥤ error warning! */

#if __cplusplus
extern "C" {
#endif
    
    void LCLog( NSObject * format, ... );
    
    void LCInfo( NSObject * format, ... );
    
    void LCError( NSString * file, const char * function, int line, NSObject * format, ... );
    
    NSString * extractFileNameWithoutExtension(const char * filePath, BOOL copy);
    
#if __cplusplus
};
#endif

#define LC_THIS_FILE (extractFileNameWithoutExtension(__FILE__, NO))

#define LC_THIS_METHOD __FUNCTION__

#define LC_THIS_LINE __LINE__
