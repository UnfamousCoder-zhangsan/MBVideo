//
//  AppDelegate.m
//  shopProchase
//
//  Created by hi  kobe on 2019/8/15.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "AppDelegate.h"
#import "MBDrawerViewController.h"
#import "MenuViewController.h"
#import "MBMineViewController.h"
@interface AppDelegate () <MBDrawerViewControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    MainTabBarViewController *mainTab = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"TabBarView"];
    ((AppDelegate *)[UIApplication sharedApplication].delegate).window.rootViewController = mainTab;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
//    MBMineViewController *mainPage = [[MBMineViewController alloc] init];
//    MenuViewController   *menuPage = [[MenuViewController    alloc] init];

//
//    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainTab];
//
//    _drawerVC = [[MBDrawerViewController alloc] initWithMainViewController:navigationController menuViewController:menuPage];
//    self.window.rootViewController = self.drawerVC;
//
//    [self.drawerVC bind:self];
//    [self.drawerVC bind:mainTab];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
