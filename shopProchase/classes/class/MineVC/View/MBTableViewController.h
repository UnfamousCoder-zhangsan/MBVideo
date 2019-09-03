//
//  MBTableViewController.h
//  shopProchase
//
//  Created by hi  kobe on 2019/8/29.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "MainViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBTableViewController : MainViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
