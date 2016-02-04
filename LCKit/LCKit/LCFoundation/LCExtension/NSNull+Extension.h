//
//  NSNull+Extension.h
//  KDFramework
//
//  Created by LLC on 15/10/13.
//  Copyright (c) 2015年 12304. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNull (Extension)
-(NSInteger) integerValue;
-(NSInteger) length;

-(instancetype) objectAtIndex:(NSInteger)index;

-(instancetype) objectForKey:(NSString *)key;
-(void) setObject:(id)object forKey:(id<NSCopying>)aKey;

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id *)stackbuf count:(NSUInteger)len;
@end
