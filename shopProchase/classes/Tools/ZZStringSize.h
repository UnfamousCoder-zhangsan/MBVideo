//
//  ZZStringSize.h
//  shopProchase
//
//  Created by hi  kobe on 2019/8/15.
//  Copyright © 2019 hi  kobe. All rights reserved.
//


//根据字体大小 内容 计算文本高度 自适应

#import <UIKit/UIkit.h>
#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface ZZStringSize : NSObject

+(CGSize)getSizeToString:(NSString *)string forFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode) lineBreakMode;
@end

NS_ASSUME_NONNULL_END
