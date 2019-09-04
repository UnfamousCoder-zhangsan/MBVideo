//
//  ForgetPasswordVC.m
//  shopProchase
//
//  Created by apple on 2019/9/3.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "ForgetPasswordVC.h"
#import "SettingPasswoedVC.h"

@interface ForgetPasswordVC ()
@property (weak, nonatomic) IBOutlet UIView *phoneView;
@property (weak, nonatomic) IBOutlet UIView *passwordcodeView;
@property (weak, nonatomic) IBOutlet UITextField *textfieldPhone;
@property (weak, nonatomic) IBOutlet UITextField *textfieldCode;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *getCodeButton;

@end

@implementation ForgetPasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.phoneView.layer.cornerRadius = 45/2;
    self.phoneView.layer.borderColor = [[UIColor colorWithHexString:@"#CDCDCD"]CGColor];
    self.phoneView.layer.borderWidth = 1;
    
    self.passwordcodeView.layer.cornerRadius = 45/2;
    self.passwordcodeView.layer.borderColor = [[UIColor colorWithHexString:@"#CDCDCD"]CGColor];
    self.passwordcodeView.layer.borderWidth = 1;
    
    self.nextButton.layer.cornerRadius = 45/2;
    self.nextButton.layer.masksToBounds = YES;
    
}
- (IBAction)countdownButotn:(UIButton *)sender {
    [AlertUtils error:@"或取验证码"];
}
- (IBAction)colseButton:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


- (IBAction)nextButton:(UIButton *)sender {
    SettingPasswoedVC *settingVC = [[SettingPasswoedVC alloc] init];
    [self presentViewController:settingVC animated:YES completion:^{
        
    }];
}

@end
