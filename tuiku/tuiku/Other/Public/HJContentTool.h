//
//  HJContentTool.h
//  tuiku
//
//  Created by hjun on 2017/7/26.
//  Copyright © 2017年 hjun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HJContentModel;
@interface HJContentTool : NSObject

/**
 *  删除一个模型
 *
 */
+(void)deleteContentWithModel:(HJContentModel *)model;
/**
 *  添加一个模型
 *
 */
+ (void)addContentWithModel:(HJContentModel *)model;
/**
 *  添加一组数据
 *
 */
+ (void)addContentWithArray:(NSArray *)modelArray;
/**
 *  获取全部数据
 *
 *  @return 数据
 */
+ (NSArray *)contentBack;

@end
