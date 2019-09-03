//
//  personTableViewCell.m
//  shopProchase
//
//  Created by hi  kobe on 2019/8/15.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "personTableViewCell.h"

@implementation personTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bottomLine.hidden = YES;
    self.bottomLine.backgroundColor = [UIColor colorWithHexString:@"#282a34"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
@end
