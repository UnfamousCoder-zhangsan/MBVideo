//
//  Header.h
//  shopProchase
//
//  Created by hi  kobe on 2019/8/15.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#ifndef Header_h
#define Header_h


#define WeakSelf __weak typeof(self) weakSelf = self; //弱引用


#define DEBUG 1 //1-测试环境，0-发布环境


#if DEBUG


#define TESTURL  @"http://zhi.coolmoban.com/api/v1/"
//#define TESTURL  @"http://192.168.16.140/purchase/public/api/v1/"
//#define TESTURL  @"http://api.sczcgapp.com/api/v1/"


#define WEBURl @"https://wx.idcmy.cn/"
#else

#endif
/**
  三方平台使用
 */
/**友盟appkey*/
#define UMAPPKEY @"5d37f4af0cafb29e5f000385"
/**微信appkey*/
#define WeChatAPPKEY @"wxada86729ea4e753e"
/**微信secret*/
#define WeChatAPPSECRET @"4d2f9e120893b9f00beb42f470ee68ad"
/**QQapp ID*/
#define QQAPPID @"1107818507"
/**QQapp KEY*/
#define QQAPPKEY @"CdT2LolSy6XXJFhh"
/**极光appkey*/
#define JPushAPPKEYS @"4ebaf0afa510abb47d473098"

/**
 *  屏幕高度
 */
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
/**
 *  屏幕宽度
 */
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define kMaxNumber 200

#define IS_IPHONEX (([[UIScreen mainScreen] bounds].size.height-812)?NO:YES)
#define StatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height //状态栏高度
#define NavBarHeight 44.0
#define TabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49) //底部tabbar高度
#define TopHeight (BZL_StatusBarHeight + BZL_NavBarHeight) //整个导航栏高度
#define NAV_HEIGHT (StatusBarHeight + NavBarHeight)
#define TABBAR_HEIGHT ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)

#define navigationBarframe [[UIApplication sharedApplication] statusBarFrame];

#define color(r,g,b)  [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1]
//屏幕高
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
//屏幕宽
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define regist_nib(a,b) [a registerNib:[UINib nibWithNibName:NSStringFromClass([b class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([b class])];
#define regist_collection(a,b) [a registerNib:[UINib nibWithNibName:NSStringFromClass([b class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([b class])]
#define regist_collection_header(a,b) [a registerNib:[UINib nibWithNibName:NSStringFromClass([b class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([b class])]
#define regist_collection_footer(a,b) [a registerNib:[UINib nibWithNibName:NSStringFromClass([b class]) bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([b class])]

//数组判空
#define ArrayNotNull(o) ( o!=nil && ![o isKindOfClass:[NSNull class]]  && o.count!=0 && ![o[0] isKindOfClass:[NSNull class]] )

/**iPhone*/
#define UI_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
/**ipad*/
#define UI_IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
/*6 - 8**/
#define SCREENSIZE_IS_47  (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0)
/**6 - 8Plus*/
#define SCREENSIZE_IS_55  (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0 || [[UIScreen mainScreen] bounds].size.width == 736.0)
/**判断iPHoneX、iPHoneXs(5.8)*/
#define SCREENSIZE_IS_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !UI_IS_IPAD : NO)
/**判断iPHoneXr(6.1)*/
#define SCREENSIZE_IS_XR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !UI_IS_IPAD : NO)
/**判断iPhoneXs Max**/
#define SCREENSIZE_IS_XS_MAX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !UI_IS_IPAD : NO)
/**判断是否是iphoneX系列*/
#define IS_IPhoneX_All ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896)


#endif /* Header_h */
