//
//  HHP4TabBar.m
//  HHP4_ios
//
//  Created by tangdaojuan on 15/8/19.
//  Copyright (c) 2015年 tangdaojuan. All rights reserved.
//

#import "HHP4TabBar.h"

@interface HHP4TabBar()

//按钮数组
@property (nonatomic, strong) NSMutableArray *barBtns;

//上一个选中的按钮
@property (nonatomic, strong) HHP4BarButton *lastSelectedBtn;

@end

@implementation HHP4TabBar

- (NSMutableArray *)barBtns
{
    if (!_barBtns) {
        self.barBtns = [NSMutableArray array];
    }
    return _barBtns;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBg];
    }
    return self;
}

//设置背景颜色
- (void)setBg
{
    self.backgroundColor = [UIColor whiteColor];
}

//设置按钮
- (void)addBarButton:(HHP4TabBarItem *)item
{
    HHP4BarButton *btn = [[HHP4BarButton alloc] init];
    btn.item = item;
    btn.tag = self.barBtns.count;
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchDown];
    [self.barBtns addObject:btn];
    [self addSubview:btn];
    
    if (self.barBtns.count == 1) {
        [self btnClicked:btn];
    }
    
}

- (void)btnClicked:(HHP4BarButton *)btn
{
    
    if ([_delegate respondsToSelector:@selector(tabBarClicked:from:to:)]) {
        [_delegate tabBarClicked:self from:_lastSelectedBtn.tag to:btn.tag];
    }
    
    _lastSelectedBtn.selected = NO;
    
    btn.selected = YES;
    
    _lastSelectedBtn = btn;
}

/**
 *  添加新微薄
 */
- (void)addNewStatusClicked
{
    if ([_delegate respondsToSelector:@selector(tabBarClickedAddNewStatus:)]) {
        [_delegate tabBarClickedAddNewStatus:self];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    //添加按钮
    NSInteger btnCount = self.barBtns.count;
    CGFloat w = self.width/ btnCount;
    CGFloat h = self.height;
    CGFloat y = 0;
    for (NSInteger index = 0; index < btnCount; index++)
    {
        HHP4BarButton *btn = _barBtns[index];
        CGFloat x = index*w;
        btn.frame = CGRectMake(x, y, w, h);
    }
}


@end
