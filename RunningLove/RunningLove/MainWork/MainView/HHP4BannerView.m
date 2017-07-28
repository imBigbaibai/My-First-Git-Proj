//
//  HHP4BannerView.m
//  HHP4_ios
//
//  Created by tangdaojuan on 15/8/19.
//  Copyright (c) 2015年 tangdaojuan. All rights reserved.
//

#import "HHP4BannerView.h"

@interface HHP4BannerView()<UIScrollViewDelegate>
{
    UIPageControl *_pageControl;     //滚动视图索引
    UIScrollView *_scrollerView;     //滚动视图
}

@end

@implementation HHP4BannerView

#pragma mark - 初始化方法

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"释放引导页内存");
}

- (void)setImageArray:(NSArray *)imageArray
{
    _imageArray = imageArray;
    
    //添加视图
    [self setupView];
    
}

#pragma mark 添加视图

/**
 *  添加视图
 */
- (void)setupView
{
    //添加图片
    [self setupImageView];
    if (self.imageArray.count > 1) {
        //添加索引
        [self setupPageControl];
    }
}
/**
 *  添加图片
 */
- (void)setupImageView
{
    _scrollerView = [[UIScrollView alloc] init];
    _scrollerView.delegate = self;
    _scrollerView.showsHorizontalScrollIndicator = NO;
    _scrollerView.showsVerticalScrollIndicator = NO;
    _scrollerView.pagingEnabled = YES;
    _scrollerView.contentSize = CGSizeMake(self.width*self.imageArray.count, 0);
    [self addSubview:_scrollerView];
    
    for (NSInteger index = 0; index < self.imageArray.count; index++) {
        NSString *imageName = self.imageArray[index];
        [self createImageWithName:imageName];
    }
}

/**
 *  创建照片
 *
 *  @param imageName 图片名称
 */
- (void)createImageWithName:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:imageName];
    [_scrollerView addSubview:imageView];
}
/**
 *  添加索引
 */
- (void)setupPageControl
{
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.numberOfPages = self.imageArray.count;
    [_pageControl setCurrentPageIndicatorTintColor:HColor(0xadadad)];
    [_pageControl setPageIndicatorTintColor:HColor(0xdfdfdf)];
    [_pageControl addTarget:self action:@selector(pageControlTap:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_pageControl];
}

#pragma mark - 添加索引事件

- (void)pageControlTap:(UIPageControl *)sender
{
    [UIView animateWithDuration:0.25 animations:^{
        _scrollerView.contentOffset = CGPointMake(sender.currentPage*self.width, 0);
    }];
}

#pragma mark - 委托方法

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    _pageControl.currentPage = (int)(scrollView.contentOffset.x / scrollView.frame.size.width);
}

#pragma mark - 布局视图

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _scrollerView.frame = CGRectMake(0, 0, self.width, self.height);
    
    CGFloat imageViewY = 0;
    CGFloat imageViewW = self.width;
    CGFloat imageViewH = self.height;
    for (NSInteger index = 0; index < self.imageArray.count; index++) {
        UIImageView *img = _scrollerView.subviews[index];
        CGFloat imageViewX = index * self.width;
        img.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    }
    
    _pageControl.frame = CGRectMake(0, self.height - 20, self.width, 20);
}

@end
