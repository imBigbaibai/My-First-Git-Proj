//
//  HHP4TabBar.h
//  HHP4_ios
//
//  Created by tangdaojuan on 15/8/19.
//  Copyright (c) 2015年 tangdaojuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHP4BarButton.h"

@class HHP4TabBar;

@protocol HHP4TabBarDelegate <NSObject>

@optional

- (void)tabBarClicked:(HHP4TabBar *)tabBar from:(NSInteger)from to:(NSInteger)to;

- (void)tabBarClickedAddNewStatus:(HHP4TabBar *)tabBar;

@end

@interface HHP4TabBar : UIView


@property (weak, nonatomic) id <HHP4TabBarDelegate> delegate;

- (void)addBarButton:(HHP4TabBarItem *)item;

@end
