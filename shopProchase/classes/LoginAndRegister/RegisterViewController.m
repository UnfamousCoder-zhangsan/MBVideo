//
//  RegisterViewController.m
//  shopProchase
//
//  Created by apple on 2019/9/3.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "RegisterViewController.h"
#import "SettingPasswoedVC.h"

@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet UIView *phoneView;
@property (weak, nonatomic) IBOutlet UIView *codeView;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *agreeButton;
@property (weak, nonatomic) IBOutlet UIButton *codeButton;
@property (weak, nonatomic) IBOutlet UITextField *textfieldPhone;
@property (weak, nonatomic) IBOutlet UITextField *textfieldCode;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.phoneView.layer.cornerRadius = 45 / 2;
    self.phoneView.layer.masksToBounds = YES;
    self.phoneView.layer.borderWidth = 1;
    self.phoneView.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.codeView.layer.cornerRadius = 45 / 2;
    self.codeView.layer.masksToBounds = YES;
    self.codeView.layer.borderWidth  = 1;
    self.codeView.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.nextButton.layer.cornerRadius = 45 / 2;
    self.nextButton.layer.masksToBounds = YES;
}
- (IBAction)codeButtonClick:(UIButton *)sender {
    [AlertUtils error:@"获取验证码"];
}

- (IBAction)nextButton:(UIButton *)sender {
    
    SettingPasswoedVC *settingVC = [[SettingPasswoedVC alloc] init];
    [self presentViewController:settingVC animated:YES completion:^{
        
    }];
}
- (IBAction)closeButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


- (IBAction)userProBtn:(UIButton *)sender {
    
    
}
- (IBAction)agreeButton:(UIButton *)sender {
    if (sender.selected == YES) {
        sender.selected = NO;
    } else {
        sender.selected = YES;
    }
}



@end
