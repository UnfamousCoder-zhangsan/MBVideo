//
//  MainTabBarViewController.m
//  shopProchase
//
//  Created by hi  kobe on 2019/8/15.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "MainTabBarViewController.h"

@interface MainTabBarViewController ()<UITabBarControllerDelegate,UITabBarDelegate>
@property (strong, nonatomic)UIView *bgView;

@end

@implementation MainTabBarViewController


//load 与 initialize调用时机不同

//+(void)initialize{
////    //    //设置tabbar 的字体大小
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#778899"],NSFontAttributeName:[UIFont systemFontOfSize:15]}  forState:UIControlStateNormal];
//
//        NSDictionary *textTitleOptions = @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F8F8FF"],NSFontAttributeName:[UIFont systemFontOfSize:17]};
//        [[UITabBarItem appearance] setTitleTextAttributes:textTitleOptions  forState:UIControlStateSelected];
//  //  [[UITabBarItem appearance] setTitlePositionAdjustment:UIOffsetMake(0, -TabBarHeight / 2 + 10)];
//}

+ (void)load{
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#778899"],NSFontAttributeName:[UIFont systemFontOfSize:15]}  forState:UIControlStateNormal];
    
    NSDictionary *textTitleOptions = @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F8F8FF"],NSFontAttributeName:[UIFont systemFontOfSize:17]};
    [[UITabBarItem appearance] setTitleTextAttributes:textTitleOptions  forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //声明代理
    self.delegate = self;
    //修改tabbar的背景颜色
    self.bgView = [[UIView alloc] initWithFrame:self.tabBar.bounds];
    self.bgView.backgroundColor = [UIColor clearColor];
    [self.tabBar insertSubview:self.bgView atIndex:0];
    self.selectedIndex = 0;
    //设置tabbar的位置
    self.tabBar.itemPositioning = UITabBarItemPositioningCentered;
    self.tabBar.backgroundImage = [self imageWithColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]];
    
}

/**
 登录的界面跳转
 **/
-(void)isLoginView{
    //是否登录
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:^{
        
    }];
}
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    NSString *title = viewController.tabBarItem.title;
    if (![title isEqualToString:@"首页"]) {
        //判断是否登录
        //[self isLoginView];
       self.bgView.backgroundColor = [UIColor colorWithHexString:@"#161823"];
        return YES;
    }else{
        //设置为透明
        self.bgView.backgroundColor = [UIColor clearColor];
        self.tabBar.backgroundImage = [self imageWithColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:0]];
        return YES;
    }
    
    return YES;
}
- (UIImage *)imageWithColor:(UIColor *)color {
    
        CGRect rect = CGRectMake(0.0f,0.0f, 1.0f,1.0f);
    
        UIGraphicsBeginImageContext(rect.size);
    
        CGContextRef context =UIGraphicsGetCurrentContext();
    
        CGContextSetFillColorWithColor(context, [color CGColor]);
    
        CGContextFillRect(context, rect);
    
        UIImage *image =UIGraphicsGetImageFromCurrentImageContext();

        UIGraphicsEndImageContext();
    
        return image;
    
}
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    //重新设置所有 item 的字体
    for (UITabBarItem *unSelItem in tabBar.items) {
        if (unSelItem == item) {//选中的设置他的状态
            NSDictionary *textTitleOptions = @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#F8F8FF"],NSFontAttributeName:[UIFont systemFontOfSize:17]};
            [item setTitleTextAttributes:textTitleOptions forState:UIControlStateNormal];
        }else {//未选中的设置他的状态
            NSDictionary *textTitleOptions = @{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#778899"],NSFontAttributeName:[UIFont systemFontOfSize:15]};
            [unSelItem setTitleTextAttributes:textTitleOptions forState:UIControlStateNormal];
        }
    }
}

@end
