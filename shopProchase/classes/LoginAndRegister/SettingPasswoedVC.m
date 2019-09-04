//
//  SettingPasswoedVC.m
//  shopProchase
//
//  Created by apple on 2019/9/3.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "SettingPasswoedVC.h"

@interface SettingPasswoedVC ()
@property (weak, nonatomic) IBOutlet UIView *settingPasswordView;
@property (weak, nonatomic) IBOutlet UIView *againpasswordView;
@property (weak, nonatomic) IBOutlet UITextField *textfieldAgain;
@property (weak, nonatomic) IBOutlet UITextField *textfieldSetting;
@property (weak, nonatomic) IBOutlet UIButton *sucessButton;

@end

@implementation SettingPasswoedVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.settingPasswordView.layer.cornerRadius = 45 / 2;
    self.settingPasswordView.layer.masksToBounds = YES;
    self.settingPasswordView.layer.borderWidth = 1;
    self.settingPasswordView.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.againpasswordView.layer.cornerRadius = 45 / 2;
    self.againpasswordView.layer.masksToBounds = YES;
    self.againpasswordView.layer.borderWidth  = 1;
    self.againpasswordView.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.sucessButton.layer.cornerRadius = 45 / 2;
    self.sucessButton.layer.masksToBounds = YES;
}
- (IBAction)successButton:(UIButton *)sender {
    
}
- (IBAction)colseButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
