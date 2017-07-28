
//
//  RunCommon.h
//  RunningLove
//
//  Created by admin on 17/2/10.
//  Copyright © 2017年 xuwenbo. All rights reserved.
//

#ifndef RunCommon_h
#define RunCommon_h


#define kScreen_Bounds [UIScreen mainScreen].bounds
#define kScreenWidth      CGRectGetWidth([UIScreen mainScreen].applicationFrame)
#define kScreenHeight     CGRectGetHeight([UIScreen mainScreen].applicationFrame)
#define KStatusHeight 20
#define kBoundsHeight     CGRectGetHeight([UIScreen mainScreen].bounds)
#define iOS7             [[[UIDevice currentDevice] systemVersion] floatValue] >= 7

// 自定义Log
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif

#define kKeyWindow [UIApplication sharedApplication].keyWindow
#define kHigher_iOS_6_1 (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1)
#define kHigher_iOS_6_1_DIS(_X_) ([[NSNumber numberWithBool:kHigher_iOS_6_1] intValue] * _X_)
#define kNotHigher_iOS_6_1_DIS(_X_) (-([[NSNumber numberWithBool:kHigher_iOS_6_1] intValue]-1) * _X_)

#define  kBackButtonFontSize 15
#define  kNavTitleFontSize 19

#define KNavHeight 92

#define KUserInfo @"userInfo"

#define KPayInfo @"payInfo"

#define kBadgeTipStr @"badgeTip"

#define KFont @"HelveticaNeue"

#define KBloadFont @"Helvetica-Bold"

#define KSize 15.0f

#define APIKey  @"91c59c31d9fe266a63bdaa53d347e4fa";

#define ORDER_PAY_NOTIFICATION @"order_pay_notification"

#define HColor(rgbValue) HColorWithAlpha(rgbValue,1)

#define HColorWithAlpha(rgbValue,alphaValue) [UIColor colorWithRed:((float)((rgbValue &0xFF0000) >>16))/255.0 green:((float)((rgbValue &0xFF00) >>8))/255.0 blue:((float)(rgbValue &0xFF))/255.0 alpha:alphaValue]      //16进制宏定义

#define KBaseColor HColor(0x279ef2)
#define KGrayColor HColor(0xf6f6f6)
#define KOrangeColor HColor(0xff7e00)
#define KContentColor  HColor(0x999999)
#define KNewGray   HColor(0xc3c3c3)
#define KLoginOrange   HColor(0xFFC92C)
#define KLoginYellow HColor(0xFEA720)
#define KLoginBlue   HColor(0x1ED4FF)


#define KErrorText @"请检查您的网络或尝试重新登录"

#define KPostAdressKey @"postAdress"

#define ErrorUsername @"请输入正确的用户名"
#define ErrorPassword @"密码不正确"

#define kTextFieldFont 13  //TextFieldFont字体大小
#define kRight 20     //右侧有系统箭头间距
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width


#endif /* RunCommon_h */
