//
//  HJContentModel.h
//  tuiku
//
//  Created by hjun on 2017/7/25.
//  Copyright © 2017年 hjun. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^successBlack)(NSArray *modelArray);
@interface HJContentModel : NSObject<NSCoding>

@property (nonatomic,copy) NSString *id;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,copy) NSString *time;

@property (nonatomic,copy) NSString *rectime;

@property (nonatomic,copy) NSString *uts;

@property (nonatomic,copy) NSString *feed_title;

@property (nonatomic,copy) NSString *img;

+ (instancetype)contentModelWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;

+ (void)contentModelGetDataWithUrlString:(NSString *)urlString title:(NSString *)title parameters:par successblack:(successBlack)successblack;



@end
