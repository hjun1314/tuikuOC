//
//  HJBaseHomeController.h
//  tuiku
//
//  Created by hjun on 2017/7/21.
//  Copyright © 2017年 hjun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HJHomdModel.h"
#import "HJHomeScrollView.h"
#import "HJHomeCollectionView.h"
@interface HJBaseHomeController : UIViewController

@property (nonatomic,strong)NSArray *titleModelArray;

@property (nonatomic,strong)HJHomeScrollView *homeScrollView;

@property (nonatomic,strong)HJHomeCollectionView *collectionView;

@property (nonatomic,strong)UICollectionViewFlowLayout *layout;

//记录label下标
@property (nonatomic,assign)NSInteger index;

- (void)setUI;

@end
