//
//  SettingViewController.m
//  shopProchase
//
//  Created by hi  kobe on 2019/8/19.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "SettingViewController.h"
#import "personTableViewCell.h"
#import "BRPickerView.h"
#import "GKPhotoBrowser.h"


#import "NameViewController.h"
#import "CountViewController.h"
#import "ProfileViewController.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (strong, nonatomic)UIView  *navgationView;
@property (strong, nonatomic)NSMutableArray *leftArray; //个人资料左侧按钮
@property (strong, nonatomic)NSMutableArray *rightArray; //右侧文字
@property (strong, nonatomic)UIImageView    *headerImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topHeight;
@property (copy, nonatomic) NSString *sexString; //性别
@property (copy, nonatomic) NSString *brString; //生日
@property (assign, nonatomic)NSArray *imageArray;

@end

@implementation SettingViewController
-(NSMutableArray *)leftArray{
    if (!_leftArray) {
        _leftArray = [NSMutableArray arrayWithObjects:@"昵称",@"账号",@"简介",@"学校",@"性别",@"生日",@"地区", nil];
    }
    return _leftArray;
}
-(NSMutableArray *)rightArray{
    if (!_rightArray) {
        _rightArray = [NSMutableArray arrayWithObjects:@"测试昵称",@"测试账号",@"测试简介",@"测试学校",@"",@"测试生日",@"测试地区", nil];
    }
    return _rightArray;
}
-(UIView *)navgationView{
    if (!_navgationView) {
        _navgationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NAV_HEIGHT)];
        _navgationView.backgroundColor = [UIColor colorWithHexString:@"#161823"];
    }
    return _navgationView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self fd_prefersNavigationBarHidden];
    [self.view addSubview:self.navgationView];
    self.topHeight.constant = NavBarHeight;
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftbutton.frame = CGRectMake(-5, NAV_HEIGHT-38, 60, 30);
    [leftbutton setImage:[UIImage imageNamed:@"whiteleft"] forState:UIControlStateNormal];
    [leftbutton addTarget:self action:@selector(backbuttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.navgationView addSubview:leftbutton];
    
    UILabel *navLine = [[UILabel alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT - 1, SCREEN_WIDTH, 0.5)];
    navLine.backgroundColor = [UIColor colorWithHexString:@"#282a34"];
    [self.navgationView addSubview:navLine];
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - (SCREEN_WIDTH - 200) /2 , CGRectGetMinY(leftbutton.frame), SCREEN_WIDTH-200, 30)];
    titleLabel.text = @"编辑个人资料";
    titleLabel.font = [UIFont systemFontOfSize:17];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.navgationView addSubview:titleLabel];
    
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.mainTableView.backgroundColor = [UIColor colorWithHexString:@"#161823"];
    regist_nib(self.mainTableView,personTableViewCell);
    [self settingHeaderView];
}
-(void)settingHeaderView{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_HEIGHT, 200)];
    headerView.backgroundColor = [UIColor colorWithHexString:@"#161823"];
    
    //头像
    self.headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2  - 60, 25, 120, 120)];
    self.headerImageView.layer.cornerRadius = 60;
    self.headerImageView.layer.masksToBounds = YES;
    self.headerImageView.image = [UIImage imageNamed:@"dy_icon"];
    self.headerImageView.backgroundColor  =[UIColor grayColor];
    
    //点击头像按钮
    UIButton *headerButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2 - 60, 25, 120, 120)];
    [headerButton setTitle:@"" forState:UIControlStateNormal];
    headerButton.backgroundColor = [UIColor clearColor];
    [headerButton addTarget:self action:@selector(headerCilck) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIImageView *photoImage = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH /2 -15, 70, 30, 30)];
    photoImage.backgroundColor = [UIColor clearColor];
    photoImage.image = [UIImage imageNamed:@"photoImage"];
    [headerView addSubview:photoImage];
    
    //修改头像按钮
    UIButton *modifyButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2  - 60, 155, 120, 25)];
    [modifyButton setTitle:@"点击更换头像" forState:UIControlStateNormal];
    modifyButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [modifyButton setTitleColor:[UIColor colorWithHexString:@"#5a5c63"] forState:UIControlStateNormal];
    [modifyButton addTarget:self action:@selector(headerCilck) forControlEvents:UIControlEventTouchUpInside];
    
    //
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 195, SCREEN_WIDTH - 20, 1)];
    lineLabel.backgroundColor = [UIColor colorWithHexString:@"#282a34"];
    
    [headerView addSubview:lineLabel];
    [headerView addSubview:headerButton];
    [headerView addSubview:modifyButton];
    [headerView addSubview:self.headerImageView];
    [headerView bringSubviewToFront:photoImage];
    self.mainTableView.tableHeaderView = headerView;
}
-(BOOL)fd_prefersNavigationBarHidden{
    return YES;
}
-(void)backbuttonPressed{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)headerCilck{
    NSLog(@"点击修改头像按钮");
    [KBSysAlertUtil presentAlertWithTitle:nil message:nil actionTitles:@[@"拍一张",@"相册选择",@"查看大图"] preferredStyle:UIAlertControllerStyleActionSheet handler:^(NSUInteger buttonIndex, NSString * _Nonnull buttonTitle) {
        if (buttonIndex == 1) {
            NSLog(@"点击了拍一张");
            
            
        }else if(buttonIndex == 2) {
            NSLog(@"点击了相册选择");
            
        }else{
            NSLog(@"点击了查看大图");
        //根据url 获取片信息 并查看
            NSMutableArray *photos = [NSMutableArray new];
//            [self.model.images enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL *_Nonnull stop) {
//                GKPhoto *photo = [GKPhoto new];
//                photo.url = [NSURL URLWithString:obj];
//                [photos addObject:photo];
//            }];
//            GKPhotoBrowser *browser = [GKPhotoBrowser photoBrowserWithPhotos:photos currentIndex:0];
//            browser.showStyle = GKPhotoBrowserShowStyleNone;
//            browser.loadStyle = GKPhotoBrowserLoadStyleDeterminate;
//            [browser showFromVC:self];
        }
        
    }];
    
}

#pragma mark --UITableViewDelegate,UITableViewDataSource--
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.leftArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    personTableViewCell *cell = [_mainTableView dequeueReusableCellWithIdentifier:@"personTableViewCell" forIndexPath:indexPath];
    cell.leftName.text = [NSString stringWithFormat:@"%@",self.leftArray[indexPath.row]];
   // cell.content.text  = [NSString stringWithFormat:@"%@",self.rightArray[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;  //去除选中效果
    cell.backgroundColor = [UIColor colorWithHexString:@"#161823"];
    if (indexPath.row == 4){
        //获取网络数据并展示
        if (self.sexString == nil) {
            cell.content.text = @"您还未设置性别";
        }else{
            cell.content.text = self.sexString;
        }
    }
    if (indexPath.row == 5) {
        //获取网络数据并展示
        if (self.brString == nil) {
            cell.content.text = @"您还未设置生日";
        }else{
            cell.content.text = self.brString;
        }
    }
    if (indexPath.row == 6) {
        cell.bottomLine.hidden = NO;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了cell,展示响应的跳转事件");
    //昵称修改
    if (indexPath.row == 0){
        NSLog(@"点击了修改昵称");
        NameViewController *nameVC = [[NameViewController alloc] init];
        nameVC.nameString = @"团团胸前滑滑梯";
        [self.getCurrentVC.navigationController pushViewController:nameVC animated:YES];
    }
    
    if (indexPath.row == 1){
        NSLog(@"点击了修改账号");
        CountViewController *countVC = [[CountViewController alloc] init];
        countVC.countString = @"测试账号";
        [self.getCurrentVC.navigationController pushViewController:countVC animated:YES];
    }
    if (indexPath.row == 2){
        NSLog(@"点击了修改简介");
        ProfileViewController *profile = [[ProfileViewController alloc] init];
        profile.profileString = @"测试简介";
        [self.getCurrentVC.navigationController pushViewController:profile animated:YES];
    }
    if (indexPath.row == 3){
        NSLog(@"点击了修改学校");
    }
    //性别点击
    if (indexPath.row == 4) {
        [KBSysAlertUtil presentAlertWithTitle:nil message:nil actionTitles:@[@"男",@"女"] preferredStyle:UIAlertControllerStyleActionSheet handler:^(NSUInteger buttonIndex, NSString * _Nonnull buttonTitle) {
            if (buttonIndex == 0) {
                //点击了取消按钮
                return ;
            }
            //发起网络请求 参数为 buttonTitle
            self.sexString = buttonTitle;
            //网络请求完成后 刷新界面
            [self.mainTableView reloadData];
            
        }];
    }
    //生日设置
    if (indexPath.row == 5) {
        NSDate *minDate = [NSDate br_setYear:1900 month:1 day:1];
        NSDate *maxDate = [NSDate date];
        [BRDatePickerView showDatePickerWithTitle:@"生日" dateType:BRDatePickerModeYMD defaultSelValue:nil minDate:minDate maxDate:maxDate isAutoSelect:NO themeColor:nil resultBlock:^(NSString *selectValue) {
            //发起网络请求 参数为selectValue
            NSLog(@"点击了确认按钮 生日为%@",selectValue);
            
            self.brString = [NSString stringWithFormat:@"%@",selectValue];
            
           // 网络请求完成后 更新数据
            [self.mainTableView reloadData];
         
            
        } cancelBlock:^{
            NSLog(@"点击了背景或取消按钮");
        }];
    }
}
//修改状态栏颜色
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
@end
