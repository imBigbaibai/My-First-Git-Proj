//
//  HHP4BadgeButton.m
//  HHP4_ios
//
//  Created by tangdaojuan on 15/8/19.
//  Copyright (c) 2015年 tangdaojuan. All rights reserved.
//

#import "HHP4BadgeButton.h"

@implementation HHP4BadgeButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.titleLabel.font = [UIFont systemFontOfSize:10];
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        self.size = self.currentBackgroundImage.size;
        self.userInteractionEnabled = NO;
    }
    return self;
}

- (void)setBadgeValue:(NSInteger)badgeValue
{
    _badgeValue = badgeValue;
    if (badgeValue) {
        self.hidden = NO;
        if (badgeValue > 100) {
            [self setTitle:@"N" forState:UIControlStateNormal];
        }
        else
        {
            [self setTitle:[NSString stringWithFormat:@"%zd",badgeValue] forState:UIControlStateNormal];
        }
        [UIApplication sharedApplication].applicationIconBadgeNumber = badgeValue;
    }
    else
    {
        self.hidden = YES;
    }
    
}


@end
