//
//  UserHelpClass.h
//  shopProchase
//
//  Created by hi  kobe on 2019/9/4.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonMessageModel.h"


NS_ASSUME_NONNULL_BEGIN

@interface UserHelpClass : NSObject
+ (NSString *)toJSONData:(id)theData;
/**
 *  push到某个控制器
 */
+ (id)pushfromViewController:(id)viewCtrl
                  stroyboard:(NSString *)stroyboardName
          viewControllerName:(NSString *)ctrlName;

+ (id)presentModaVC:(id)viewCtrl
         stroyboard:(NSString *)stroyboardName
 viewControllerName:(NSString *)ctrlName;
//获取手机imie
+(NSString *)getphoneimie;
/**
 *  调用系统的Alert的提示弹窗
 *
 *  @param message 提示信息
 */
+ (void)showAlertViewWithMessage:(NSString *)message;
+ (void)showAlertViewWithMessageaaaa:(NSString *)message;
/**
 *数据持久化存储
 */
+ (void)saveInfomationToNSUserdefaultWitObj:(id)obj Key:(NSString *)key;//数据持久化存储
+ (id)getInfomationFromNSUserdefaultWith:(NSString *)key;//数据持久化获取
+(void)removeNSUserdefault:(NSString *)key;

/**
 *  获取时间戳
 *
 *  @return 时间戳
 */
+(NSString *)dateTime;
//时间戳转时间
+(NSString *)normaldate:(NSString *)datestring;
//分享
+ (void)shareContent:(NSString *)content shareTitle:(NSString *)title;

//分享
+ (void)shareContentWithParams:(NSDictionary *)params;

+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize;

//去掉反斜杠
+ (NSString *)qudaofxg:(NSString *)string;
//网络请求后台返回错误码判断
+(NSString *)Errorcodeinterpretation:(NSString *)string;
//上传图片
+(void)senImagePhotoPhotoDataArray:(NSArray *)photoArray success:(void (^)(NSArray *))success;

+ (NSArray *)zfcchuli:(NSString *)string;
+ (NSString *)fxg:(NSString *)string;


/**
 *用户个人信息 模型
 */
+ (void)setUserInfoModel:(PersonMessageModel *)userInfoModel;
+ (PersonMessageModel *)getUserInfoModel;
+ (void)removeUserInfoModel;


+ (BOOL)verifyIDCardNumber:(NSString *)value;//验证身份证号
+ (BOOL)validateContactNumber:(NSString *)mobileNum;//验证手机号

+ (BOOL)flagePwd:(NSString *)pwd sure:(NSString *)surepwd;
//用户分享
//+(void)share

@end

NS_ASSUME_NONNULL_END
