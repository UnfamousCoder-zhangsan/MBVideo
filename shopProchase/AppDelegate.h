//
//  AppDelegate.h
//  shopProchase
//
//  Created by hi  kobe on 2019/8/15.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MBDrawerViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong, readonly) MBDrawerViewController *drawerVC;

@end

