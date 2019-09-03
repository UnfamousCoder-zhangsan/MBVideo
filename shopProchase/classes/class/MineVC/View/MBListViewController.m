//
//  MBListViewController.m
//  shopProchase
//
//  Created by hi  kobe on 2019/8/29.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "MBListViewController.h"
#import "mineListTableViewCell.h"

@interface MBListViewController ()

@property (nonatomic, copy) void(^listScrollViewScrollBlock)(UIScrollView *scrollView);

@end

@implementation MBListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fd_prefersNavigationBarHidden];
    
    regist_nib(self.tableView, mineListTableViewCell);
}

#pragma mark - UITableViewDataSource & UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    mineListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mineListTableViewCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了动态cell");
}

#pragma mark - UIScrollViewDelgate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    !self.listScrollViewScrollBlock ? : self.listScrollViewScrollBlock(scrollView);
}

#pragma mark - GKPageListViewDelegate
- (UIScrollView *)listScrollView {
    return self.tableView;
}

- (void)listViewDidScrollCallback:(void (^)(UIScrollView * _Nonnull))callback {
    self.listScrollViewScrollBlock = callback;
}
-(BOOL)fd_prefersNavigationBarHidden{
    return YES;
}

@end
