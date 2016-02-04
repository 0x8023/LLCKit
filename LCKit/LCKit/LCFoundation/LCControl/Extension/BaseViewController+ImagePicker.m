//
//  BaseViewController+ImagePicker.m
//  KDFramework
//
//  Created by LLC on 15/10/12.
//  Copyright (c) 2015年 12304. All rights reserved.
//

#import "BaseViewController+ImagePicker.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <objc/runtime.h>
#import <AVFoundation/AVFoundation.h>
#import "LCSystem.h"

//属性扩充
static void *BlockKey = nil;
static void *SettingAlertKey = nil;

@interface BaseViewController()<UIImagePickerControllerDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>


@end


@implementation BaseViewController (ImagePicker)
- (void)dealloc
{
    objc_setAssociatedObject(self, &BlockKey, nil, OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &SettingAlertKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (PickFinishedBlock) finishedBlock {
    
    return objc_getAssociatedObject(self, &BlockKey);
}

- (UIAlertView *)settingAlertView
{
    return objc_getAssociatedObject(self, &SettingAlertKey);
}

/**
 *  是否支持拍照功能
 *
 *  @return (是：YES、否：NO)
 */
- (BOOL) supportCamera {
    
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera] == NO) {
        
        [self showAlertViewWithTitle:nil message: @"设备不支持拍照功能！"];
        return NO;
    } else if ([AVCaptureDevice authorizationStatusForMediaType: AVMediaTypeVideo] == ALAuthorizationStatusDenied) {
        
        [self showCameraAlert];
        return NO;
    } else {
        
        return YES;
    }
}

/**
 *  是否支持图片库选择功能
 *
 *  @return (是：YES、否：NO)
 */
- (BOOL) supportPhotos {
    
    if ([ALAssetsLibrary authorizationStatus] == ALAuthorizationStatusDenied) {
        
        [self showPhotosAlert];
        return NO;
    } else {
        
        return YES;
    }
}

- (void) showImagePickerViewWithTitle: (NSString *) title complateBlock: (PickFinishedBlock) block {
    
    objc_setAssociatedObject(self, &BlockKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    UIActionSheet * actionSheet = [[UIActionSheet alloc]initWithTitle:title delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"从手机相册选择", nil];
    
    [actionSheet showInView:self.view];
    
}
#pragma mark - Delegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 2) {
        
        return;
    }
    
    SEL selector = buttonIndex == 0 ? @selector(supportCamera) : @selector(supportPhotos);
    
    IMP imp = [self methodForSelector:selector];
    BOOL (*func)(id, SEL) = (void *)imp;
    
    if ([self respondsToSelector:selector] && func(self, selector)) {
        
        //调取picker
        UIImagePickerController *imagePickerVC = [[UIImagePickerController alloc] init];
        imagePickerVC.sourceType = buttonIndex == 0 ? UIImagePickerControllerSourceTypeCamera : UIImagePickerControllerSourceTypePhotoLibrary;
        imagePickerVC.delegate = self;
        [imagePickerVC setAllowsEditing: YES];
        [self presentViewController: imagePickerVC animated: YES completion: nil];
        imagePickerVC = nil;
    }
}

/**
 *  加载显示警告视图
 *
 *  @param title   标题
 *  @param message 信息内容
 */
- (void) showAlertViewWithTitle: (NSString *) title message: (NSString *) message {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle: title
                                                        message: message
                                                       delegate: nil
                                              cancelButtonTitle: @"好的"
                                              otherButtonTitles: nil];
    [alertView show];
}


#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:^{
        
        UIImage *image = info[UIImagePickerControllerEditedImage];
        [self callBackWithObject:image];
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

- (void) callBackWithObject: (id) obj {
    
    PickFinishedBlock pickFinishedBlock = [self finishedBlock];
    if (pickFinishedBlock) {
        
        pickFinishedBlock(obj);
    }
    
}

#pragma mark - Setting

- (void) showSettingAlertWithTitle: (NSString *) title message: (NSString *) message {
    
    if (IOS8_OR_LATER ) {
        
        UIAlertView *settingAlertView = [[UIAlertView alloc] initWithTitle: title
                                                                   message: message
                                                                  delegate: self
                                                         cancelButtonTitle: @"不需要"
                                                         otherButtonTitles: @"去开启", nil];
        
        [settingAlertView show];
        
        objc_setAssociatedObject(self, &SettingAlertKey, settingAlertView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    } else {
        
        UIAlertView * alert =  [[UIAlertView alloc] initWithTitle:title
                                                          message:message
                                                         delegate:nil
                                                cancelButtonTitle:@"确定"
                                                otherButtonTitles:nil];
        [alert show];
    }
}

- (void) showLocationAlert {
    
    [self showSettingAlertWithTitle: IOS8_OR_LATER? @"开启定位功能" : nil message: IOS8_OR_LATER ? @"需要开启定位功能才能正常使用" : @"定位功能当前不可用\n请您在“设置->隐私”中开启定位服务"];
}

- (void) showCameraAlert {
    
    [self showSettingAlertWithTitle: IOS8_OR_LATER  ? @"开启相机权限" : @"相机权限异常" message: IOS8_OR_LATER  ? @"需要开启相机权限才能正常使用" : @"请检查设置->隐私->相机中的位享访问权限，只有开启权限才能正常拍照。"];
}

- (void) showPhotosAlert {
    
    [self showSettingAlertWithTitle:IOS8_OR_LATER  ? @"开启照片权限" : @"照片权限异常" message: IOS8_OR_LATER  ? @"需要开启照片权限才能正常使用" : @"请检查设置->隐私->照片中的位享访问权限，只有开启权限才能正常选图。"];
}

- (void) alertView:(UIAlertView *) alertView didDismissWithButtonIndex: (NSInteger) buttonIndex {
    
    if (alertView == self.settingAlertView) {
        
        if (buttonIndex == 1) {
            
            [[UIApplication sharedApplication] openURL: [NSURL URLWithString: UIApplicationOpenSettingsURLString]];
        }
    } else {
        
        if (buttonIndex > 0) {
            
            [self signOut];
        }
    }
}

- (void) signOut {
    
}
@end