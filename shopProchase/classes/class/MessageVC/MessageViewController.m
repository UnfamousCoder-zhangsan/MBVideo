//
//  MessageViewController.m
//  shopProchase
//
//  Created by hi  kobe on 2019/8/15.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "MessageViewController.h"
#import "newsTableViewCell.h"

@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) UITableView *mainTableView;
@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"新闻";
    self.backView.backgroundColor = [UIColor blackColor];
    
    
    regist_nib(self.mainTableView, newsTableViewCell);
    
    
}
- (UITableView *)mainTableView{
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,NavBarHeight, SCREEN_WIDTH, SCREEN_HEIGHT - NavBarHeight - TabBarHeight)];
    }
    return _mainTableView;
}

#pragma mark --UITableViewDelegate,UITableViewDataSource--

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


//状态栏
-(BOOL)prefersStatusBarHidden{
    [super prefersStatusBarHidden];
    return NO;
}


@end
