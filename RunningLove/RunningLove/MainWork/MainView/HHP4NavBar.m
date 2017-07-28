//
//  HHP4NavBarView.m
//  HHP4_ios
//
//  Created by tangdaojuan on 15/8/19.
//  Copyright (c) 2015年 tangdaojuan. All rights reserved.
//

#import "HHP4NavBar.h"
#import "UIImage+Runlove.h"

@implementation HHP4NavBar

+ (HHP4NavBar *)creatWithMainButton:(NSString *)mainButton optionButton:(NSArray *)buttons Title:(NSString *)title
{
    HHP4NavBar *nav = [[HHP4NavBar alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    nav.backgroundColor = KBaseColor;
    NSMutableArray *array=[NSMutableArray array];
    
    //创建左侧主按钮
    UIButton *main=[[UIButton alloc]initWithFrame:CGRectMake(5, 31, 45, 30)];
    [nav addSubview:main];
    [main setBackgroundImage:[UIImage imageNamed:mainButton] forState:UIControlStateNormal];
    main.tag=0;
    [main addTarget:nav action:@selector(actionButton:) forControlEvents:UIControlEventTouchUpInside];
    [array addObject:main];
    
    //添加标题
    if (title) {
        UILabel *l=[[UILabel alloc]initWithFrame:CGRectMake(60, 21, kScreenWidth-120, 40)];
        l.font=[UIFont systemFontOfSize:17.0f];
        l.textAlignment = NSTextAlignmentCenter;
        l.textColor=[UIColor whiteColor];
        l.text=title;
        [nav addSubview:l];
        nav.titleLabel=l;
    }
    
    //创建右侧按钮
    if(buttons){
        for (int i=0; i<buttons.count; i++) {
//            UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth-65-60*i, 28, 60, 40)];
            UIButton *btn=[[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth-75-60*i, 28, 70, 40)];

            NSString *str=buttons[buttons.count-i-1];
            if (str) {
                if ([[str substringToIndex:1] isEqualToString:@"<"]&&[[str substringFromIndex:str.length-1] isEqualToString:@">"]) {
                    [btn setTitle:[str  substringWithRange:NSMakeRange(1, str.length-2)] forState:UIControlStateNormal];
                    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    [btn setTitleColor:HColorWithAlpha(0xFFFFFF, 0.5) forState:UIControlStateDisabled];
                    btn.titleLabel.font=[UIFont boldSystemFontOfSize:14.0f];
                }else{
                    btn.frame = CGRectMake(kScreenWidth-30-60*i, 45,20, 14);
                    NSString *nameBtn = buttons[buttons.count-i-1];
                    if ([nameBtn isEqualToString:@"search"]) {
                        btn.frame = CGRectMake(kScreenWidth-40-60*i, 42,30, 20);
                    }else if ([nameBtn isEqualToString:@"fresh.png"]){
                        btn.frame = CGRectMake(kScreenWidth-40-60*i, 42,20, 20);
                    }else if ([nameBtn isEqualToString:@"add_white"]){
                        btn.frame = CGRectMake(kScreenWidth-40-60*i, 35,23, 23);
                    }
                    [btn setBackgroundImage:[UIImage imageNamed:buttons[buttons.count-i-1]] forState:UIControlStateNormal];
                }
            }
            btn.tag=buttons.count-i;
            [array addObject:btn];
            [btn addTarget:nav action:@selector(actionButton:) forControlEvents:UIControlEventTouchUpInside];
            
            [nav addSubview:btn];
        }
    }
    
    nav.buttonArray=[NSArray arrayWithArray:array];
    
    return nav;

}

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    _itemColor=[UIColor whiteColor];
    return self;
}

-(void)setItemColor:(UIColor *)itemColor{
    _itemColor=itemColor;
    
    for (UIButton *button in self.buttonArray) {
        UIImageView *imgView = [[UIImageView alloc]init];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.userInteractionEnabled = YES;
        imgView.image= button.currentBackgroundImage;
        [button setImage:[imgView.image imageWithTintColor:itemColor] forState:UIControlStateNormal];
    }
    
    self.titleLabel.textColor=itemColor;
}

- (void)setItemTitleColor:(UIColor *)itemTitleColor
{
    _itemTitleColor = itemTitleColor;
    
    for (UIButton *button in self.buttonArray) {
        [button setTitleColor:itemTitleColor forState:UIControlStateNormal];
    }
}

- (void)actionButton:(UIButton *)sender
{
    if (self.itemClicked) {
        self.itemClicked([sender tag]);
    }
}


@end
