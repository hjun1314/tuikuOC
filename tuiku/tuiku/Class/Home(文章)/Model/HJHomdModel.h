//
//  HJHomdModel.h
//  tuiku
//
//  Created by hjun on 2017/7/21.
//  Copyright © 2017年 hjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJHomdModel : NSObject
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *cid;
@property (nonatomic,copy)NSString *urlstring;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)homeModelWithDict:(NSDictionary *)dict;
+ (NSArray *)homeModelGetMoreArrayWith:(NSString *)plistName;
@end
