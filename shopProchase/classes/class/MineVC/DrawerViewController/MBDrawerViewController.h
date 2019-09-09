//
//  MBDrawerViewController.h
//  shopProchase
//
//  Created by hi  kobe on 2019/9/9.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol MBDrawerViewControllerDelegate <NSObject>

@optional
- (void)menuDidAppear;
- (void)menuDidDisappear;

@end

@interface MBDrawerViewController : UIViewController<NSObject>


- (instancetype)initWithMainViewController:(UIViewController *)mainViewController
                        menuViewController:(UIViewController *)menuViewController;

@property (nonatomic, assign) CGFloat visibleMenuWidth; ///< Default is 300.f.
@property (nonatomic, assign) BOOL canDragMenu; ///< Default is YES.

@property (nonatomic, strong, readwrite) UIViewController *mainViewController;
@property (nonatomic, strong, readwrite) UIViewController *menuViewController;

- (void)presentMenuViewController; ///< Show menu page.
- (void)dismissMenuViewController; ///< Hide menu page.

- (void)bind:(id<MBDrawerViewControllerDelegate>)delegate;
- (void)unbind:(id<MBDrawerViewControllerDelegate>)delegate;
@end

NS_ASSUME_NONNULL_END
