//
//  NameViewController.m
//  shopProchase
//
//  Created by hi  kobe on 2019/9/2.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "NameViewController.h"

@interface NameViewController ()
@property (weak, nonatomic) IBOutlet UIButton *clearButton;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (strong, nonatomic) UIButton *rightButton; //自定义导航栏右侧按钮


@end

@implementation NameViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.nameTextField becomeFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.gk_navTitle = @"修改昵称";
    self.gk_navBarTintColor = [UIColor redColor];
    UIBarButtonItem *leftItem= [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"whiteleft"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(backbuttonPressed)];
    self.gk_navLeftBarButtonItem = leftItem;
    
    self.rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 70, 30)];
    [self.rightButton setTitle:@"保存" forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.rightButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    
    //修改状态颜色
    self.rightButton.userInteractionEnabled = NO;
    self.rightButton.alpha = 0.2;
    
    self.gk_navRightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];
    [self.gk_navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexString:@"FFFFFF"],
                                                                      NSFontAttributeName : [UIFont systemFontOfSize:17]}];
    self.gk_navBackgroundColor = [UIColor colorWithHexString:@"282a34"];
    self.view.backgroundColor = [UIColor colorWithHexString:@"282a34"];
    
    if ([self.nameTextField.text isEqualToString:@""]) {
        self.clearButton.hidden = YES;
    } else {
        self.clearButton.hidden = NO;
    }
    [self.nameTextField addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventEditingChanged];
    //修改占位文本颜色
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"记得填写昵称哦" attributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"76838f"]}];
    self.nameTextField.attributedPlaceholder = attrString;
    self.nameTextField.text = self.nameString;
    if ([self.nameTextField.text isEqualToString:@""]) {
        self.clearButton.hidden = YES;
    } else {
        self.clearButton.hidden = NO;
    }
    self.clearButton.layer.cornerRadius = 10;
    self.clearButton.layer.masksToBounds = YES;
    [self.clearButton addTarget:self action:@selector(clearClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.numberLabel.text = [NSString stringWithFormat:@"%lu/20",(unsigned long)self.nameString.length];
    
}

-(void)backbuttonPressed{
    //返回按钮
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)rightClick{
    NSLog(@"点击了保存按钮");
}
- (void) clearClick{
    
    self.nameTextField.text = @"";
    self.numberLabel.text = [NSString stringWithFormat:@"0/20"];
    self.clearButton.hidden = YES;
}

- (void)textChanged:(UITextField *)textField{
    NSLog(@"%@",textField.text);
    
    self.rightButton.userInteractionEnabled = YES;
    self.rightButton.alpha = 0.9;
    
    if ([textField.text isEqualToString:@""]) {
        self.clearButton.hidden = YES;
    }else{
        self.clearButton.hidden = NO;
    }
    
    NSString *lang = [[UIApplication sharedApplication]textInputMode].primaryLanguage;//键盘输入模式
    if ([lang isEqualToString:@"zh-Hans"]) {// 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        //没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (textField.text.length >20) {
                textField.text = [textField.text substringToIndex:20];
                [AlertUtils error:@"最多输入20个字"];
            }
        }
        //有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
            
        }
    }
    
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        if (textField.text.length >=20) {
            textField.text = [textField.text substringWithRange:NSMakeRange(0, 20)];
            [AlertUtils error:@"最多输入20个字"];
        }
        
    }
    UITextRange *selectedRange = [textField markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [textField positionFromPosition:selectedRange.start offset:0];
    //如果在变化中是高亮部分在变，就不要计算字符了
    
    if (selectedRange && pos) {
        
        return;
        
    }
    NSString  *nsTextContent = textField.text;
    NSInteger existTextNum = nsTextContent.length;
    
    if (existTextNum > 20)
        
    {
        
        //截取到最大位置的字符(由于超出截部分在should时被处理了所在这里这了提高效率不再判断)
        [AlertUtils error:@"不能超过20字"];
        NSString *s = [nsTextContent substringToIndex:20];
        [textField setText:s];
        self.numberLabel.text = [NSString stringWithFormat:@"%ld/20",s.length];
    
        return ;
    }
    else{
        self.numberLabel.text = [NSString stringWithFormat:@"%ld/20",existTextNum];
    }
    
}
//修改状态栏颜色
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
