//
//  KBSysAlertUtil.m
//  shopProchase
//
//  Created by hi  kobe on 2019/8/19.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "KBSysAlertUtil.h"

#define kRootViewController [UIApplication sharedApplication].keyWindow.rootViewController

@implementation KBSysAlertUtil


/** 单个按键的 alertView */
+ (void)presentAlertViewWithTitle:(NSString *)title message:(NSString *)message confirmTitle:(NSString *)confirmTitle handler:(void(^)(void))handler {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // creat action
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        if (handler) {
            handler();
        }
    }];
    
    // add acton
    [cancelAction setValue:[UIColor redColor] forKey:@"_titleTextColor"];
    [alert addAction:cancelAction];
    
    // present alertView on rootViewController
    [kRootViewController presentViewController:alert animated:YES completion:nil];
}

/** 双按键的 alertView */
+ (void)presentAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelTitle:(NSString *)cancelTitle defaultTitle:(NSString *)defaultTitle distinct:(BOOL)distinct cancel:(void(^)(void))cancel confirm:(void(^)(void))confirm {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (distinct) {
        // 左浅右深
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            if (cancel) {
                cancel();
            }
        }];
        [cancelAction setValue:[UIColor colorWithHexString:@"#8E8E93"] forKey:@"_titleTextColor"];
        [alert addAction:cancelAction];
    } else {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (cancel) {
                cancel();
            }
        }];
        [cancelAction setValue:[UIColor colorWithHexString:@"#8E8E93"] forKey:@"_titleTextColor"];
        [alert addAction:cancelAction];
    }
    
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:defaultTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (confirm) {
            confirm();
        };
    }];
    [defaultAction setValue:[UIColor colorWithHexString:@"#2D8FF4"] forKey:@"_titleTextColor"];
    [alert addAction:defaultAction];
    
    
    [kRootViewController presentViewController:alert animated:YES completion:nil];
}

/** Alert  任意多个按键 返回选中的 buttonIndex 和 buttonTitle */
+ (void)presentAlertWithTitle:(NSString *)title message:(NSString *)message actionTitles:(NSArray *)actionTitles  preferredStyle:(UIAlertControllerStyle)preferredStyle handler:(void(^)(NSUInteger buttonIndex, NSString *buttonTitle))handler {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        handler(0, @"取消");
    }];
    [cancelAction setValue:[UIColor colorWithHexString:@"#007aff"] forKey:@"_titleTextColor"];
    [alert addAction:cancelAction];
    
    for (int i = 0; i < actionTitles.count; i ++) {
        
        UIAlertAction *confimAction = [UIAlertAction actionWithTitle:actionTitles[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            handler((i + 1), actionTitles[i]);
        }];
        [confimAction setValue:[UIColor colorWithHexString:@"#007aff"] forKey:@"_titleTextColor"];
        [alert addAction:confimAction];
    }
    
    [kRootViewController presentViewController:alert animated:YES completion:nil];
}

@end
