//
//  HJContentModel.m
//  tuiku
//
//  Created by hjun on 2017/7/25.
//  Copyright © 2017年 hjun. All rights reserved.
//

#import "HJContentModel.h"
#import <SVProgressHUD.h>
#import "HJTool.h"
@implementation HJContentModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
       
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)contentModelWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
   }

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.id forKey:@"id"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.time forKey:@"time"];
    [aCoder encodeObject:self.rectime forKey:@"rectime"];
    [aCoder encodeObject:self.uts forKey:@"uts"];
    [aCoder encodeObject:self.feed_title forKey:@"feed_title"];
    [aCoder encodeObject:self.img forKey:@"img"];
    
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
       if (self = [super init]) {
        self.id = [aDecoder decodeObjectForKey:@"id"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.time = [aDecoder decodeObjectForKey:@"time"];
        self.rectime = [aDecoder decodeObjectForKey:@"rectime"];
        self.uts = [aDecoder decodeObjectForKey:@"uts"];
        self.feed_title = [aDecoder decodeObjectForKey:@"feed_title"];
        self.img = [aDecoder decodeObjectForKey:@"img"];
    }
    return self;
    
}
+ (void)contentModelGetDataWithUrlString:(NSString *)urlString title:(NSString *)title parameters:par successblack:(successBlack)successblack{
    [SVProgressHUD show];
    [HJTool getWithURLString:urlString parameter:par progress:nil success:^(id responseObject) {
        
        NSDictionary *responseObjectDic = (NSDictionary *)responseObject;
        NSArray *articles = responseObjectDic[@"articles"];
        NSMutableArray *mut = [NSMutableArray array];
        for (NSDictionary* dict in articles) {
            HJContentModel *content = [self contentModelWithDict:dict];
            [mut addObject:content];
        }
        successblack(mut.copy);
        [SVProgressHUD dismiss];
        
    } failure:^(NSError *error) {
        [SVProgressHUD showImage:[UIImage imageNamed:@"fail_result"] status:@"加载失败"];
        NSLog(@"%@",error);

    }];
    
    
    
    
}
@end
