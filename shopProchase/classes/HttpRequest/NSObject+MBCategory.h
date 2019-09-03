//
//  NSObject+MBCategory.h
//  shopProchase
//
//  Created by hi  kobe on 2019/8/29.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (MBCategory)

/**
 * 获取当前控制器
 */
- (UIViewController *)getCurrentVC;

@end

NS_ASSUME_NONNULL_END
