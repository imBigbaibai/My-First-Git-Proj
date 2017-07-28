//
//  HHP4DownList.h
//  HHP4_ios
//
//  Created by tangdaojuan on 15/8/26.
//  Copyright (c) 2015年 tangdaojuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHP4DownList : UIView <UITableViewDelegate,UITableViewDataSource>{
    BOOL showList;//是否弹出下拉列表
    CGFloat tabheight;//table下拉列表的高度
    CGFloat frameHeight;//frame的高度
}

@property (nonatomic,strong) UITableView *tv;
@property (nonatomic,strong) NSArray *tableArray;
@property (nonatomic,strong) UIButton *clickedBtn;


@end
