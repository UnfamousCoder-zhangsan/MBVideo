//
//  UIViewController+MBCategory.m
//  shopProchase
//
//  Created by hi  kobe on 2019/8/29.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "UIViewController+MBCategory.h"

@implementation UIViewController (MBCategory)

- (UIViewController *)mb_visibleViewControllerIfExist{
    if (self.presentedViewController) {
        return [self.presentedViewController mb_visibleViewControllerIfExist];
    }
    
    if ([self isKindOfClass:[UINavigationController class]]) {
        return [((UINavigationController *)self).topViewController mb_visibleViewControllerIfExist];
    }
    
    if ([self isKindOfClass:[UITabBarController class]]) {
        return [((UITabBarController *)self).selectedViewController mb_visibleViewControllerIfExist];
    }
    
    return self;
    
    //    if ([self isViewLoaded] && self.view.window) {
    //        return self;
    //    }else {
    //        NSLog(@"找不到可见的控制器，viewcontroller.self = %@, self.view.window = %@", self, self.view.window);
    //        return nil;
    //    }
}

@end
