//
//  HJContentTool.m
//  tuiku
//
//  Created by hjun on 2017/7/26.
//  Copyright © 2017年 hjun. All rights reserved.
//

#import "HJContentTool.h"
#import "HJContentModel.h"
#import <FMDB.h>
static FMDatabase *_db;
@implementation HJContentTool


+ (void)initialize{
    
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingString:@"homeData.db"];
    //chang
    _db = [FMDatabase databaseWithPath:filePath];
    [_db open];
    if (![_db open]) {
        return;
    }
    [_db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_artical_deal(id integer PRIMARY KEY, deal blob NOT NULL, deal_id text NOT NULL);"];
}

/**
 *  删除一个模型
 *
 */
+(void)deleteContentWithModel:(HJContentModel *)model{
     [_db executeUpdateWithFormat:@"DELETE FROM t_artical_deal WHERE deal_id=%@", model.id];
}
/**
 *  添加一个模型
 *
 */
+ (void)addContentWithModel:(HJContentModel *)model{
    //归档
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:model];
    
    [_db executeUpdateWithFormat:@"INSERT INTO t_artical_deal(deal,deal_id) VALUES(%@,%@);",data,model.id];
    

}
/**
 *  添加一组数据
 *
 */
+ (void)addContentWithArray:(NSArray *)modelArray{
    
    [_db executeUpdate:@"DELETE FROM t_artical_deal;"];
    
    for (HJContentModel *model in modelArray) {
        
        [self addContentWithModel:model];
        
    }
    
  
}
/**
 *  获取全部数据
 *
 *  @return 数据
 */
+ (NSArray *)contentBack{
    FMResultSet *set = [_db executeQuery:@"SELECT * FROM t_artical_deal;"];
    
    //3. 获取数据 --> 获取模型的二进制数据  --> 还原成模型 --> 并且添加到数组中返回
    NSMutableArray *tempArray = [NSMutableArray array];
    
    while ([set next]) {
        NSData *data = [set objectForColumnName:@"deal"];
        HJContentModel *dealModel = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        [tempArray addObject:dealModel];
        
    }
    return tempArray;

}

@end
