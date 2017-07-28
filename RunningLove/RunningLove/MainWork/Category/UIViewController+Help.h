//
//  UIViewController+Help.h
//  HHP4_ios
//
//  Created by tangdaojuan on 15/8/25.
//  Copyright (c) 2015年 tangdaojuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Help)

/**
 * 显示加载视图
 */
- (void)showHudInView:(UIView *)view;
/**
 *  显示加载
 *
 *  @param view 加载到视图
 *  @param text 加载时显示的文字
 */
- (void)showHudInView:(UIView *)view text:(NSString *)text;

/**
 *  隐藏菊花旋转
 */
- (void)hideHud;

- (void)showToastView:(NSString *)text;

- (void)showTOPHudInView:(NSString *)text;

- (void)setExtraCellLineHidden: (UITableView *)tableView;

//校验是否为纯数字
- (BOOL)isPureInt:(NSString*)string;

//正则匹配手机号
- (BOOL)valiMobile:(NSString *)mobile;

//校验是否为空字符
- (BOOL)isBlankString:(NSString *)string;

//获得手机的型号判断每页的行数
- (NSString *)deviceNameForLineNumber;

//存储图片
- (void)saveImage:(UIImage *)image;

//删除图片
- (void)deleteImage;


@end
