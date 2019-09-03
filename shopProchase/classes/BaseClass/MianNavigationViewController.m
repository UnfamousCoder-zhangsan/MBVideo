//
//  MianNavigationViewController.m
//  shopProchase
//
//  Created by hi  kobe on 2019/8/15.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "MianNavigationViewController.h"

@interface MianNavigationViewController ()<UITabBarDelegate>

@end

@implementation MianNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        [[UINavigationBar appearance] setTranslucent:NO];
        //        [[UINavigationBar appearance] setBarStyle:UIBarStyleBlackOpaque];//打开隐藏导航栏下面的黑线
    }
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    //    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:242.0/255 green:34.0/255 blue:34.0/255 alpha:1]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    //    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
    //    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}];
   // [[UIBarButtonItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]} forState:UIControlStateNormal];
    
    
   // UIBarButtonItem *apperance = [UIBarButtonItem appearance];
    
    //uitextattributetextcolor替代方法
    
   // [apperance setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor blueColor]} forState:UIControlStateNormal];
    //设置tabbar文字的位置
    //不能写在tabbarcontroller中,要和NAv创建的时候一起写才有效果
    //self.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -TabBarHeight/2 + 10);
    
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        // 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /* 自动显示和隐藏tabbar */
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}


@end
