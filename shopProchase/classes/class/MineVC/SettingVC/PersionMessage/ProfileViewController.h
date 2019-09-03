//
//  ProfileViewController.h
//  shopProchase
//
//  Created by hi  kobe on 2019/9/2.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "MBBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : MBBaseViewController
@property (weak, nonatomic) IBOutlet UITextView *profileTextView;
@property (nonatomic, copy) NSString  *profileString;


@end

NS_ASSUME_NONNULL_END
