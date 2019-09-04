//
//  LoginViewController.m
//  shopProchase
//
//  Created by hi  kobe on 2019/8/15.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "LoginViewController.h"
#import "ForgetPasswordVC.h"
#import "RegisterViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *phoneView;
@property (weak, nonatomic) IBOutlet UITextField *textfieldPhone;
@property (weak, nonatomic) IBOutlet UIView *passwordView;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *textfieldPassword;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.phoneView.layer.cornerRadius = 45 / 2;
    self.phoneView.layer.masksToBounds = YES;
    self.phoneView.layer.borderWidth = 1;
    self.phoneView.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.passwordView.layer.cornerRadius = 45 / 2;
    self.passwordView.layer.masksToBounds = YES;
    self.passwordView.layer.borderWidth  = 1;
    self.passwordView.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.loginButton.layer.cornerRadius = 45 / 2;
    self.loginButton.layer.masksToBounds = YES;
    
}
- (IBAction)closeColck:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        [self.navigationController popToRootViewControllerAnimated:YES];
        NSMutableArray *vcs = [self.navigationController.viewControllers mutableCopy];
        [vcs removeAllObjects];
        MainTabBarViewController *tab = (MainTabBarViewController *) [UIApplication sharedApplication].keyWindow.rootViewController;
        tab.selectedIndex = 0;
        
    }];
}
- (IBAction)forgetPassword:(UIButton *)sender {
    ForgetPasswordVC *forgetVC = [[ForgetPasswordVC alloc] init];
    [self presentViewController:forgetVC animated:YES completion:^{
    }];
}
- (IBAction)userRegisterCikck:(UIButton *)sender {
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    [self presentViewController:registerVC animated:YES completion:^{
        
    }];
}
- (IBAction)loginButtonCilck:(UIButton *)sender {
    [AlertUtils error:@"点击了登陆"];
    [self.navigationController popToRootViewControllerAnimated:YES];
    NSMutableArray *vcs = [self.navigationController.viewControllers mutableCopy];
    [vcs removeAllObjects];
    [self dismissViewControllerAnimated:YES completion:^{
        MainTabBarViewController *tab = (MainTabBarViewController *) [UIApplication sharedApplication].keyWindow.rootViewController;
        tab.selectedIndex = 0;
    }];
    //进入首页
}

- (IBAction)qqLogin:(UIButton *)sender {
    [AlertUtils error:@"点击了QQ登陆"];
}
- (IBAction)weixinLogin:(UIButton *)sender {
    
    [AlertUtils error:@"点击了微信登陆"];
}


@end
