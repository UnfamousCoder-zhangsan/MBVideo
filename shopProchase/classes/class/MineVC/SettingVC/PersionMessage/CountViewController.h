//
//  CountViewController.h
//  shopProchase
//
//  Created by hi  kobe on 2019/9/2.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "MBBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface CountViewController : MBBaseViewController
@property (weak, nonatomic) IBOutlet UITextField *countTextField;
@property (nonatomic, copy) NSString  *countString;

@end

NS_ASSUME_NONNULL_END
