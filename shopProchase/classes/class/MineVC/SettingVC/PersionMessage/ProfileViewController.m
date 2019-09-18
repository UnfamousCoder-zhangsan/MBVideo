//
//  ProfileViewController.m
//  shopProchase
//
//  Created by hi  kobe on 2019/9/2.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()<UITextViewDelegate>
@property (strong, nonatomic) UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UITextView *profileView;


@end

@implementation ProfileViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.profileTextView becomeFirstResponder];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.gk_navTitle = @"修改简介";
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
    self.profileTextView.backgroundColor = [UIColor grayColor];
    self.profileView.delegate = self;
    self.profileTextView.text = self.profileString;
    
}
-(void)backbuttonPressed{
    //返回按钮
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)rightClick{
    NSLog(@"点击了保存按钮");
}
//修改状态栏颜色
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark - UITextViewDelegate --
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    //修改了内容
    //修改状态颜色
    self.rightButton.userInteractionEnabled = YES;
    self.rightButton.alpha = 0.9;
    
    NSString * toBeString = [textView.text stringByReplacingCharactersInRange:range withString:text];
    
    //    if (self.delegate&&[self.delegate respondsToSelector:@selector(textViewContent:)]) {
    //        [self.delegate textViewContent:toBeString];
    //    }
    UITextRange *selectedRange = [textView markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [textView positionFromPosition:selectedRange.start offset:0];
    //获取高亮部分内容
    //NSString * selectedtext = [textView textInRange:selectedRange];
    //如果有高亮且当前字数开始位置小于最大限制时允许输入
    if ([text isEqualToString:@"\n"]) {
        //        self.numberLabel.text = [NSString stringWithFormat:@"%ld/400",toBeString.length-1];
        [textView resignFirstResponder];
        return NO;
    }
    if (selectedRange && pos) {
        NSInteger startOffset = [textView offsetFromPosition:textView.beginningOfDocument toPosition:selectedRange.start];
        NSInteger endOffset = [textView offsetFromPosition:textView.beginningOfDocument toPosition:selectedRange.end];
        NSRange offsetRange = NSMakeRange(startOffset, endOffset - startOffset);
        if (offsetRange.location < 200) {
            return YES;
        }else{
            if (toBeString.length > 200) {
                [AlertUtils error:@"不能超过200字"];
                return NO;
            }
        }
        NSString *comcatstr = [textView.text stringByReplacingCharactersInRange:range withString:text];
        NSInteger caninputlen = 200 - comcatstr.length;
        //        self.numberLabel.text = [NSString stringWithFormat:@"%ld/400",comcatstr.length];
        if (caninputlen >= 0)
        {
            return YES;
        }else{
            return NO;
        }
    }
    NSString *comcatstr = [textView.text stringByReplacingCharactersInRange:range withString:text];
    //     self.numberLabel.text = [NSString stringWithFormat:@"%ld/400",comcatstr.length];
    NSInteger caninputlen = 200 - comcatstr.length;
    if (caninputlen >= 0){
        return YES;
    }else{
        [AlertUtils error:@"不能超过200字"];
        NSInteger len = text.length + caninputlen;
        //防止当text.length + caninputlen < 0时，使得rg.length为一个非法最大正数出错
        NSRange rg = {0,MAX(len,0)};
        if (rg.length > 0){
            NSString *s = @"";
            //判断是否只普通的字符或asc码(对于中文和表情返回NO)
            BOOL asc = [text canBeConvertedToEncoding:NSASCIIStringEncoding];
            if (asc) {
                s = [text substringWithRange:rg];//因为是ascii码直接取就可以了不会错
            } else{
                __block NSInteger idx = 0;
                __block NSString  *trimString = @"";//截取出的字串
                //使用字符串遍历，这个方法能准确知道每个emoji是占一个unicode还是两个
                [text enumerateSubstringsInRange:NSMakeRange(0, [text length])
                                         options:NSStringEnumerationByComposedCharacterSequences
                                      usingBlock: ^(NSString* substring, NSRange substringRange, NSRange enclosingRange, BOOL* stop) {
                                          if (idx >= rg.length) {
                                              *stop = YES; //取出所需要就break，提高效率
                                              return ;
                                          }
                                          trimString = [trimString stringByAppendingString:substring];
                                          idx++;
                                      }];
                s = trimString;
            }
            //rang是指从当前光标处进行替换处理(注意如果执行此句后面返回的是YES会触发didchange事件)
            [textView setText:[textView.text stringByReplacingCharactersInRange:range withString:s]];
            //既然是超出部分截取了，哪一定是最大限制了。
        }
        return NO;
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView{
    UITextRange *selectedRange = [textView markedTextRange];
    //获取高亮部分
    UITextPosition *pos = [textView positionFromPosition:selectedRange.start offset:0];
    //如果在变化中是高亮部分在变，就不要计算字符了
    
    if (selectedRange && pos) {
        
        return;
        
    }
    NSString  *nsTextContent = textView.text;
    NSInteger existTextNum = nsTextContent.length;
    
    if (existTextNum > 200)

    {

        //截取到最大位置的字符(由于超出截部分在should时被处理了所在这里这了提高效率不再判断)
        [AlertUtils error:@"不能超过200字"];
        NSString *s = [nsTextContent substringToIndex:200];
        [textView setText:s];
//        self.numberLabel.text = [NSString stringWithFormat:@"%ld/200",s.length];
//        if (self.delegate&&[self.delegate respondsToSelector:@selector(textViewContent:)]) {
//            [self.delegate textViewContent:s];
//        }
        return ;
    }
    else{
//        self.numberLabel.text = [NSString stringWithFormat:@"%ld/200",existTextNum];
//        if (self.delegate&&[self.delegate respondsToSelector:@selector(textViewContent:)]) {
//            [self.delegate textViewContent:nsTextContent];
//        }
    }
    //不让显示负数
    
    
}

@end
