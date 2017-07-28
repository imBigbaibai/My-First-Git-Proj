//
//  HHP4NavBarView.h
//  HHP4_ios
//
//  Created by tangdaojuan on 15/8/19.
//  Copyright (c) 2015年 tangdaojuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^NavBarItemClicked)(NSInteger index);

@interface HHP4NavBar : UIView

@property (nonatomic, weak) UILabel *titleLabel;

@property(nonatomic,strong)NSArray *buttonArray;

@property(nonatomic,copy)UIColor *itemColor;

@property (nonatomic,copy) UIColor *itemTitleColor;

@property(nonatomic,copy)NavBarItemClicked itemClicked;

+ (HHP4NavBar *)creatWithMainButton:(NSString *)mainButton optionButton:(NSArray *)buttons Title:(NSString *)title;

@end
