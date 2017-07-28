//
//  HHP4BarButton.h
//  HHP4_ios
//
//  Created by tangdaojuan on 15/8/19.
//  Copyright (c) 2015年 tangdaojuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HHP4TabBarItem : NSObject
@property(nonatomic,copy) NSString *title;        // default is nil
@property(nonatomic,retain) UIImage *image;        // default is nil
@property (nonatomic, retain) UIImage *selectedImage;
@property (nonatomic, strong) NSString *badgeValue;

+ (HHP4TabBarItem *)itemWithTitle:(NSString *)title image:(UIImage *)image selectImage:(UIImage *)selectImage;

@end

@interface HHP4BarButton : UIButton

@property (nonatomic, weak) HHP4TabBarItem *item;

@end
