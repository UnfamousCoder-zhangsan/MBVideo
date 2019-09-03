//
//  mineListCollectionViewCell.h
//  shopProchase
//
//  Created by hi  kobe on 2019/8/30.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface mineListCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView; //视频缩略图展示
@property (weak, nonatomic) IBOutlet UILabel *likeNumber;    //点赞人数

@end

NS_ASSUME_NONNULL_END
