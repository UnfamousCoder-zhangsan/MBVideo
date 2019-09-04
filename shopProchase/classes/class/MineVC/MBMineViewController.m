//
//  MBMineViewController.m
//  shopProchase
//
//  Created by hi  kobe on 2019/9/2.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "MBMineViewController.h"
#import "SettingViewController.h"
#import <GKPageScrollView.h>
#import "GKNavigationBarViewController.h"
#import "MBListViewController.h"
#import "MBCollectionViewController.h"
#import "MBHeaderView.h"
#import "UIViewController+GKCategory.h"
#import "JXCategoryView.h"

@interface MBMineViewController ()<GKPageScrollViewDelegate,UIScrollViewDelegate,JXCategoryViewDelegate>

@property (nonatomic, strong) GKPageScrollView      *pageScrollView;

@property (nonatomic, strong) MBHeaderView        *headerView;

@property (nonatomic, strong) UIView                *pageView;
@property (nonatomic, strong) JXCategoryTitleView   *categoryView;
@property (nonatomic, strong) UIScrollView          *scrollView;

@property (nonatomic, strong) NSArray               *titles;
@property (nonatomic, strong) NSArray               *childVCs;

@property (nonatomic, strong) UILabel               *titleView;

@property (nonatomic, strong) UIButton              *menuButton;

@end

@implementation MBMineViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.gk_navBarAlpha = 0;
    self.gk_navBackgroundColor = [UIColor colorWithHexString:@"161822"];
    self.gk_navTitleView = self.titleView;
    self.gk_statusBarStyle = UIStatusBarStyleLightContent;
    self.gk_navLineHidden = YES;
    
    self.pageScrollView = [[GKPageScrollView alloc] initWithDelegate:self];
    
    self.pageScrollView.frame = self.view.bounds;
    [self.view addSubview:self.pageScrollView];
    [self fd_prefersNavigationBarHidden];//隐藏导航栏
    [self.pageScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self.gk_navigationBar addSubview:self.menuButton];
    
    //不能在这里刷新 返回时会闪动
    [self.pageScrollView reloadData];
    
    
}
//- (IBAction)messageButn:(id)sender {
//    SettingViewController *settingVC = [[SettingViewController alloc] init];
//    [self.navigationController pushViewController:settingVC animated:YES];
//}
#pragma mark -GKPageScrollViewDelegate-
- (UIView *)headerViewInPageScrollView:(GKPageScrollView *)pageScrollView {
    return self.headerView;
}

- (UIView *)pageViewInPageScrollView:(GKPageScrollView *)pageScrollView {
    return self.pageView;
}

- (NSArray<id<GKPageListViewDelegate>> *)listViewsInPageScrollView:(GKPageScrollView *)pageScrollView {
    return self.childVCs;
}
- (void)mainTableViewDidScroll:(UIScrollView *)scrollView isMainCanScroll:(BOOL)isMainCanScroll {
    // 导航栏显隐
    CGFloat offsetY = scrollView.contentOffset.y;
    // 0-200 0
    // 200 - KDYHeaderHeigh - kNavBarheight 渐变从0-1
    // > KDYHeaderHeigh - kNavBarheight 1
    CGFloat alpha = 0;
    if (offsetY < 200) {
        alpha = 0;
    }else if (offsetY > (kDYHeaderHeight - NavBarHeight)) {
        alpha = 1;
    }else {
        alpha = (offsetY - 200) / (kDYHeaderHeight - NavBarHeight - 200);
    }
    self.gk_navBarAlpha = alpha;
    self.titleView.alpha = alpha;
    NSLog(@"%f",self.titleView.alpha);
    //根据titleView的alpha值 改变nav 的背景颜色
    if (self.titleView.alpha > 0.87) {
        self.gk_navigationBar.backgroundColor = [UIColor colorWithHexString:@"161822"];
    }else{
        self.gk_navigationBar.backgroundColor = [UIColor clearColor];
    }
    
    [self.headerView scrollViewDidScroll:offsetY];
}

#pragma mark - JXCategoryViewDelegate
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"个人数据滑动    刷新数据");
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.pageScrollView horizonScrollViewWillBeginScroll];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self.pageScrollView horizonScrollViewDidEndedScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self.pageScrollView horizonScrollViewDidEndedScroll];
}

#pragma mark - 懒加载
- (GKPageScrollView *)pageScrollView {
    if (!_pageScrollView) {
        _pageScrollView = [[GKPageScrollView alloc] initWithDelegate:self];
    }
    return _pageScrollView;
}

- (MBHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[MBHeaderView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kDYHeaderHeight)];
    }
    return _headerView;
}

- (UIView *)pageView {
    if (!_pageView) {
        _pageView = [UIView new];
        _pageView.backgroundColor = [UIColor clearColor];
        
        [_pageView addSubview:self.categoryView];
        [_pageView addSubview:self.scrollView];
    }
    return _pageView;
}

- (JXCategoryTitleView *)categoryView {
    if (!_categoryView) {
        _categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40.0f)];
        _categoryView.backgroundColor = [UIColor colorWithHexString:@"#161822"];
        _categoryView.titles = self.titles;
        _categoryView.delegate = self;
        _categoryView.titleColor = [UIColor grayColor];
        _categoryView.titleSelectedColor = [UIColor whiteColor];
        _categoryView.titleFont = [UIFont systemFontOfSize:16.0f];
        _categoryView.titleSelectedFont = [UIFont systemFontOfSize:16.0f];
        
        JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
        lineView.indicatorLineViewColor = [UIColor yellowColor];
        lineView.indicatorLineWidth = 80.0f;
        lineView.indicatorLineViewCornerRadius = 0;
        lineView.lineStyle = JXCategoryIndicatorLineStyle_Normal;
        _categoryView.indicators = @[lineView];
        
        _categoryView.contentScrollView = self.scrollView;
        
        // 添加分割线
        UIView *btmLineView = [UIView new];
        btmLineView.frame = CGRectMake(0, 40 - 0.5, SCREEN_WIDTH, 0.5);
        btmLineView.backgroundColor = [UIColor grayColor];
        [_categoryView addSubview:btmLineView];
    }
    return _categoryView;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        CGFloat scrollW = SCREEN_WIDTH;
        CGFloat scrollH = SCREEN_HEIGHT - NAV_HEIGHT - 40.0f - TabBarHeight ;
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, scrollW, scrollH)];
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.delegate = self;
        _scrollView.showsHorizontalScrollIndicator = NO;
        
        [self.childVCs enumerateObjectsUsingBlock:^(UIViewController *vc, NSUInteger idx, BOOL * _Nonnull stop) {
            [self addChildViewController:vc];
            [self->_scrollView addSubview:vc.view];
            
            vc.view.frame = CGRectMake(idx * scrollW, 0, scrollW, scrollH);
        }];
        _scrollView.contentSize = CGSizeMake(self.childVCs.count * scrollW, 0);
        
    }
    return _scrollView;
}

- (NSArray *)titles {
    if (!_titles) {
        _titles = @[@"作品 129", @"动态 129", @"喜欢 591"];
    }
    return _titles;
}

- (NSArray *)childVCs {
    if (!_childVCs) {
        MBCollectionViewController *publishVC = [MBCollectionViewController new];
        
        MBListViewController *dynamicVC = [MBListViewController new];
        
        MBCollectionViewController *lovedVC = [MBCollectionViewController new];
        
        _childVCs = @[publishVC, dynamicVC, lovedVC];
    }
    return _childVCs;
}

- (UILabel *)titleView {
    if (!_titleView) {
        _titleView = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREEN_WIDTH / 2 - SCREEN_WIDTH / 4, SCREEN_WIDTH / 2, 44)];
        _titleView.font = [UIFont systemFontOfSize:18.0f];
        _titleView.textColor = [UIColor whiteColor];
        _titleView.textAlignment = NSTextAlignmentCenter;
        _titleView.text = @"❤️会说话的刘二豆❤️";
        _titleView.alpha = 0;
    }
    return _titleView;
}
- (UIButton *)menuButton {
    if (!_menuButton) {
        _menuButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 50, 20, 40, 40)];
        //[_menuButton setTitle:@"菜单" forState:UIControlStateNormal];
        [_menuButton setImage:[UIImage imageNamed:@"menuBtn"] forState:UIControlStateNormal];
    }
    return _menuButton;
}

//状态栏
-(BOOL)prefersStatusBarHidden{
    
    [super prefersStatusBarHidden];
    return NO;
}
@end
