//
//  UIViewController+Help.m
//  HHP4_ios
//
//  Created by tangdaojuan on 15/8/25.
//  Copyright (c) 2015年 tangdaojuan. All rights reserved.
//

#import "UIViewController+Help.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>
#import "OMGToast.h"


static const void *HttpRequestHUDKey = &HttpRequestHUDKey;

@implementation UIViewController (Help)

#pragma mark - HUD旋转

- (MBProgressHUD *)HUD
{
    return objc_getAssociatedObject(self, HttpRequestHUDKey);
}

- (void)setHUD:(MBProgressHUD *)HUD
{
    objc_setAssociatedObject(self, HttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)showHudInView:(UIView *)view
{
    [self showHudInView:view text:nil];
}

/**
 *  显示加载
 *
 *  @param view 加载到视图
 *  @param text 加载时显示的文字
 */
- (void)showHudInView:(UIView *)view text:(NSString *)text
{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.labelText = text;
    [self setHUD:HUD];
    [view addSubview:HUD];
    [HUD show:YES];
}
/**
 *  隐藏菊花旋转
 */
- (void)hideHud
{
    [UIView animateWithDuration:0.25 animations:^{
        [self HUD].alpha = 0;
    } completion:^(BOOL finished) {
        [[self HUD] removeFromSuperview];
        [self setHUD:nil];
    }];
}
/**
 *  设置HUD上面的文字
 */
- (void)setHudText:(NSString *)text
{
    [self HUD].labelText = text;
}
- (void)showToastView:(NSString *)text
{
    [OMGToast showWithText:text bottomOffset:0 duration:2.0f];
}
- (void)showTOPHudInView:(NSString *)text
{
    [OMGToast showWithText:text topOffset:0 duration:2.0];
}

- (void)setExtraCellLineHidden: (UITableView *)tableView

{
    
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
    
}

//校验是否为纯数字
- (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

//正则匹配手机号
- (BOOL)valiMobile:(NSString *)mobile{
    /**
     * 移动号段正则表达式
     */
    NSString *CM_NUM = @"^((13[4-9])|(147)|(15[0-2,7-9])|(178)|(18[2-4,7-8]))\\d{8}|(1705)\\d{7}$";
    /**
     * 联通号段正则表达式
     */
    NSString *CU_NUM = @"^((13[0-2])|(145)|(15[5-6])|(176)|(18[5,6]))\\d{8}|(1709)\\d{7}$";
    /**
     * 电信号段正则表达式
     */
    NSString *CT_NUM = @"^((133)|(153)|(177)|(18[0,1,9]))\\d{8}$";
        
    NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM_NUM];
    BOOL isMatch1 = [pred1 evaluateWithObject:mobile];
    NSPredicate *pred2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU_NUM];
    BOOL isMatch2 = [pred2 evaluateWithObject:mobile];
    NSPredicate *pred3 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT_NUM];
    BOOL isMatch3 = [pred3 evaluateWithObject:mobile];
    
    if (isMatch1 || isMatch2 || isMatch3 || [mobile hasPrefix:@"010"]) {
        return YES;
    }else{
        return NO;
    }
    return nil;
}

//校验是否为空字符
- (BOOL)isBlankString:(NSString *)string{
    
    if (string == nil) {
        return YES;
    }
    
    if (string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    return NO;
}

//获得手机的型号判断每页的行数
- (NSString *)deviceNameForLineNumber{
    
    if (kScreenHeight == 716) {
        return @"7";
    }else if (kScreenHeight == 647){
        return @"7";
    }else{
        return @"7";
    }
}

//存储图片
- (void)saveImage:(UIImage *)image {
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"pic.png"];   // 保存文件的名称
    [UIImagePNGRepresentation(image)writeToFile: filePath    atomically:YES];
    
}

//删除图片
- (void)deleteImage{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    NSString *MapLayerDataPath = [documentsDirectory stringByAppendingPathComponent:@"pic.png"];
    
    BOOL bRet = [fileMgr fileExistsAtPath:MapLayerDataPath];
    if (bRet) {
        //
        NSError *err;
        [fileMgr removeItemAtPath:MapLayerDataPath error:&err];
    }
    
}

@end
