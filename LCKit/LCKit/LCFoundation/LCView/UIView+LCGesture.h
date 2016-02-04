//
//  UIView+LCGesture.h
//  LCKit
//
//  Created by LLC on 16/1/15.
//  Copyright © 2016年 Orange. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  添加手势
 */
@interface UIView (LCGesture)

-(UITapGestureRecognizer *) addTapTarget:(id)target selector:(SEL)selector;
-(UIPanGestureRecognizer *) addPanTarget:(id)target selector:(SEL)selector;
-(UIPinchGestureRecognizer *) addPinchTarget:(id)target selector:(SEL)selector;

@end
