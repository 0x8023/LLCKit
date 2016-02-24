//
//  LCKit.h
//  LCKit
//
//  Created by LLC on 16/1/15.
//  Copyright © 2016年 Orange. All rights reserved.
//

#ifndef LCKit_h
#define LCKit_h

#import "LCTools.h"
#import "LCSystem.h"
#import "LCExtension.h"
#import "LCControl.h"
#import "LCObject.h"
#import "LCView.h"



//打印开关 如果DEBUG 打开打印开关否则关闭

#if DEBUG

#define LC_LOG_ENABLE (1)

#else

#define LC_LOG_ENABLE (0)

#endif


#endif /* LCKit_h */
