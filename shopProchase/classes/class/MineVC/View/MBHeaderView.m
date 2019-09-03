//
//  MBHeaderView.m
//  shopProchase
//
//  Created by hi  kobe on 2019/8/29.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "MBHeaderView.h"
#import "SettingViewController.h"

@interface MBHeaderView()

@property (nonatomic, assign) CGRect        bgImgFrame;
@property (nonatomic, strong) UIImageView   *bgImgView;

@property (nonatomic, strong) UIView        *contentView;
@property (nonatomic, strong) UIImageView   *iconImgView;
@property (nonatomic, strong) UIImageView   *contentImgView;
@property (nonatomic, strong) UIButton      *modifyButton;

@end

@implementation MBHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.bgImgView]; 
        
        [self addSubview:self.contentView];
        [self.contentView addSubview:self.iconImgView];
        [self.contentView addSubview:self.contentImgView];
        [self.contentView addSubview:self.modifyButton];
        
        self.bgImgFrame = CGRectMake(0, 0, frame.size.width, kDYBgImgHeight);
        self.bgImgView.frame = self.bgImgFrame;
        
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(kDYBgImgHeight, 0, 0, 0));
        }];
        
        [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(10.0f);
            make.top.equalTo(self.contentView).offset(-15.0f);
            make.width.height.mas_equalTo(100.0f);
        }];
        
        [self.contentImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImgView.mas_bottom);
            make.left.right.bottom.equalTo(self);
        }];
        
        [self.modifyButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-20.0f);
            make.top.equalTo(self.contentView).offset(15.0f);
            make.width.mas_equalTo(SCREEN_WIDTH/ 2 - 20);
            make.height.mas_equalTo(40.0f);
        }];
    }
    return self;
}

- (void)scrollViewDidScroll:(CGFloat)offsetY {
    CGRect frame = self.bgImgFrame;
    // 上下放大
    frame.size.height -= offsetY;
    frame.origin.y = offsetY;
    
    // 左右放大
    if (offsetY <= 0) {
        frame.size.width = frame.size.height * self.bgImgFrame.size.width / self.bgImgFrame.size.height;
        frame.origin.x   = (self.frame.size.width - frame.size.width) / 2;
    }
    
    self.bgImgView.frame = frame;
}

#pragma mark - 懒加载
- (UIImageView *)bgImgView {
    if (!_bgImgView) {
        _bgImgView = [UIImageView new];
        _bgImgView.image = [UIImage imageNamed:@"dy_bg"];
        _bgImgView.contentMode = UIViewContentModeScaleAspectFill;
        _bgImgView.clipsToBounds = YES;
    }
    return _bgImgView;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor colorWithHexString:@"#282a34"];
    }
    return _contentView;
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        _iconImgView.image = [UIImage imageNamed:@"dy_icon"];
        _iconImgView.layer.cornerRadius = 50.0f;
        _iconImgView.layer.masksToBounds = YES;
        _iconImgView.layer.borderColor = [UIColor blackColor].CGColor;
        _iconImgView.layer.borderWidth = 3;
    }
    return _iconImgView;
}
- (UIButton *)modifyButton{
    if (!_modifyButton) {
        _modifyButton = [UIButton new];
        _modifyButton.backgroundColor = [UIColor grayColor];
        _modifyButton.layer.cornerRadius = 20.0f;
        _modifyButton.layer.masksToBounds = YES;
        [_modifyButton setTitle:@"编辑资料" forState:UIControlStateNormal];
        [_modifyButton addTarget:self action:@selector(modifyClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return  _modifyButton;
}

- (UIImageView *)contentImgView {
    if (!_contentImgView) {
        _contentImgView = [UIImageView new];
        _contentImgView.image = [UIImage imageNamed:@"dy_content"];
    }
    return _contentImgView;
}
- (void)modifyClick{
    NSLog(@"点击modify按钮");
        SettingViewController *settingVC = [[SettingViewController alloc] init];
        [self.getCurrentVC.navigationController pushViewController:settingVC animated:YES];
}


@end
