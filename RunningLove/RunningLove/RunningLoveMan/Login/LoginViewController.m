//
//  LoginViewController.m
//  RunningLove
//
//  Created by admin on 17/2/14.
//  Copyright © 2017年 xuwenbo. All rights reserved.
//

#import "LoginViewController.h"
#import "LYButton.h"

@interface LoginViewController ()
{
    UIImageView *backGrImg;
    UITextField *userNameTxt;
    UITextField *passWordTxt;
    
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    backGrImg = [[UIImageView alloc]initWithFrame:self.view.bounds];
//    
//    backGrImg.image = [UIImage imageNamed:@"logoBackImg"];
//    
//    backGrImg.userInteractionEnabled = YES;
//    
//    [self.view addSubview:backGrImg];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatUI];
    
    [self setupNavBar];
    
}
#pragma mark - 创建页面的输入框以及登陆按钮
- (void)creatUI
{
    //用户名
    UIImageView *uesrImg = [[UIImageView alloc]initWithFrame:CGRectMake(30, KNavHeight,25, 26)];
    
    uesrImg.image = [UIImage imageNamed:@"userImg"];
    
    [self.view addSubview:uesrImg];
    
    //
    UIView *uesrLine = [[UIView alloc]initWithFrame:CGRectMake(56, KNavHeight+26, kScreenWidth-85, 1)];
    
    uesrLine.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:uesrLine];
  
    //
    userNameTxt = [[UITextField alloc]init];
    
    userNameTxt.frame = CGRectMake(60, KNavHeight, kScreenWidth-90, 25);

    userNameTxt.placeholder = @"请输入手机号";
    
    userNameTxt.clearButtonMode = UITextFieldViewModeWhileEditing;

    
    //设置输入框placeholder 字体的颜色和大小
    [userNameTxt setValue:[UIColor lightGrayColor]  forKeyPath:@"_placeholderLabel.textColor"];

    [userNameTxt setValue:[UIFont systemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    
    [self.view addSubview:userNameTxt];
    
    //密码
    UIImageView *pwdImg = [[UIImageView alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(uesrImg.frame)+20, 25, 26)];
    
    pwdImg.image = [UIImage imageNamed:@"pwdImg"];
    
    [self.view addSubview: pwdImg];
    
    UIView *pwdLine = [[UIView alloc]initWithFrame:CGRectMake(56, CGRectGetMaxY(pwdImg.frame), kScreenWidth-85, 1)];
    
    pwdLine.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:pwdLine];
    
    //
    passWordTxt = [[UITextField alloc]initWithFrame:CGRectMake(60, CGRectGetMaxY(uesrImg.frame)+20, kScreenWidth-90, 25)];
   
    passWordTxt.placeholder = @"请输入密码";
    
    passWordTxt.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [passWordTxt setValue:[UIColor lightGrayColor]  forKeyPath:@"_placeholderLabel.textColor"];
    
    [passWordTxt setValue:[UIFont systemFontOfSize:13] forKeyPath:@"_placeholderLabel.font"];
    
    [self.view addSubview:passWordTxt];
    
    //自定义登陆按钮，拥有点击的小动画，block回调，回到登陆界面进行操作
    LYButton *loginButton = [[LYButton alloc]initWithFrame:CGRectMake(40, CGRectGetMaxY(pwdLine.frame)+20, kScreenWidth-80, 35)];
    
    [self.view addSubview:loginButton];
    
    loginButton.translateBlock = ^{
        [userNameTxt resignFirstResponder];
        [passWordTxt resignFirstResponder];
        
//        [self showHudInView:self.view];
        //在这里加请求时的判断
        if (userNameTxt.text.length>0 && userNameTxt.text != nil && passWordTxt.text != nil && passWordTxt.text.length >0) {
//            [self showTOPHudInView:@"213"];
        }
        
    };

}

#pragma mark - 隐藏本界面的手机状态栏
- (BOOL)prefersStatusBarHidden
{
    return NO;
}
#pragma mark - 设置导航栏
- (void)setupNavBar
{
    RLNavBar *navBar = [RLNavBar creatWithMainButton:@"ic_back" optionButton:nil Title:@"登陆"];
    navBar.backgroundColor = KLoginYellow;
    [self.view addSubview:navBar];
    __weak typeof(self) weakself = self;
    navBar.itemClicked = ^(NSInteger indexx){
        if (indexx == 0) {
            
            [weakself dismissViewControllerAnimated:YES completion:nil];
            
        }
    };
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [userNameTxt resignFirstResponder];
    [passWordTxt resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
