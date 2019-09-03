//
//  MBCollectionViewController.h
//  shopProchase
//
//  Created by hi  kobe on 2019/8/30.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "MainViewController.h"
#import "mineListCollectionViewCell.h"
#import "MBCollectionViewFlowLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBCollectionViewController : MainViewController<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,MBCollectionViewDelegateFlowLayout,GKPageListViewDelegate>
@property (strong, nonatomic) UICollectionView *collectionView;

@end

NS_ASSUME_NONNULL_END
