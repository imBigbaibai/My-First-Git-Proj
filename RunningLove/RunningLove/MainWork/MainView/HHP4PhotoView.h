//
//  HHP4PhotoView.h
//  HHP4_ios
//
//  Created by tangdaojuan on 15/8/27.
//  Copyright (c) 2015年 tangdaojuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HHP4PhotoView;

@protocol HHP4PhotoViewDelegate <NSObject>

@optional

- (void)photoView:(HHP4PhotoView *)photoView image:(UIImage *)image index:(NSInteger)index;

@end

@interface HHP4PhotoView : UIView

@property (nonatomic, strong) UIButton *addButton;

- (void)addPhoto:(UIImage *)image;

- (NSMutableArray *)allPhoto;

- (void)deletePhoto:(NSInteger)index;

@property (nonatomic, assign) id<HHP4PhotoViewDelegate>delegate;

@end


