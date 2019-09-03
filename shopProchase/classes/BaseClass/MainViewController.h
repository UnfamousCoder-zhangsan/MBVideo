//
//  MainViewController.h
//  shopProchase
//
//  Created by hi  kobe on 2019/8/15.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController
@property (nonatomic, strong)UIBarButtonItem   *rightbar;      //右侧导航栏按钮
@property (nonatomic, strong)UIView            *backView;
@property (nonatomic, strong)UIImageView       *rightImage;    //右侧按钮图片
@property (nonatomic, strong)UIImageView       *rightRedIamge; //右侧红点提示
-(UIWindow*)mainWindow;
/**
 *  隐藏tabbar
 */
- (void)hiddenTabBar;

/**
 *  导航栏字体颜色
 *
 *  @param color 颜色
 */
- (void)setNavViewTitleColor:(NSObject *) color;

/**
 *  返回按钮(图片)
 */
- (void)setNavLeftBtnWithImg;
/**
 *  返回按钮(图片)
 */
- (void)setNavLeftBtnWithImgName:(NSString *)string andPictureWidth:(float)width andPictureHeight:(float)height;

/**
 *  导航栏左侧按钮（文字）
 */
- (void)setNavLeftBtnWithString:(NSString *)string andStringColor:(UIColor *)color andStringFont:(float)font;
/**
 添加超时图片
 */
//- (void)addTimeOutViewToSubView;

/**
 移除超时图片，刷新数据
 */
//- (void)removeImgAndRefreshData;

/**
 *  导航栏左侧按钮点击事件
 */
- (void)navLeftClicked;

/**
 *  返回按钮点击事件
 */
- (void)backAction;

/**
 *  修改右导航按钮(图片类型)
 *
 *  @param imagename 图片名
 */
- (void)setNavRightBtnWithImgName:(NSString *)imagename andPictureWidth:(float)width andPictureHeight:(float)height;
- (void)setNavRightBtnWithImgNameanother:(NSString *)imagename andPictureWidth:(float)width andPictureHeight:(float)height;
/**
 *  修改导航栏右边按钮，返回按钮以添加多个按钮(图片类型)
 *
 *  @param imagename 图片名
 */
- (UIBarButtonItem *)setNavRightBtnWithImgName2:(NSString *)imagename andTag:(NSInteger)tag andPictureWidth:(float)width andPictureHeight:(float)height;

/**
 *  修改右导航按钮(文字类型)
 *
 *  @param string 文字
 */
- (void)setNavRightBtnWithString:(NSString *)string;

/**
 *  修改右导航按钮(view类型)
 *
 *  @param view view
 */
- (void)setNarRightBtnWithView:(UIView *)view;

/**
 *  设置右导航文字颜色
 *
 *  @param Color 颜色
 */
- (void)setNavRightTitleColor:(UIColor *)Color;

/**
 *  右导航点击事件
 */
- (void)rightAction;

/**
 *  修改导航栏titleview
 *
 *  @param titleview 自定义view
 */
- (void)setNavTitleView:(UIView *)titleview;
-(void)islogviiew;
@end

NS_ASSUME_NONNULL_END
