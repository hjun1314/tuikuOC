//
//  HJSearchViewController.m
//  tuiku
//
//  Created by hjun on 2017/7/21.
//  Copyright © 2017年 hjun. All rights reserved.
//

#import "HJSearchViewController.h"
@interface HJSearchViewController ()

@end

@implementation HJSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titleModelArray = [HJHomdModel homeModelGetMoreArrayWith:@"search.plist"];
   [self setUI];
    [self setNav];
}

- (void)setNav{
    UISearchBar *searchBar = [[UISearchBar alloc]init];
    searchBar.placeholder = @"请输入搜索内容";
    self.navigationItem.titleView = searchBar;
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnClick)];
    
    
    self.navigationItem.leftBarButtonItems = @[back];
}
-(void)backBtnClick{
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
