//
//  RunningViewController.m
//  RunningLove
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 xuwenbo. All rights reserved.
//

#import "RunningViewController.h"
#import "UIBarButtonItem+BarItem.h"

@interface RunningViewController ()

@end

@implementation RunningViewController

//这个方法只会调用一次
+ (void)initialize
{
    //设置导航条的主题
    [self setNavUpTheme];
    
    //设置导航栏按钮的主题
    //    [self setNavUpBtnTheme];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.interactivePopGestureRecognizer.delegate = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//设置导航条的主题
+ (void)setNavUpTheme
{
    
}

//设置导航栏按钮的主题
+ (void)setNavUpBtnTheme
{
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        //跳转的时候隐藏掉 tabbar
        //        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itmeWitImage:@"navigationbar_back" hightImage:@"navigationbar_back_highlighted" target:self action:@selector(back)];
    }
    [super pushViewController:viewController animated:YES];
    
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}


@end
