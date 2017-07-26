//
//  HJContentController.m
//  tuiku
//
//  Created by hjun on 2017/7/25.
//  Copyright © 2017年 hjun. All rights reserved.
//

#import "HJContentController.h"
#import "HJContentModel.h"
#import "HJContentCell.h"
#import <Masonry.h>
#import <MJRefresh.h>
#import <AFNetworking.h>
#import "HJContentTool.h"
@interface HJContentController ()

@property (nonatomic,strong)NSMutableArray *contenrModelArray;
@property (nonatomic,strong) UIView *coverView;


@end

@implementation HJContentController

-(UIView *)coverView{
    
    if (_coverView == nil) {
        _coverView = [[UIView alloc]init];
        _coverView.backgroundColor = [UIColor redColor];
        _coverView.frame = self.view.bounds;
        
    }
    return _coverView;
}

- (NSMutableArray *)contenrModelArray{
    
    if (_contenrModelArray == nil) {
        _contenrModelArray = [NSMutableArray array];
    }
    return _contenrModelArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 73;
   self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self getData];
       [self.tableView.mj_header endRefreshing];
       
   }];
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        [self getFootData];
        
        [self.tableView.mj_footer endRefreshing];
        
    }];
    [self getData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getData{
    __weak typeof (self) weakSelf = self;
    AFNetworkReachabilityManager *manger = [AFNetworkReachabilityManager manager];
    
    if (!manger.isReachable) {
        
        if ([self.titlename isEqualToString:@"热门"]) {
            [self.contenrModelArray addObjectsFromArray:[HJContentTool contentBack]];
            [self.tableView reloadData];
        }else{
            if (!self.urlstring) {
                return;
            }
            [HJContentModel contentModelGetDataWithUrlString:self.urlstring title:self.title parameters:nil successblack:^(NSArray *modelArray) {
                if (self.coverView) {
                    [weakSelf.coverView removeFromSuperview];
                }
                
                [weakSelf.contenrModelArray removeAllObjects];
                [weakSelf.contenrModelArray addObjectsFromArray:modelArray];
                [weakSelf.tableView reloadData];
            }];
            
        }
        
    }
    
}

- (void)getFootData{
    
    HJContentModel *model = [self.contenrModelArray lastObject];
    
    NSDictionary *par = [[NSDictionary alloc]init];
    if (model) {
        par = @{@"last_id":model.id,
                @"last_time":model.uts,
                };
    }
    if (!self.urlstring) {
        return;
    }
    __weak typeof(self) weakSelf = self;
    
    [HJContentModel contentModelGetDataWithUrlString:self.urlstring title:self.titlename parameters:nil successblack:^(NSArray *modelArray) {
        
        [weakSelf.contenrModelArray addObjectsFromArray:modelArray];
        
        [weakSelf.tableView reloadData];
        
    }];
    
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contenrModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    HJContentModel *model = self.contenrModelArray[indexPath.item];
    static NSString *ID = @"";
    if (model.img.length > 0) {
        ID = @"HJContentCell";
    }else{
        ID = @"HJContentCell1";
    }
    HJContentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        if ([ID isEqualToString:@"HJContentCell"]) {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"HJContentCell" owner:nil options:nil]lastObject];
        }else{
            cell = [[[NSBundle mainBundle]loadNibNamed:@"HJContentCell1" owner:nil options:nil]lastObject];
        }
    }
    cell.content = model;
    return cell;
}

@end
