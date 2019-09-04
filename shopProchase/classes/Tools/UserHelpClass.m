//
//  UserHelpClass.m
//  shopProchase
//
//  Created by hi  kobe on 2019/9/4.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "UserHelpClass.h"

@implementation UserHelpClass

+ (NSString *)toJSONData:(id)theData
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:theData options:NSJSONWritingPrettyPrinted error:nil];
    
    if ([jsonData length]&&error== nil){
        NSString *datasring = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return datasring;
        
    }else{
        return nil;
    }
}

//获取手机imie
+(NSString *)getphoneimie{
    NSString *imitstring;
    
    return imitstring;
}
//*清除所有的存储本地的数据*/
+(void)clearAllUserDefaultsData{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [userDefaults dictionaryRepresentation];
    for(id key in dic){
        [userDefaults removeObjectForKey:key];
    }
    [userDefaults synchronize];
}
+ (id)presentModaVC:(id)viewCtrl
         stroyboard:(NSString *)stroyboardName
 viewControllerName:(NSString *)ctrlName {
    
    UIViewController *fromCtrl = (UIViewController *)viewCtrl;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:stroyboardName bundle:nil];
    UITabBarController *toCtrl = [storyboard instantiateViewControllerWithIdentifier:ctrlName];
    [fromCtrl presentViewController:toCtrl animated:YES completion:^{
        
    }];
    return toCtrl;
}
//数据持久化
+ (void)saveInfomationToNSUserdefaultWitObj:(id)obj Key:(NSString *)key
{
    NSMutableData *saveData = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:saveData];
    [archiver encodeObject:obj forKey:key];
    [archiver finishEncoding];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:nil forKey:key];
    [defaults setObject:saveData forKey:key];
    [defaults synchronize];
}

/**
 *用户个人信息 模型
 */
+ (void)setUserInfoModel:(PersonMessageModel *)userInfoModel
{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:userInfoModel];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:data forKey:@"message"];
}
+ (PersonMessageModel *)getUserInfoModel
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [defaults objectForKey:@"message"];
    if (data == nil) {
        return nil;
    } else {
        PersonMessageModel *model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        return model;
    }
}
+ (void)removeUserInfoModel
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"message"];
}
//读取持久化数据
+ (id)getInfomationFromNSUserdefaultWith:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:[defaults objectForKey:key]];
    id obj = [unarchiver decodeObjectForKey:key];
    return obj;
}
+(void)removeNSUserdefault:(NSString *)key{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}
/**
 *  获取时间戳
 *
 *  @return 时间戳
 */
+(NSString *)dateTime{
    NSDate *date=[NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval time=[date timeIntervalSince1970];
    NSString *strTime=[NSString stringWithFormat:@"%.0f",time];
    return strTime;
}
+(NSString *)normaldate:(NSString *)datestring{
    
    NSString * timeStampString = datestring;
    NSTimeInterval _interval=[[timeStampString substringToIndex:10] doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:_interval];
    
    //    NSString *timeStampString  = datestring;
    // iOS 生成的时间戳是10位
    //    NSTimeInterval interval    =[timeStampString doubleValue] / 1000.0;
    //    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd"];;
    NSString *dateString       = [formatter stringFromDate: date];
    return dateString;
}
//网络请求后台返回错误码判断
+(NSString *)Errorcodeinterpretation:(NSString *)string{
    NSString *meaasgestring;
    if ([string isEqualToString:@"1001"]) {
        meaasgestring = @"账号或密码错误";
    }else if ([string isEqualToString:@"1002"]){
        meaasgestring = @"暂无权限";
    }else if ([string isEqualToString:@"1003"]){
        meaasgestring = @"身份验证过期,请从新登录";
        //        LoginViewcontrollerViewController *loginVC = [[LoginViewcontrollerViewController alloc]init];
        //        loginVC.block = ^{
        //
        //        };
        //        UIWindow * window = [[UIApplication sharedApplication] keyWindow];
        //        UIViewController *rootVC = window.rootViewController;
        //        //        UIViewController *presentedViewController = rootVC.presentedViewController;
        //        [rootVC presentViewController:loginVC animated:YES completion:^{
        //        }];
        
    }else{
        meaasgestring = @"未知错误";
    }
    return meaasgestring;
}
//1.等比率缩放
+ (UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize{
    
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width * scaleSize, image.size.height * scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height * scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

+ (NSString *)qudaofxg:(NSString *)string{
    
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    return string;
}
+ (BOOL)verifyIDCardNumber:(NSString *)value
{
    value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([value length] != 18) {
        return NO;
    }
    NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
    NSString *leapMmdd = @"0229";
    NSString *year = @"(19|20)[0-9]{2}";
    NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
    NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
    NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
    NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
    NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
    NSString *regex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd  , @"[0-9]{3}[0-9Xx]"];
    
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if (![regexTest evaluateWithObject:value]) {
        return NO;
    }
    int summary = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7
    + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9
    + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10
    + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5
    + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8
    + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4
    + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2
    + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6
    + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
    NSInteger remainder = summary % 11;
    NSString *checkBit = @"";
    NSString *checkString = @"10X98765432";
    checkBit = [checkString substringWithRange:NSMakeRange(remainder,1)];// 判断校验位
    return [checkBit isEqualToString:[[value substringWithRange:NSMakeRange(17,1)] uppercaseString]];
}
+ (BOOL)validateContactNumber:(NSString *)mobileNum{
    if (mobileNum.length != 11){
        return NO;
    }
    
    NSString *mobilefirst = [mobileNum substringToIndex:1];
    if ([mobilefirst isEqualToString:@"1"]) {
        return YES;
    }else{
        return NO;
    }
    
    
    
    /**
     * 手机号码
     * 移动：134(0-8)、135、136、137、138、139、147、150、151、152、157、158、159、172、178、182、183、184、187、188、198
     *
     * 联通：130、131、132、145、155、156、166、175、176、185、186
     *
     * 电信：133、149、153、173、177、180、181、189、199
     *
     虚拟运营商
     电信：1700、1701、1702
     移动：1703、1705、1706
     联通：1704、1707、1708、1709、171
     卫星通信：1349
     
     
     */
    
    //    NSString *MOBILE = @"^1(3[0-9]|4[579]|5[0-35-9]|16[6]|7[0135678]|8[0-9]|19[89])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134(0-8)、135、136、137、138、139、147、150、151、152、157、158、159、172、178、182、183、184、187、188、198
     
     */
    
    
    //    NSString * CM = @"^1(3[4-9]|4[7]|5[0-27-9]|7[08]|8[2-478])\\d{8}$";
    /**
     * 中国联通：China Unicom
     * 130、131、132、145、155、156、166、175、176、185、186
     */
    //    NSString * CU = @"^1(3[0-2]|4[5]|5[56]|7[0156]|8[56])\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133、149、153、173、177、180、181、189、199
     */
    //    NSString * CT = @"^1(3[3]|4[9]|53|7[037]|8[019])\\d{8}$";
    
    //    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    //
    //    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    //
    //    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    //
    //    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    //
    //
    //
    //    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
    //
    //        || ([regextestcm evaluateWithObject:mobileNum] == YES)
    //
    //        || ([regextestct evaluateWithObject:mobileNum] == YES)
    //
    //        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    //    {
    //        return YES;
    //    }else{
    //        return NO;
    //    }
}


+(BOOL)MatchLetter21:(NSString *)str{
    
    //字母数字下划线
    NSString *emailRegex = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$";
    NSPredicate *emailTestB = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    if ([emailTestB evaluateWithObject:str]== YES)
        return YES;
    else
        return NO;
}

+ (BOOL)flagePwd:(NSString *)pwd sure:(NSString *)surepwd{
    
    BOOL flage;
    
    if ([self MatchLetter21:pwd]) {
        
        if (pwd.length>=6 && pwd.length<=16) {
            
            if ([pwd isEqualToString:surepwd]) {
                return  flage=YES;
            }else{
                [AlertUtils error:@"新密码两次输入不一致"];
                return  flage=NO;
            }
        }else{
            [AlertUtils error:@"密码长度在6~16之间，必须包含字母和数字"];
            return  flage=NO;
        }
    }else{
        [AlertUtils error:@"密码长度在6~16之间，必须包含字母和数字"];
        return  flage=NO;
    }
}
@end
