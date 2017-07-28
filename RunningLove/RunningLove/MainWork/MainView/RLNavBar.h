//
//  RLNavBar.h
//  RunningLove
//
//  Created by admin on 17/2/10.
//  Copyright © 2017年 xuwenbo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^NavBarItemClicked)(NSInteger index);

@interface RLNavBar : UIView

@property (nonatomic, weak) UILabel *titleLabel;

@property(nonatomic,strong)NSArray *buttonArray;

@property(nonatomic,copy)UIColor *itemColor;

@property (nonatomic,copy) UIColor *itemTitleColor;

@property(nonatomic,copy)NavBarItemClicked itemClicked;

+ (RLNavBar *)creatWithMainButton:(NSString *)mainButton optionButton:(NSArray *)buttons Title:(NSString *)title;


@end
