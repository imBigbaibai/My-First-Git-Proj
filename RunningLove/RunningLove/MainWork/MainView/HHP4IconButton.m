//
//  HHP4IconButton.m
//  HHP4_ios
//
//  Created by tangdaojuan on 15/8/19.
//  Copyright (c) 2015年 tangdaojuan. All rights reserved.
//

#import "HHP4IconButton.h"

@interface HHP4IconButton()

@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView *leftLineView;
@property (nonatomic, strong) UIView *bottomLineView;

@end

@implementation HHP4IconButton

+ (HHP4IconButton *)iconButttonWithIcon:(NSString *)icon title:(NSString *)title
{
    HHP4IconButton *iconButton = [[HHP4IconButton alloc] init];
    iconButton.backgroundColor = [UIColor whiteColor];
    iconButton.icon = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
    iconButton.icon.contentMode = UIViewContentModeScaleAspectFit;
    [iconButton addSubview:iconButton.icon];
    iconButton.label = [[UILabel alloc] init];
    iconButton.label.textAlignment = NSTextAlignmentCenter;
    iconButton.label.font = [UIFont systemFontOfSize:12];
    iconButton.label.textColor = [UIColor blackColor];
    iconButton.label.text = title;
    [iconButton addSubview:iconButton.label];
    return iconButton;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat iconH = 50;
    CGFloat iconW = iconH;
    CGFloat iconX = self.width / 2 - iconW / 2;
    CGFloat iconY = 10;
    self.icon.frame = CGRectMake(iconX, iconY, iconW, iconH);
    CGFloat labelY = CGRectGetMaxY(self.icon.frame) + 7;
    self.label.frame = CGRectMake(0, labelY, self.width, 15);
    
    self.leftLineView.frame = CGRectMake(self.width - 1, 0, 1, self.height);
    self.bottomLineView.frame = CGRectMake(0, self.height - 1, self.width, 1);
}

#pragma mark - setter方法

- (UIView *)leftLineView
{
    if (!_leftLineView) {
        _leftLineView = [self createView];
    }
    return _leftLineView;
}

- (UIView *)bottomLineView
{
    if (!_bottomLineView) {
        _bottomLineView = [self createView];
    }
    return _bottomLineView;
}

- (UIView *)createView
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = HColor(0xf0f0f0);
    [self addSubview:view];
    return view;
}

@end
