//
//  PersonMessageModel.m
//  shopProchase
//
//  Created by hi  kobe on 2019/9/4.
//  Copyright © 2019 hi  kobe. All rights reserved.
//

#import "PersonMessageModel.h"

@implementation PersonMessageModel


+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"ID" : @"id",
             };
}
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.brithday forKey:@"brithday"];
    [aCoder encodeObject:self.busin_id forKey:@"busin_id"];
    [aCoder encodeObject:self.email forKey:@"email"];
    [aCoder encodeObject:self.enter forKey:@"enter"];
    [aCoder encodeObject:self.image forKey:@"image"];
    [aCoder encodeObject:self.nickname forKey:@"nickname"];
    [aCoder encodeObject:self.read forKey:@"read"];
    [aCoder encodeObject:self.sex forKey:@"sex"];
    [aCoder encodeObject:self.upper forKey:@"upper"];
    [aCoder encodeObject:self.write forKey:@"write"];
    [aCoder encodeObject:self.ID forKey:@"ID"];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        self.brithday = [aDecoder decodeObjectForKey:@"brithday"];
        self.busin_id = [aDecoder decodeObjectForKey:@"busin_id"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
        self.enter = [aDecoder decodeObjectForKey:@"enter"];
        self.image = [aDecoder decodeObjectForKey:@"image"];
        self.nickname = [aDecoder decodeObjectForKey:@"nickname"];
        self.read = [aDecoder decodeObjectForKey:@"read"];
        
        self.sex = [aDecoder decodeObjectForKey:@"sex"];
        self.upper = [aDecoder decodeObjectForKey:@"upper"];
        self.write = [aDecoder decodeObjectForKey:@"write"];
        self.ID = [aDecoder decodeObjectForKey:@"ID"];
        
    }
    return self;
}
@end
