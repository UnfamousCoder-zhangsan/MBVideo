//
//  ForgetPasswordVC.m
//  shopProchase
//
//  Created by apple on 2019/9/3.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "ForgetPasswordVC.h"

@interface ForgetPasswordVC ()
@property (weak, nonatomic) IBOutlet UIView *phoneView;
@property (weak, nonatomic) IBOutlet UIView *passwordcodeView;
@property (weak, nonatomic) IBOutlet UITextField *textfieldPhone;
@property (weak, nonatomic) IBOutlet UITextField *textfieldCode;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
