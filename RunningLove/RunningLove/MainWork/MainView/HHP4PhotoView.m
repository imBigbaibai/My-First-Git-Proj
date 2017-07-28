//
//  HHP4PhotoView.m
//  HHP4_ios
//
//  Created by tangdaojuan on 15/8/27.
//  Copyright (c) 2015年 tangdaojuan. All rights reserved.
//

#import "HHP4PhotoView.h"

#define KPhotoViewButtonViewW 60
#define KPhotoViewButtonViewH KPhotoViewButtonViewW

@interface HHP4PhotoView ()

@end

@implementation HHP4PhotoView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _addButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, KPhotoViewButtonViewW, KPhotoViewButtonViewH)];
        [_addButton setBackgroundImage:[UIImage imageNamed:@"camare"] forState:UIControlStateNormal];

        [self addSubview:_addButton];
    }
    return self;
}

- (void)addPhoto:(UIImage *)image
{
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self addSubview:imageView];
    imageView.userInteractionEnabled = YES;
    [self setNeedsLayout];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [imageView addGestureRecognizer:tap];
}

- (NSMutableArray *)allPhoto
{
    NSMutableArray *photos = [NSMutableArray arrayWithCapacity:self.subviews.count - 1];
    for (NSInteger index = 0; index < self.subviews.count; index ++) {
        UIView *view = self.subviews[index];
        if ([view isKindOfClass:[UIImageView class]]) {
            [photos addObject:view];
        }
    }
    return photos;
}

- (void)tap:(UITapGestureRecognizer *)gesture
{
    UIImageView *imageView = self.subviews[gesture.view.tag];
    if ([self.delegate respondsToSelector:@selector(photoView:image:index:)]) {
        [self.delegate photoView:self image:imageView.image index:gesture.view.tag];
    }
}

- (void)deletePhoto:(NSInteger)index
{
    if (index >0) {
        UIView *view = self.subviews[index];
        [view removeFromSuperview];
        [self setNeedsLayout];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat maxX = 0;
    CGFloat margin = 5;
    for (NSInteger index = 0; index < self.subviews.count; index ++) {
        UIView *view = self.subviews[index];
        if ([view isKindOfClass:[UIImageView class]]) {
            CGFloat x = margin * index + (index - 1) * KPhotoViewButtonViewW;
            view.frame = CGRectMake(x, 0, KPhotoViewButtonViewW, KPhotoViewButtonViewH);
            view.tag = index;
            maxX = CGRectGetMaxX(view.frame);
        }
    }
    self.addButton.x = maxX + margin;
    self.addButton.hidden = self.subviews.count >= 4 ? YES : NO;
}

@end
