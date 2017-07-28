//
//  HHP4BarButton.m
//  HHP4_ios
//
//  Created by tangdaojuan on 15/8/19.
//  Copyright (c) 2015年 tangdaojuan. All rights reserved.
//

#import "HHP4BarButton.h"
#import "HHP4BadgeButton.h"

#define KBatBtnImageScale 0.6

@interface HHP4BarButton ()

@property (nonatomic, strong) HHP4BadgeButton *badgeBtn;

@end

@implementation HHP4BarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        
        //文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        //文字的颜色
        [self setTitleColor:KBaseColor forState:UIControlStateSelected];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        //设置字体的颜色
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        
        //设置显示的最新的微博个数
        HHP4BadgeButton *badgeBtn = [[HHP4BadgeButton alloc] init];
        badgeBtn.hidden = YES;
        [self addSubview:badgeBtn];
        self.badgeBtn = badgeBtn;
        
    }
    return self;
}

- (void)setItem:(HHP4TabBarItem *)item
{
    _item = item;
    
    [self setTitle:item.title forState:UIControlStateNormal];
    
    [self setImage:item.image forState:UIControlStateNormal];
    
    [self setImage:item.selectedImage forState:UIControlStateSelected];
    
//    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
//    [item addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
//    [item addObserver:self forKeyPath:@"image" options:NSKeyValueObservingOptionNew context:nil];
//    [item addObserver:self forKeyPath:@"selectedImage" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)dealloc
{
//    [self removeObserver:self forKeyPath:@"title"];
//    [self removeObserver:self forKeyPath:@"badgeValue"];
//    [self removeObserver:self forKeyPath:@"image"];
//    [self removeObserver:self forKeyPath:@"selectedImage"];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    self.badgeBtn.badgeValue = self.item.badgeValue.integerValue;
    
    //设置按钮的文字
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];
    
    //设置按钮的图片
    [self setImage:self.item.image forState:UIControlStateNormal];
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat x = 0;
    CGFloat y = 5;
    CGFloat w = self.width;
    CGFloat h = self.height * KBatBtnImageScale - 5;
    return CGRectMake(x, y, w, h);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat x = 0;
    CGFloat y = self.height * KBatBtnImageScale + 5;
    CGFloat w = self.width;
    CGFloat h = self.height - y;
    return CGRectMake(x, y, w, h);
}

//去除高亮
- (void)setHighlighted:(BOOL)highlighted{ }

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.badgeBtn.x = self.width - self.badgeBtn.width - 10;
    self.badgeBtn.y = 0;
}



@end

@implementation HHP4TabBarItem

+ (HHP4TabBarItem *)itemWithTitle:(NSString *)title image:(UIImage *)image selectImage:(UIImage *)selectImage
{
    HHP4TabBarItem *item = [[HHP4TabBarItem alloc] init];
    item.title = title;
    item.image = image;
    item.selectedImage = selectImage;
    return item;
}

@end
