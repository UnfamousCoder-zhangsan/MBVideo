//
//  GKPhotoBrowser.h
//  GKPhotoBrowser
//
//  Created by QuintGao on 2017/10/20.
//  Copyright © 2017年 QuintGao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GKPhotoView.h"

NS_ASSUME_NONNULL_BEGIN

@class GKPhotoBrowser;

typedef void(^layoutBlock)(GKPhotoBrowser *photoBrowser, CGRect superFrame);

@protocol GKPhotoBrowserDelegate<NSObject>

@optional

// 滚动到一半时索引改变
- (void)photoBrowser:(GKPhotoBrowser *)browser didChangedIndex:(NSInteger)index;

// 选择photoView时回调
- (void)photoBrowser:(GKPhotoBrowser *)browser didSelectAtIndex:(NSInteger)index;

// 单击事件
- (void)photoBrowser:(GKPhotoBrowser *)browser singleTapWithIndex:(NSInteger)index;

// 长按事件
- (void)photoBrowser:(GKPhotoBrowser *)browser longPressWithIndex:(NSInteger)index;

// 旋转事件
- (void)photoBrowser:(GKPhotoBrowser *)browser onDeciceChangedWithIndex:(NSInteger)index isLandspace:(BOOL)isLandspace;

// 上下滑动消失
// 开始滑动时
- (void)photoBrowser:(GKPhotoBrowser *)browser panBeginWithIndex:(NSInteger)index;

// 结束滑动时 disappear：是否消失
- (void)photoBrowser:(GKPhotoBrowser *)browser panEndedWithIndex:(NSInteger)index willDisappear:(BOOL)disappear;

// 布局子视图
- (void)photoBrowser:(GKPhotoBrowser *)browser willLayoutSubViews:(NSInteger)index;

// browser完全消失回调
- (void)photoBrowser:(GKPhotoBrowser *)browser didDisappearAtIndex:(NSInteger)index;

// browser自定义加载方式时回调
- (void)photoBrowser:(GKPhotoBrowser *)browser loadImageAtIndex:(NSInteger)index progress:(float)progress isOriginImage:(BOOL)isOriginImage;

// browser加载失败自定义弹窗
- (void)photoBrowser:(GKPhotoBrowser *)browser loadFailedAtIndex:(NSInteger)index;

@end

@interface GKPhotoBrowser : UIViewController

/** 底部内容试图 */
@property (nonatomic, strong, readonly) UIView        *contentView;
/** 图片模型数组 */
@property (nonatomic, strong, readonly) NSArray       *photos;
/** 当前索引 */
@property (nonatomic, assign, readonly) NSInteger     currentIndex;
/** 当前显示的photoView */
@property (nonatomic, strong, readonly) GKPhotoView   *curPhotoView;
/** 是否是横屏 */
@property (nonatomic, assign, readonly) BOOL          isLandspace;
/** 当前设备的方向 */
@property (nonatomic, assign, readonly) UIDeviceOrientation currentOrientation;
/** 显示方式 */
@property (nonatomic, assign) GKPhotoBrowserShowStyle showStyle;
/** 隐藏方式 */
@property (nonatomic, assign) GKPhotoBrowserHideStyle hideStyle;
/** 图片加载方式 */
@property (nonatomic, assign) GKPhotoBrowserLoadStyle loadStyle;
/** 原图加载加载方式 */
@property (nonatomic, assign) GKPhotoBrowserLoadStyle originLoadStyle;
/** 图片加载失败显示方式 */
@property (nonatomic, assign) GKPhotoBrowserFailStyle failStyle;
/** 代理 */
@property (nonatomic, weak) id<GKPhotoBrowserDelegate> delegate;

/** 是否禁止屏幕旋转监测 */
@property (nonatomic, assign) BOOL isScreenRotateDisabled;

/** 是否禁用默认单击事件 */
@property (nonatomic, assign) BOOL isSingleTapDisabled;

/** 是否显示状态栏，默认NO：不显示状态栏 */
@property (nonatomic, assign) BOOL isStatusBarShow;

/** 滑动消失时是否隐藏原来的视图：默认YES */
@property (nonatomic, assign) BOOL isHideSourceView;

/** 滑动切换图片时，是否恢复上（下）一张图片的缩放程度，默认是NO */
@property (nonatomic, assign) BOOL isResumePhotoZoom;

/** 横屏时是否充满屏幕宽度，默认YES，为NO时图片自动填充屏幕 */
@property (nonatomic, assign) BOOL isFullWidthForLandSpace;

/** 是否适配安全区域，默认NO，为YES时图片会自动适配iPhone X的安全区域 */
@property (nonatomic, assign) BOOL isAdaptiveSafeArea;

/**
 开启这个选项后 在加载gif的时候 会大大的降低内存.与YYImage对gif的内存优化思路一样 default is NO
 */
@property (nonatomic, assign) BOOL isLowGifMemory;

/**
 * 是否启用滑动返回手势处理（当showStyle为GKPhotoBrowserShowStylePush时有效）
 */
@property (nonatomic, assign) BOOL isPopGestureEnabled;

/**
 图片最大放大倍数
 */
@property (nonatomic, assign) CGFloat maxZoomScale;

/** 浏览器背景（默认黑色） */
@property (nonatomic, strong) UIColor   *bgColor;

// 加载失败时显示的文字或图片
@property (nonatomic, copy) NSString    *failureText;
@property (nonatomic, strong) UIImage   *failureImage;

// 初始化方法

/**
 创建图片浏览器

 @param photos 包含GKPhoto对象的数组
 @param currentIndex 当前的页码
 @return 图片浏览器对象
 */
+ (instancetype)photoBrowserWithPhotos:(NSArray<GKPhoto *> *)photos currentIndex:(NSInteger)currentIndex;

- (instancetype)initWithPhotos:(NSArray<GKPhoto *> *)photos currentIndex:(NSInteger)currentIndex;

/**
 为浏览器添加自定义遮罩视图

 @param coverViews  视图数组
 @param layoutBlock 布局
 */
- (void)setupCoverViews:(NSArray *)coverViews layoutBlock:(layoutBlock)layoutBlock;

/**
 显示图片浏览器

 @param vc 控制器
 */
- (void)showFromVC:(UIViewController *)vc;

/**
 选中指定位置的内容

 @param index 位置索引
 */
- (void)selectedPhotoWithIndex:(NSInteger)index animated:(BOOL)animated;

/**
 移除指定位置的内容

 @param index 位置索引
 */
- (void)removePhotoAtIndex:(NSInteger)index;

/**
 重置图片浏览器

 @param photos 图片内容数组
 */
- (void)resetPhotoBrowserWithPhotos:(NSArray *)photos;

/**
 加载原图方法，外部调用
 */
- (void)loadCurrentPhotoImage;

+ (void)setImageManagerClass:(Class<GKWebImageProtocol>)cls;

@end

NS_ASSUME_NONNULL_END
