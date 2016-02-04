//
//  UIView+Extension.h
//  LCKit
//
//  Created by LLC on 16/1/15.
//  Copyright © 2016年 Orange. All rights reserved.
//

#import <UIKit/UIKit.h>
#define CT_CELL_LINE_TAG 8023

@interface UIView (Extension)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

@end


@interface UILabel (LCNature)

- (void)natureForm;

@end


@interface UITextField (LCNature)

- (void)natureForm;

@end

@interface UIButton (LCNature)

- (void)natureForm;

@end

@interface UIImageView (LCNature)

- (void)natureForm;

@end

@interface UITableViewCell (LCNature)

- (void)natureForm;

- (UIView*)setSeparatorLine:(float)lineHeight;

@end

@interface UITableView (LCNature)

- (void)natureForm;

@end
