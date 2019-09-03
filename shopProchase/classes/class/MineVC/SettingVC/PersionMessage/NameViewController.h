//
//  NameViewController.h
//  shopProchase
//
//  Created by hi  kobe on 2019/9/2.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "MBBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface NameViewController : MBBaseViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (nonatomic, copy) NSString  *nameString;

@end

NS_ASSUME_NONNULL_END
