//
//  CountViewController.m
//  shopProchase
//
//  Created by hi  kobe on 2019/9/2.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "CountViewController.h"

@interface CountViewController ()
@property (weak, nonatomic) IBOutlet UIButton *clearButton;
//@property (strong, nonatomic) UIButton *rightButton;

@end

@implementation CountViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.countTextField becomeFirstResponder];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.gk_navTitle = @"修改账号";
    UIBarButtonItem *leftItem= [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"whiteleft"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(backbuttonPressed)];
    self.gk_navLeftBarButtonItem = leftItem;
    
//    self.rightButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 45, 0, 50, 30)];

    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick)];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spacer.width = 20;
    self.gk_navRightBarButtonItems = @[spacer,rightItem];
   // self.gk_navRightBarButtonItem = rightItem;
    [self.gk_navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHexString:@"FFFFFF"],
                                                    NSFontAttributeName : [UIFont systemFontOfSize:17]}];
    self.gk_navBackgroundColor = [UIColor colorWithHexString:@"282a34"];
    self.view.backgroundColor = [UIColor colorWithHexString:@"282a34"];
    
    if ([self.countTextField.text isEqualToString:@""]) {
        self.clearButton.hidden = YES;
    } else {
        self.clearButton.hidden = NO;
    }
    [self.countTextField addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventEditingChanged];
    //修改占位文本颜色
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"记得填写账号哦" attributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"76838f"]}];
    self.countTextField.attributedPlaceholder = attrString;
    self.countTextField.text = self.countString;
    if ([self.countTextField.text isEqualToString:@""]) {
        self.clearButton.hidden = YES;
    } else {
        self.clearButton.hidden = NO;
    }
    self.clearButton.layer.cornerRadius = 10;
    self.clearButton.layer.masksToBounds = YES;
    [self.clearButton addTarget:self action:@selector(clearClick) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)backbuttonPressed{
    //返回按钮
    [self.navigationController popViewControllerAnimated:YES];
}
- (void) rightClick{
    NSLog(@"点击了保存按钮");
    //发起网络请求
}
- (void) clearClick{
    
    self.countTextField.text = @"";
    self.clearButton.hidden = YES;
}

- (void)textChanged:(UITextField *)textField{
    NSLog(@"%@",textField.text);
    
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
            if (textField.text.length >16) {
                textField.text = [textField.text substringToIndex:16];
                [AlertUtils error:@"最多输入16个字"];
            }
        }
        //有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
            
        }
    }
    
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        if (textField.text.length >=16) {
            textField.text = [textField.text substringWithRange:NSMakeRange(0, 16)];
            [AlertUtils error:@"最多输入16个字"];
        }
        
    }
    
}
//修改状态栏颜色
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end
