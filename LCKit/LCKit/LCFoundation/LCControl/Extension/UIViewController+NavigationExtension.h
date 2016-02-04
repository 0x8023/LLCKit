//
//  UIViewController+NavigationExtension.h
//  KDFramework
//
//  Created by LLC on 15/10/13.
//  Copyright (c) 2015年 12304. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum _NavigationBarButtonType {
    
    NavigationBarButtonTypeLeft  = 0,
    NavigationBarButtonTypeRight = 1
    
} NavigationBarButtonType;

@interface UIViewController (NavigationExtension)

// 在ViewController中直接实现该方法
- (void)navigationBarButtonClick:(NavigationBarButtonType)type;

- (void)showNavigationBarAnimated:(BOOL)animated;
- (void)hideNavigationBarAnimated:(BOOL)animated;

- (void)showBackBarButtonWithImage:(UIImage *)image selectImage:(UIImage *)selectImage;

- (void)showBarButton:(NavigationBarButtonType)position custom:(UIView *)view;
- (void)showBarButton:(NavigationBarButtonType)position image:(UIImage *)image selectImage:(UIImage *)selectImage;
- (void)showBarButton:(NavigationBarButtonType)position title:(NSString *)title image:(UIImage *)image selectImage:(UIImage *)selectImage;

- (void)hideBarButton:(NavigationBarButtonType)position;



- (void)showBarButton:(NavigationBarButtonType)position title:(NSString *)name textColor:(UIColor *)textColor;

- (void)showBarButton:(NavigationBarButtonType)position system:(UIBarButtonSystemItem)index;

- (void)didLeftBarButtonTouched;
- (void)didRightBarButtonTouched;


@end
