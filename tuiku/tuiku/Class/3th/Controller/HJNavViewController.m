//
//  HJNavViewController.m
//  tuiku
//
//  Created by hjun on 2017/7/21.
//  Copyright © 2017年 hjun. All rights reserved.
//

#import "HJNavViewController.h"
#define NavColor [UIColor colorWithRed:22.0/255.0 green:147.0/255.0 blue:114.0/255.0 alpha:1.0]
@interface HJNavViewController ()

@end

@implementation HJNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    self.navigationBar.barTintColor = NavColor
    ;
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    [super pushViewController:viewController animated:animated];
    
}

- (void)addBackBtn:(UIViewController *)viewController{
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(clickBackBtn)];
    viewController.navigationItem.leftBarButtonItem = back;
    
    
    
}
- (void)clickBackBtn{
    
    [self popViewControllerAnimated:YES];
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
