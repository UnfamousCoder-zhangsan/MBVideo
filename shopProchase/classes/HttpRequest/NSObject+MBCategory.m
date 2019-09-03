//
//  NSObject+MBCategory.m
//  shopProchase
//
//  Created by hi  kobe on 2019/8/29.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "NSObject+MBCategory.h"
#import "UIViewController+MBCategory.h"
#import "AppDelegate.h"

@implementation NSObject (MBCategory)

- (UIViewController *)getCurrentVC{
    AppDelegate *appDelegate  = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return [appDelegate.window.rootViewController mb_visibleViewControllerIfExist];
}


@end
