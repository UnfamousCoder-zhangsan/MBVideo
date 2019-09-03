//
//  MainViewController.m
//  shopProchase
//
//  Created by hi  kobe on 2019/8/15.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end
@implementation MainViewController
@synthesize rightbar,backView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.navigationController.viewControllers.count > 1) {
        [self setNavLeftBtnWithImg];
    }
    
    //    //取消自动布局
    //    if (SDKLV >= 7.0) {
    //        self.edgesForExtendedLayout = UIRectEdgeNone;
    //    }
    //    if (SDKLV > 7.0) {
    //        self.automaticallyAdjustsScrollViewInsets = NO;
    //        //透明状态栏的延伸
    //        self.edgesForExtendedLayout = UIRectEdgeNone;
    //        //设置导航栏背景图
    //        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    //    }else {
    //        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@""] forBarMetrics:UIBarMetricsDefault];
    //        //#warning 注释掉的勿删，有需求可直接使用
    //        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],NSFontAttributeName : [UIFont boldSystemFontOfSize:10]};
    //    }
    //    self.navigationController.navigationBar.barTintColor = FatherColor;
    //    // 添加上这一句，可以去掉导航条下边的黑线
    if (self.navigationController.navigationBar) {
        [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    }
    
    //    self.navigationController.navigationBar.translucent = NO;
    //userinfo用static,让都有的子类共用
    //static
}
-(UIWindow*)mainWindow{
    id appDelegate = [UIApplication sharedApplication].delegate;
    if (appDelegate && [appDelegate respondsToSelector:@selector(window)]) {
        return [appDelegate window];
    }
    
    
    NSArray *windows = [UIApplication sharedApplication].windows;
    if ([windows count] == 1) {
        return [windows firstObject];
    } else {
        for (UIWindow *window in windows) {
            if (window.windowLevel == UIWindowLevelNormal) {
                return window;
            }
        }
    }
    
    return nil;
}
//点击return 按钮 去掉
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}

//点击屏幕空白处去掉键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [self hiddenTabBar];
    //这里检测是否登录，为登录则弹出登录界面
    //    if(){
    //
    //    }
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated {
    
    [super viewDidDisappear:animated];
    
}


#pragma mark - 隐藏tabbar
- (void)hiddenTabBar {
    self.tabBarController.hidesBottomBarWhenPushed = YES;
}

#pragma mark - 设置导航栏字体颜色
- (void)setNavViewTitleColor:(NSObject *) color {
    NSMutableDictionary *navTitleStype = [[NSMutableDictionary alloc] init];
    //title颜色
    [navTitleStype setObject:color forKey:NSForegroundColorAttributeName];
    [self.navigationController.navigationBar setTitleTextAttributes:navTitleStype];
}

#pragma mark - 修改导航栏返回按钮
- (void)setNavLeftBtnWithImg {
    UIBarButtonItem *barbtnLeft = [[UIBarButtonItem alloc] init];
    backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
    backView.opaque = YES;
    [backView setBackgroundColor:[UIColor clearColor]];
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(2, 3, 30  , 30)];
    //#warning 注意修改图片
    //    NSString *path = [[NSBundle mainBundle] pathForResource:@"backarrow" ofType:@"png"];
    [imageview setImage:[UIImage imageNamed:@"backleft"]];
    [backView addSubview:imageview];
    [barbtnLeft setCustomView:backView];
    UITapGestureRecognizer *tapges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backAction)];
    [backView addGestureRecognizer:tapges];
    self.navigationItem.leftBarButtonItem = barbtnLeft;
}
#pragma mark - 修改导航栏左按钮图片
- (void)setNavLeftBtnWithImgName:(NSString *)string andPictureWidth:(float)width andPictureHeight:(float)height {
    UIBarButtonItem *barbtnLeft = [[UIBarButtonItem alloc] init];
    backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
    backView.opaque = YES;
    [backView setBackgroundColor:[UIColor clearColor]];
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(2, 3, width  , height)];
    //#warning 注意修改图片
    //    NSString *path = [[NSBundle mainBundle] pathForResource:string ofType:@"png"];
    [imageview setImage:[UIImage imageNamed:string]];
    [backView addSubview:imageview];
    [barbtnLeft setCustomView:backView];
    UITapGestureRecognizer *tapges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backAction)];
    [backView addGestureRecognizer:tapges];
    self.navigationItem.leftBarButtonItem = barbtnLeft;
}

#pragma mark - 返回事件
- (void)backAction {
    //    DLog(@"Back");
    [self.navigationController popViewControllerAnimated:YES];
    //#warning 返回是终止请求，按需求修改
    //    [self cancelAllNetworkRequest];
    //    [self removeLoadingView];
    [self.view removeFromSuperview];
}
#pragma mark - 导航栏左侧按钮（文字）
- (void)setNavLeftBtnWithString:(NSString *)string andStringColor:(UIColor *)color andStringFont:(float)font {
    UIBarButtonItem *barbtnLeft = [[UIBarButtonItem alloc] init];
    backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 65, 25)];
    [backView setBackgroundColor:[UIColor clearColor]];
    UILabel *stringLab = [[UILabel alloc] initWithFrame:CGRectMake(0, (backView.frame.size.height - 10.0)/2, 55, 18)];
    stringLab.text = string;
    stringLab.textColor = color;
    stringLab.font = [UIFont systemFontOfSize:font];
    
    CGSize signLabSize = [ZZStringSize getSizeToString:stringLab.text forFont:[UIFont systemFontOfSize:font] constrainedToSize:CGSizeMake(CGRectGetWidth(backView.frame), 21) lineBreakMode:1];
    CGRect signLabRect = stringLab.frame;
    signLabRect.size.width = signLabSize.width;
    stringLab.frame = signLabRect;
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(stringLab.frame)+2, CGRectGetMinY(stringLab.frame) + 5, 10, 7)];
    image.image = [UIImage imageNamed:@"arrowreddown.png"];
    [backView addSubview:stringLab];
    [backView addSubview:image];
    
    backView.frame = CGRectMake(0, 0, CGRectGetWidth(stringLab.frame) + 15, 25);
    [barbtnLeft setCustomView:backView];
    
    UITapGestureRecognizer *tapges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(navLeftClicked)];
    [backView addGestureRecognizer:tapges];
    self.navigationItem.leftBarButtonItem = barbtnLeft;
}
#pragma mark - 导航栏左侧按钮点击事件
- (void)navLeftClicked {
    
}

#pragma mark - 修改导航栏右边按钮
- (void)setNavRightBtnWithImgName:(NSString *)imagename andPictureWidth:(float)width andPictureHeight:(float)height {
    UIBarButtonItem *barbtnLeft = [[UIBarButtonItem alloc] init];
    UIView *rightview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 44.0, 44.0)];
    [rightview setBackgroundColor:[UIColor clearColor]];
    _rightImage = [[UIImageView alloc] initWithFrame:CGRectMake(rightview.frame.size.width - 26.0, (rightview.frame.size.height - 20.0) / 2 -3, width, height)];
    [_rightImage setImage:[UIImage imageNamed:imagename]];
    [rightview addSubview:_rightImage];
    self.rightRedIamge = [[UIImageView alloc] initWithFrame:CGRectMake(self.rightImage.frame.size.width - 3, 0, 6, 6)];
    self.rightRedIamge.layer.cornerRadius = 3;
    self.rightRedIamge.layer.masksToBounds = YES;
    self.rightRedIamge.backgroundColor = [UIColor redColor];
    [self.rightImage addSubview:self.rightRedIamge];
    self.rightRedIamge.hidden = YES;
    [barbtnLeft setCustomView:rightview];
    UITapGestureRecognizer *tapges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightAction)];
    [rightview addGestureRecognizer:tapges];
    self.navigationItem.rightBarButtonItem = barbtnLeft;
}


- (void)setNavRightBtnWithImgNameanother:(NSString *)imagename andPictureWidth:(float)width andPictureHeight:(float)height {
    UIBarButtonItem *barbtnLeft = [[UIBarButtonItem alloc] init];
    
    UIView *rightview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, 44.0)];
    [rightview setBackgroundColor:[UIColor clearColor]];
    _rightImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, (rightview.frame.size.height - 30.0) / 2, width, height)];
    [_rightImage setImage:[UIImage imageNamed:imagename]];
    [rightview addSubview:_rightImage];
    [barbtnLeft setCustomView:rightview];
    UITapGestureRecognizer *tapges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightAction)];
    [rightview addGestureRecognizer:tapges];
    self.navigationItem.rightBarButtonItem = barbtnLeft;
}

//    UIBarButtonItem *fixedSpaceBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    fixedSpaceBarButtonItem.width = 12;
//
//    self.navigationItem.rightBarButtonItems = @[self.messageBtn,fixedSpaceBarButtonItem,self.mapBtn];
//
//}
#pragma mark - 修改导航栏右边按钮，返回按钮以添加多个按钮
- (UIBarButtonItem *)setNavRightBtnWithImgName2:(NSString *)imagename andTag:(NSInteger)tag andPictureWidth:(float)width andPictureHeight:(float)height {
    UIBarButtonItem *barbtnLeft = [[UIBarButtonItem alloc] init];
    UIView *rightview = [[UIView alloc]initWithFrame:CGRectMake(-20, 0, 44.0, 44.0)];
    [rightview setBackgroundColor:[UIColor clearColor]];
    _rightImage = [[UIImageView alloc] initWithFrame:CGRectMake(rightview.frame.size.width - 26.0, (rightview.frame.size.height - 20.0) / 2, width, height)];
    [_rightImage setImage:[UIImage imageNamed:imagename]];
    [rightview addSubview:_rightImage];
    [barbtnLeft setCustomView:rightview];
    rightview.tag = tag;
    UITapGestureRecognizer *tapges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightAction)];
    [rightview addGestureRecognizer:tapges];
    return barbtnLeft;
}

#pragma mark - 修改导航栏右边按钮(文字类型)
- (void)setNavRightBtnWithString:(NSString *)string {
    rightbar = [[UIBarButtonItem alloc]init];
    [rightbar setTitle:string];
    [rightbar setTarget:self];
    [rightbar setAction:@selector(rightAction)];
    [self setNavRightTitleColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = rightbar;
}

#pragma mark - 修改导航栏右边按钮(view类型)
- (void)setNarRightBtnWithView:(UIView *)view {
    UIBarButtonItem *barbtnLeft = [[UIBarButtonItem alloc] init];
    [barbtnLeft setCustomView:view];
    UITapGestureRecognizer *tapges = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(rightAction)];
    [view addGestureRecognizer:tapges];
    self.navigationItem.rightBarButtonItem = barbtnLeft;
}

#pragma mark - 设置右导航字体颜色
- (void)setNavRightTitleColor:(UIColor *)Color {
    NSMutableDictionary *textDic = [[NSMutableDictionary alloc] init];
    [textDic setObject:[UIFont systemFontOfSize:15.0] forKey:NSFontAttributeName];
    [textDic setObject:Color forKey:NSForegroundColorAttributeName];
    [rightbar setTitleTextAttributes:textDic forState:UIControlStateNormal];
}
#pragma mark - 右导航点击事件
- (void)rightAction {
    NSLog(@"右导航点击");
}

#pragma mark - 修改导航栏titleView
- (void)setNavTitleView:(UIView *)titleview {
    self.navigationItem.titleView = titleview;
}
-(void)islogviiew{
    //登陆界面
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self.tabBarController presentViewController:loginVC animated:YES completion:^{
        
    }];
}

@end
