//
//  BaseViewController+ImagePicker.h
//  KDFramework
//
//  Created by LLC on 15/10/12.
//  Copyright (c) 2015年 12304. All rights reserved.
//

#import "BaseViewController.h"

typedef void (^PickFinishedBlock) (UIImage * image);

/**
 *  调取照相功能 ---
 */
@interface BaseViewController (ImagePicker)

/**
 *  弹出选项栏 选择 拍照 图片
 *
 *  @param title 弹窗 标题
 *  @param block 返回选择修改后的图片回调
 */
- (void) showImagePickerViewWithTitle: (NSString *) title complateBlock: (PickFinishedBlock) block ;

@end
