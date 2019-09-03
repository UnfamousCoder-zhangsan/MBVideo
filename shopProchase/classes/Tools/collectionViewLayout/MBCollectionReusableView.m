//
//  MBCollectionReusableView.m
//  shopProchase
//
//  Created by hi  kobe on 2019/8/30.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "MBCollectionReusableView.h"
#import "MBCollectionViewLayoutAttributes.h"

@implementation MBCollectionReusableView

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes:layoutAttributes];
    if ([layoutAttributes isKindOfClass:[MBCollectionViewLayoutAttributes class]]) {
        MBCollectionViewLayoutAttributes *attr = (MBCollectionViewLayoutAttributes *)layoutAttributes;
        self.backgroundColor = attr.backgroundColor;
    }
}

@end
