//
//  HJHomeController.m
//  tuiku
//
//  Created by hjun on 2017/7/21.
//  Copyright © 2017年 hjun. All rights reserved.
//

#import "HJHomeController.h"
#import "HJNavViewController.h"
#import "HJSearchViewController.h"

@interface HJHomeController ()

@end

@implementation HJHomeController

- (void)viewDidLoad {
   [super viewDidLoad];
    [self setNav];
    self.titleModelArray = [HJHomdModel homeModelGetMoreArrayWith:@"titleArray.plist"];
    [self setUI];
}

- (void)setNav{
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"search"] style:UIBarButtonItemStylePlain target:self action:@selector(searchBtn)];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"more1"] style:UIBarButtonItemStylePlain target:self action:@selector(moreBtn)];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
}
- (void)searchBtn{
    HJSearchViewController *searchVc = [[HJSearchViewController alloc]init];
    HJNavViewController *nav = [[HJNavViewController alloc]initWithRootViewController:searchVc];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
}
- (void)moreBtn{
    NSLog(@"222");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
