//
//  HHP4IconButton.h
//  HHP4_ios
//
//  Created by tangdaojuan on 15/8/19.
//  Copyright (c) 2015年 tangdaojuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHP4ButtonObject.h"

@interface HHP4IconButton : UIControl

+ (HHP4IconButton *)iconButttonWithIcon:(NSString *)icon title:(NSString *)title;

@property (nonatomic, strong) HHP4ButtonObject *buttonObject;

@end
