//
//  ZZStringSize.m
//  shopProchase
//
//  Created by hi  kobe on 2019/8/15.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "ZZStringSize.h"

@implementation ZZStringSize

+(CGSize)getSizeToString:(NSString *)string forFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode) lineBreakMode{
    CGSize textSize;
    if (CGSizeEqualToSize(size, CGSizeZero))
    {
        NSMutableDictionary *stringStyle=[[NSMutableDictionary alloc]init];
        [stringStyle setObject:font forKey:NSFontAttributeName];
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
        textSize = [string sizeWithAttributes:attributes];
        
    }
    else
    {
        NSStringDrawingOptions option = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
        //NSStringDrawingTruncatesLastVisibleLine如果文本内容超出指定的矩形限制，文本将被截去并在最后一个字符后加上省略号。 如果指定了NSStringDrawingUsesLineFragmentOrigin选项，则该选项被忽略 NSStringDrawingUsesFontLeading计算行高时使用行间距。（译者注：字体大小+行间距=行高）
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
        CGRect rect = [string boundingRectWithSize:size options:option attributes:attributes context:nil];
        textSize = rect.size;
        
    }
    return textSize;
}
@end
