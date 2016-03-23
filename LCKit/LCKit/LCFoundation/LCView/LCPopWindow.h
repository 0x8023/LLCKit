//
//  LCPopWindow.h
//  LCKit
//
//  Created by LLC on 16/3/23.
//  Copyright © 2016年 Orange. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCPopWindow : UIView

+ (LCPopWindow *)showView:(UIView *)customView;

- (void)hide;

@end
