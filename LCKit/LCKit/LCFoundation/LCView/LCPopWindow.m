//
//  LCPopWindow.m
//  LCKit
//
//  Created by LLC on 16/3/23.
//  Copyright © 2016年 Orange. All rights reserved.
//

#import "LCPopWindow.h"

@interface LCPopWindow ()

@property (nonatomic,strong) UIView * maskView;
@property (nonatomic,strong) UIView * customView;
@end

@implementation LCPopWindow

- (instancetype)initWithCustomView:(UIView *)customView
{
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        
        self.maskView = [[UIView alloc] initWithFrame:self.bounds];
        [self.maskView setBackgroundColor:[UIColor blackColor]];
        [self.maskView setAlpha:0.5];

        [self addSubview:self.maskView];
        self.customView = customView;
        [self addSubview:self.customView];
        self.customView.center = self.center;
    }
    return self;
}

+ (LCPopWindow *)showView:(UIView *)customView
{
    LCPopWindow * popWindow = [[LCPopWindow alloc] initWithCustomView:customView];
    [popWindow show];
    return popWindow;
}

#pragma mark -

- (void)hide
{
    [[UIApplication sharedApplication].keyWindow.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[LCPopWindow class]]) {
            [obj removeFromSuperview];
            obj = nil;
        }
    }];
}

- (void)show{
    
    [[UIApplication sharedApplication].keyWindow.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[LCPopWindow class]]) {
            [obj removeFromSuperview];
            obj = nil;
        }
    }];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
}


@end
