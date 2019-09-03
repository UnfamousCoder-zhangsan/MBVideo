//
//  HomePageViewController.m
//  shopProchase
//
//  Created by hi  kobe on 2019/8/15.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "HomePageViewController.h"
#import "JXCategoryView.h"
#import "homeFocusViewController.h"
#import "homeCityViewController.h"
#import "UIViewController+GKCategory.h"

@interface HomePageViewController ()<JXCategoryViewDelegate>
@property (strong, nonatomic) UIView *navigationView;
@property (strong, nonatomic) UIButton *hotButton;
@property (strong, nonatomic) UIButton *cityButton;

@property (strong, nonatomic) JXCategoryDotView     *homeCategoryView;
@property (nonatomic, strong) NSArray               *titles;
@property (nonatomic, strong) NSArray               *homeChildVCs;

@end

@implementation HomePageViewController

-(UIView *)navigationView{
    if (!_navigationView) {
        _navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAV_HEIGHT + 30)];
        _navigationView.backgroundColor = [UIColor clearColor];
    }
    return _navigationView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *searchButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, 40, 40)];
    searchButton.backgroundColor = [UIColor clearColor];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 32, 20, 20)];
    imageView.backgroundColor = [UIColor clearColor];
    imageView.image = [UIImage imageNamed:@"search"];
   // [searchButton setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [searchButton addTarget:self action:@selector(searchButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.hotButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 50, 20, 40, 40)];
    self.hotButton.backgroundColor = [UIColor clearColor];
    [self.hotButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.hotButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self.hotButton setTitle:@"推荐" forState:UIControlStateNormal];
    [self.hotButton addTarget:self action:@selector(hotButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.cityButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 + 10, 20, 40, 40)];
    self.cityButton.backgroundColor = [UIColor clearColor];
    [self.cityButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.cityButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self.cityButton setTitle:@"同城" forState:UIControlStateNormal];
    [self.cityButton addTarget:self action:@selector(cityButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    self.hotButton.selected = YES;
    [self.navigationView addSubview:imageView];
    [self.navigationView addSubview:searchButton];
 //   [self.navigationView addSubview:self.hotButton];
  //  [self.navigationView addSubview:self.cityButton];
    [self.navigationView addSubview:self.homeCategoryView];
    [self.view addSubview:self.navigationView];
}

- (JXCategoryDotView *)homeCategoryView{
    if (!_homeCategoryView) {
        _homeCategoryView = [[JXCategoryDotView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - SCREEN_WIDTH / 4 + 20, 20, SCREEN_WIDTH / 2 - 40, 40.0f)];
        _homeCategoryView.backgroundColor = [UIColor clearColor];
        _homeCategoryView.titles = self.titles;
        _homeCategoryView.delegate = self;
        _homeCategoryView.titleColor = [UIColor lightGrayColor];
        _homeCategoryView.titleSelectedColor = [UIColor whiteColor];
        _homeCategoryView.titleFont = [UIFont systemFontOfSize:16.0f];
        _homeCategoryView.titleSelectedFont = [UIFont systemFontOfSize:18.0f];
        
        JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
        lineView.indicatorLineViewColor = [UIColor whiteColor];
        lineView.indicatorLineWidth = 20.0f;
        lineView.indicatorLineViewCornerRadius = 0;
        lineView.lineStyle = JXCategoryIndicatorLineStyle_Normal;
        _homeCategoryView.indicators = @[lineView];
        
        //_homeCategoryView.contentScrollView = self.scrollView;
        
        // 添加分割线
        UIView *btmLineView = [UIView new];
        btmLineView.frame = CGRectMake(0, 40 - 0.5, SCREEN_WIDTH, 0.5);
        btmLineView.backgroundColor = [UIColor clearColor];
        [_homeCategoryView addSubview:btmLineView];
    }
    return _homeCategoryView;
}

#pragma mark -GKPageScrollViewDelegate-
- (NSArray<id<GKPageListViewDelegate>> *)listViewsInPageScrollView:(GKPageScrollView *)pageScrollView {
    return self.homeChildVCs;
}



- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"同城", @"推荐"];
    }
    return _titles;
}
//搜索按钮点击事件
-(void)searchButtonClick{
    NSLog(@"搜索按钮点击事件");
}
//推荐按钮点击事件
-(void)hotButtonClick{
    self.hotButton.selected = YES;
    self.cityButton.selected = NO;
    NSLog(@"推荐按钮点击事件");
}
//同城按钮点击事件
-(void)cityButtonClick{
    self.hotButton.selected = NO;
    self.cityButton.selected = YES;
    NSLog(@"同城按钮点击事件");
}
- (NSArray *)homeChildVCs {
    if (!_homeChildVCs) {
        homeFocusViewController *homeFocusVC = [homeFocusViewController new];
        
        homeCityViewController *homeCityVC = [homeCityViewController new];
        
        _homeChildVCs = @[homeFocusVC, homeCityVC];
    }
    return _homeChildVCs;
}


//隐藏状态栏
-(BOOL)prefersStatusBarHidden{
    [super prefersStatusBarHidden];
    return YES;
}

@end
