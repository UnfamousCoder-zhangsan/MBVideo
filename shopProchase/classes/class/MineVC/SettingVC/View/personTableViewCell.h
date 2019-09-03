//
//  personTableViewCell.h
//  shopProchase
//
//  Created by hi  kobe on 2019/8/15.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface personTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *leftName; 
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *bottomLine;
@property (weak, nonatomic) IBOutlet UIImageView *rightImage;

@end

NS_ASSUME_NONNULL_END
