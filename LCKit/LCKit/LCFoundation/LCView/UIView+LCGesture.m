//
//  UIView+LCGesture.m
//  LCKit
//
//  Created by LLC on 16/1/15.
//  Copyright © 2016年 Orange. All rights reserved.
//

#import "UIView+LCGesture.h"

@implementation UIView (LCGesture)

- (UITapGestureRecognizer *)addTapTarget:(id)target selector:(SEL)selector
{
    UITapGestureRecognizer * tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    tapGestureRecognizer.numberOfTouchesRequired = 1;
    tapGestureRecognizer.cancelsTouchesInView = YES;
    tapGestureRecognizer.delaysTouchesBegan = YES;
    tapGestureRecognizer.delaysTouchesEnded = YES;
    [self addGestureRecognizer:tapGestureRecognizer];
    return tapGestureRecognizer;
}

- (UIPanGestureRecognizer *)addPanTarget:(id)target selector:(SEL)selector
{
    UIPanGestureRecognizer * panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:target action:selector];
    [self addGestureRecognizer:panGesture];
    return panGesture;
}

- (UIPinchGestureRecognizer *)addPinchTarget:(id)target selector:(SEL)selector
{
    UIPinchGestureRecognizer * pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:target action:selector];
    [self addGestureRecognizer:pinchGesture];
    return pinchGesture;
    
}

@end
