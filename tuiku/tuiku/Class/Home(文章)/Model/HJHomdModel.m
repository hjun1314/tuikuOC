//
//  HJHomdModel.m
//  tuiku
//
//  Created by hjun on 2017/7/21.
//  Copyright © 2017年 hjun. All rights reserved.
//

#import "HJHomdModel.h"

@implementation HJHomdModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)homeModelWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
+ (NSArray *)homeModelGetMoreArrayWith:(NSString *)plistName{
    
    NSString *path = [[NSBundle mainBundle]pathForResource:plistName ofType:nil];
    NSArray *plistArray = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *mutArray = [NSMutableArray array];
    for (NSDictionary *dict in plistArray) {
        HJHomdModel *model = [HJHomdModel homeModelWithDict:dict];
        [mutArray addObject:model];
        
    }
    return mutArray.copy;
}

@end
