//
//  FirstCollectionViewCell.h
//  shopProchase
//
//  Created by hi  kobe on 2019/8/23.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *personLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UILabel *focusNumber;
@property (weak, nonatomic) IBOutlet UILabel *fanNumber;
@property (weak, nonatomic) IBOutlet UILabel *likeNumber;

@end

NS_ASSUME_NONNULL_END
