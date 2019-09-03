//
//  MBHeaderView.h
//  shopProchase
//
//  Created by hi  kobe on 2019/8/29.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
#define kDYHeaderHeight (SCREEN_WIDTH * 375.0f / 345.0f)
#define kDYBgImgHeight  (SCREEN_WIDTH * 110.0f / 345.0f)

@interface MBHeaderView : UIView

- (void)scrollViewDidScroll:(CGFloat)offsetY;


@end

NS_ASSUME_NONNULL_END
