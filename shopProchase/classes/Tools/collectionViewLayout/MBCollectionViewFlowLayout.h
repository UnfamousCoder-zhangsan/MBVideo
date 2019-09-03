//
//  MBCollectionViewFlowLayout.h
//  shopProchase
//
//  Created by hi  kobe on 2019/8/30.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol MBCollectionViewDelegateFlowLayout <UICollectionViewDelegateFlowLayout>

- (UIColor *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout backgroundColorForSection:(NSInteger)section;

@end

@interface MBCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, strong) NSMutableArray<UICollectionViewLayoutAttributes *> *decorationViewAttrs;

@end

NS_ASSUME_NONNULL_END
