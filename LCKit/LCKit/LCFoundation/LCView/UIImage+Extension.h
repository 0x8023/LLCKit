//
//  UIImage+Extension.h
//  LCKit
//
//  Created by LLC on 16/1/15.
//  Copyright © 2016年 Orange. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

// -3.14 ~ 3.14
-(UIImage *) changeHueValue:(float)value;

-(UIImage *) transprent;

-(UIImage *) rounded;
-(UIImage *) rounded:(CGRect)circleRect;

-(UIImage *) stretched;
-(UIImage *) stretched:(UIEdgeInsets)capInsets;

-(UIImage *) grayscale;

-(UIColor *) patternColor;

-(UIImage *) blurValue:(float)value;

+(UIImage *) screenshotsKeyWindowWithStatusBar:(BOOL)withStatusBar;

+(UIImage *) screenshotWithView:(UIView *)view;


+(UIImage *) imageWithColor:(UIColor *)color size:(CGSize)size;

-(UIImage *) scaleToWidth:(float)width;

-(UIImage *) scaleToHeight:(float)height;

-(UIImage *) scaleToWidth:(float)width height:(float)height;

-(UIImage *) rotateImageLength:(float)length imageOrientation:(UIImageOrientation)orient;

- (UIImage *) imageWithTintColor:(UIColor *)tintColor;

-(UIImage *) imageFromRect:(CGRect)newRect;

@end
