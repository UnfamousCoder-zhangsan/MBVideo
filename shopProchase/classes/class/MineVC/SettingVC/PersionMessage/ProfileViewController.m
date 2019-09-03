//
//  ProfileViewController.m
//  shopProchase
//
//  Created by hi  kobe on 2019/9/2.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()


@end

@implementation ProfileViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.profileTextView becomeFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.gk_navTitle = @"修改简介";
    UIBarButtonItem *leftItem= [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"whiteleft"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(backbuttonPressed)];
    self.gk_navLeftBarButtonItem = leftItem;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spacer.width = 20;
    self.gk_navRightBarButtonItems = @[spacer,rightItem];
    [self.gk_navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexString:@"FFFFFF"],
                                                    NSFontAttributeName : [UIFont systemFontOfSize:17]}];
    self.gk_navBackgroundColor = [UIColor colorWithHexString:@"282a34"];
    self.view.backgroundColor = [UIColor colorWithHexString:@"282a34"];
    self.profileTextView.backgroundColor = [UIColor grayColor];
    
    self.profileTextView.text = self.profileString;
    
}
-(void)backbuttonPressed{
    //返回按钮
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)rightClick{
    NSLog(@"点击了保存按钮");
}
//修改状态栏颜色
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
