//
//  UIView+Extension.m
//  LCKit
//
//  Created by LLC on 16/1/15.
//  Copyright © 2016年 Orange. All rights reserved.
//

#import "UIView+Extension.h"
#import "LCTools.h"

@implementation UIView (Extension)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
    //    self.width = size.width;
    //    self.height = size.height;
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}


@end

@implementation UILabel (LCNature)

- (void)natureForm
{
    self.backgroundColor = [UIColor clearColor];
    self.lineBreakMode = NSLineBreakByWordWrapping;
    self.textAlignment = NSTextAlignmentLeft;
    self.userInteractionEnabled = YES;
    self.textColor = [UIColor blackColor];
    self.font = DEFAULT_FONT(14);
    self.numberOfLines = 0 ;
    
}
@end

@implementation UITextField (LCNature)

- (void)natureForm
{
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.backgroundColor = [UIColor clearColor];
    self.textAlignment = NSTextAlignmentLeft;
    self.textColor =  [UIColor blackColor];
    self.font = DEFAULT_FONT(14);
}

- (void)setBackGroudStyle
{
    self.borderStyle  = UITextBorderStyleRoundedRect;
    self.layer.cornerRadius = 5;
    self.layer.borderWidth = 1;
}

@end


@implementation UIButton (LCNature)

- (void)natureForm
{
    self.backgroundColor = [UIColor clearColor];
    self.exclusiveTouch = YES;
}

@end


@implementation UIImageView (LCNature)

- (void)natureForm
{
    self.backgroundColor = [UIColor clearColor];
    self.userInteractionEnabled = YES;
}

@end

@implementation UITableViewCell (LCNature)

- (void)natureForm
{
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

- (UIView*)setSeparatorLine:(float)lineHeight
{
    UIView * lineView = [[UIView alloc] init];
    lineView.backgroundColor   = [UIColor lightGrayColor];
    lineView.tag =  CT_CELL_LINE_TAG;
    [self addSubview:lineView];
    
    lineView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self addConstraints:@[
                           [NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0],
                           [NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0],
                           [NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0],
                           [NSLayoutConstraint constraintWithItem:lineView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:lineHeight]]];
    
    return lineView;
}


@end

@implementation UITableView (LCNature)

- (void)natureForm
{
    self.backgroundColor = [UIColor clearColor];
    self.separatorStyle = UITableViewCellSelectionStyleNone;
}

@end
