//
//  RunLoginVC.m
//  RunningLove
//
//  Created by admin on 17/2/13.
//  Copyright © 2017年 xuwenbo. All rights reserved.
//

#import "RunLoginVC.h"
#import "LoginViewController.h"


@interface RunLoginVC ()
{
    UIImageView *backGImg;
}
@end

@implementation RunLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    backGImg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    
    backGImg.image = [UIImage imageNamed:@"mainBackImg"];
    
    backGImg.userInteractionEnabled = YES;
    
    [self.view addSubview:backGImg];
    
    [self creatVc];
}
#pragma mark - 创建logo以及登陆注册按钮
- (void)creatVc{
    
    //logo图标
    UIImageView *logoImg = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/6, 20, kScreenWidth/3*2, kScreenWidth/8*5)];
    
    logoImg.image = [UIImage imageNamed:@"logoImage"];
    
    [backGImg addSubview:logoImg];
    
    //图标下的文字说明
    UILabel * logoLabel = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/6, CGRectGetMaxY(logoImg.frame)-25, kScreenWidth/3*2, 30)];
    
    logoLabel.text = @"    跑步, 如 爱 情 般 美 好 ~";
    
    logoLabel.font = [UIFont systemFontOfSize:15];
    
    logoLabel.textColor = KLoginOrange;
    
    logoLabel.textAlignment = NSTextAlignmentCenter;

    [backGImg addSubview:logoLabel];
    
    //登陆按钮
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    loginBtn.frame = CGRectMake(kScreenWidth/6, CGRectGetMaxY(logoLabel.frame)+40, kScreenWidth/3*2, 40);
    
    loginBtn.layer.cornerRadius = 5;
    
    loginBtn.clipsToBounds = YES;
    
    loginBtn.backgroundColor = KLoginYellow;
    
    [loginBtn setTitle:@"登 陆" forState:UIControlStateNormal];
    
    [loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [backGImg addSubview:loginBtn];
    
    //注册按钮
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    registerBtn.frame = CGRectMake(kScreenWidth/6, CGRectGetMaxY(loginBtn.frame)+20, kScreenWidth/3*2, 40);
    
    registerBtn.clipsToBounds = YES;
    
    registerBtn.layer.cornerRadius = 5;
    
    registerBtn.backgroundColor = [UIColor whiteColor];
    
    [registerBtn setTitleColor:KLoginYellow forState:UIControlStateNormal];
    
    [registerBtn setTitle:@"注 册" forState:UIControlStateNormal];
    
    [backGImg addSubview:registerBtn];
    
    //三方登陆
    UILabel *thirdLogin = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/6, CGRectGetMaxY(registerBtn.frame)+60, kScreenWidth/3*2, 20)];
    
    thirdLogin.font = [UIFont systemFontOfSize:13];
    
    thirdLogin.text = @"使用社交账号快速登陆";
    
    thirdLogin.textColor = [UIColor yellowColor];
    
    thirdLogin.textAlignment = NSTextAlignmentCenter;
    
    [backGImg addSubview:thirdLogin];
    
    UILabel *gangL = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/6, CGRectGetMaxY(registerBtn.frame)+90, kScreenWidth/3*2, 20)];
    
    gangL.font = [UIFont systemFontOfSize:13];
    
    gangL.text = @"/";
    
    gangL.textColor = [UIColor yellowColor];
    
    gangL.textAlignment = NSTextAlignmentCenter;
    
    [backGImg addSubview:gangL];
    
    
    //三方登陆图标
    UIImageView *weChatImg = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth/2-15, CGRectGetMaxY(thirdLogin.frame)+50, 30, 30)];
    
    weChatImg.image = [UIImage imageNamed:@"WeChatImg"];
    
    [backGImg addSubview:weChatImg];
    
}
#pragma mark - 登陆按钮点击回调
- (void)loginBtnClick{

    LoginViewController *loginVc = [[LoginViewController alloc]init];
    
    [self presentViewController:loginVc animated:YES completion:nil];
}

#pragma mark - 可以设置渐变颜色的 layer 层 作为背景色

-(CAGradientLayer *)backgroundLayer{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.bounds;
    gradientLayer.colors = @[(__bridge id)[UIColor grayColor].CGColor,(__bridge id)[UIColor grayColor].CGColor,(__bridge id)[UIColor grayColor].CGColor,(__bridge id)[UIColor grayColor].CGColor,(__bridge id)[UIColor whiteColor].CGColor,(__bridge id)[UIColor lightGrayColor].CGColor,(__bridge id)[UIColor grayColor].CGColor];
    gradientLayer.startPoint = CGPointMake(0.5, 0);
    gradientLayer.endPoint = CGPointMake(0.5, 1);
    gradientLayer.locations = @[@0.65,@1];
    return gradientLayer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
