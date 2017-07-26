//
//  HJTool.h
//  tuiku
//
//  Created by hjun on 2017/7/25.
//  Copyright © 2017年 hjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HJTool : NSObject

+(void)getWithURLString:(NSString *)URLString parameter:(NSDictionary *)parameter progress:(void(^)(NSProgress *progress))progress success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

+(void)postWithURLString:(NSString *)URLString parameter:(NSDictionary *)parameter progress:(void(^)(NSProgress *progress))progress success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;


@end
