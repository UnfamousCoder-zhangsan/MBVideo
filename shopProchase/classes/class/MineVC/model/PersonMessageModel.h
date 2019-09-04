//
//  PersonMessageModel.h
//  shopProchase
//
//  Created by hi  kobe on 2019/9/4.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonMessageModel : NSObject

@property(nonatomic,copy)NSString *brithday;//生日
@property(nonatomic,copy)NSString *busin_id;//用户商家ID
@property(nonatomic,copy)NSString *email;//邮箱
@property(nonatomic,copy)NSString *enter;//入驻状态 0待审核,1审核成功,2审核失败,3待入驻、
@property(nonatomic,copy)NSString *image;//头像
@property(nonatomic,copy)NSString *nickname;//昵称
@property(nonatomic,copy)NSString *read;//消息未读数量
@property(nonatomic,copy)NSString *sex;//性别[0男1女]
@property(nonatomic,copy)NSString *upper;//1上架0下架(默认2)
@property(nonatomic,copy)NSString *write;//1开启了核销,0关闭了核销,2不用使用的状态
@property(nonatomic,copy)NSString *ID;//用户id
@property(nonatomic,copy)NSString *enter_read; //是否修改入驻信息
@end

NS_ASSUME_NONNULL_END
