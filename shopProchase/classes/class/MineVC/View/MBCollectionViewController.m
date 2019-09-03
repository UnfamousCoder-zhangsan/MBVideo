//
//  MBCollectionViewController.m
//  shopProchase
//
//  Created by hi  kobe on 2019/8/30.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "MBCollectionViewController.h"


@interface MBCollectionViewController ()
@property (nonatomic, copy) void(^listScrollViewScrollBlock)(UIScrollView *scrollView);

@end

@implementation MBCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    regist_collection(_collectionView, mineListCollectionViewCell);
}


#pragma mark - 懒加载collectionview
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        MBCollectionViewFlowLayout *layout = [[MBCollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.sectionHeadersPinToVisibleBounds = YES;
      //  UICollectionViewLayout *layout = [[UICollectionViewLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor blackColor];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
       // _collectionView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (@available(iOS 11.0, *)) {
            _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _collectionView;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

- (UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    mineListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"mineListCollectionViewCell" forIndexPath:indexPath];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(SCREEN_WIDTH / 3, 160);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"点击了cell");
}
#pragma mark - JHCollectionViewDelegateFlowLayout
- (UIColor *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout backgroundColorForSection:(NSInteger)section
{
    return nil;
}
#pragma mark - UIScrollViewDelgate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    !self.listScrollViewScrollBlock ? : self.listScrollViewScrollBlock(scrollView);
}

#pragma mark - GKPageListViewDelegate
- (UIScrollView *)listScrollView {
    return self.collectionView;
}

- (void)listViewDidScrollCallback:(void (^)(UIScrollView * _Nonnull))callback {
    self.listScrollViewScrollBlock = callback;
}
@end


