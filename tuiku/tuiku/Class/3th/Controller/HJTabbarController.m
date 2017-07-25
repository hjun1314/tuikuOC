//
//  HJTabbarController.m
//  tuiku
//
//  Created by hjun on 2017/7/21.
//  Copyright © 2017年 hjun. All rights reserved.
//

#import "HJTabbarController.h"
#import "HJHomeController.h"
#import "HJSiteViewController.h"
#import "HJUserViewController.h"
#import "HJTopicViewController.h"
#import "HJWeeklyViewController.h"
#import "HJNavViewController.h"
@interface HJTabbarController ()

@end

@implementation HJTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewcontrollers];
}

- (void)addChildViewcontrollers{
    
    HJHomeController *homeVc = [[HJHomeController alloc]init];
    [self addChildViewcontroller:homeVc WithTitle:@"文章" WithImage:@"tab_home"];
    
    HJSiteViewController *site = [[HJSiteViewController alloc]init];
    [self addChildViewcontroller:site WithTitle:@"站点" WithImage:@"tab_site"];
    
    HJTopicViewController *topic = [[HJTopicViewController alloc]init];
    [self addChildViewcontroller:topic WithTitle:@"主题" WithImage:@"tab_topic"];
    
    HJWeeklyViewController *weekly = [[HJWeeklyViewController alloc]init];
    [self addChildViewcontroller:weekly WithTitle:@"周刊" WithImage:@"tab_dis"];
    
    HJUserViewController *user = [[HJUserViewController alloc]init];
    [self addChildViewcontroller:user WithTitle:@"我的" WithImage:@"tab_user"];
    
}

- (void)addChildViewcontroller:(UIViewController *)viewController WithTitle:(NSString *)title WithImage:(NSString *)imageName{
    viewController.tabBarItem.image = [UIImage imageNamed:imageName];
    viewController.title = title;
    
    HJNavViewController *nav = [[HJNavViewController alloc]initWithRootViewController:viewController];
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
