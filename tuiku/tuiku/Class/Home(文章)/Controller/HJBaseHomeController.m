//
//  HJBaseHomeController.m
//  tuiku
//
//  Created by hjun on 2017/7/21.
//  Copyright © 2017年 hjun. All rights reserved.
//

#import "HJBaseHomeController.h"
#import "HJHomeCollectionViewCell.h"

#define contentIdentifier @"contentCollectionViewIdentifier"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define Screenheight [UIScreen mainScreen].bounds.size.height
@interface HJBaseHomeController ()<HJHomeScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation HJBaseHomeController
#pragma mark - 懒加载
-(NSArray *)titleModelArray{
    
    if (_titleModelArray == nil) {
        _titleModelArray = [[NSArray alloc]init];
        
    }
    return _titleModelArray;
    
}

- (void)setUI{
    [self.view addSubview:self.homeScrollView];
    [self.view addSubview:self.collectionView];
}

- (UICollectionViewFlowLayout *)layout{
    if (_layout == nil) {
        _layout = [[UICollectionViewFlowLayout alloc]init];
        _layout.itemSize = self.collectionView.bounds.size;
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _layout.minimumLineSpacing = 0;
        _layout.minimumInteritemSpacing = 0;
    }
    
    return _layout;
}

- (HJHomeScrollView *)homeScrollView{
    if (_homeScrollView == nil) {
        _homeScrollView = [[HJHomeScrollView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, 37)];
        _homeScrollView.titleModelArray = self.titleModelArray;
        _homeScrollView.Mydelegate = self;
        
    }
    return _homeScrollView;
    
}

- (HJHomeCollectionView *)collectionView{
    
    if (_collectionView == nil) {
        _collectionView = [[HJHomeCollectionView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.homeScrollView.frame), ScreenWidth, Screenheight - CGRectGetMaxY(self.homeScrollView.frame)) collectionViewLayout:self.layout];}
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.pagingEnabled = YES;
    for (int i = 0; i < _titleModelArray.count; i++) {
        [_collectionView registerClass:[HJHomeCollectionViewCell class] forCellWithReuseIdentifier:[NSString stringWithFormat:@"%@%d",contentIdentifier,i]];
    }
    return _collectionView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark - collectionViewDelegate&collectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.titleModelArray.count;
    
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HJHomeCollectionViewCell *cell = [[HJHomeCollectionViewCell alloc]init];
    if (cell == nil) {
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:[NSString stringWithFormat:@"%@%d",contentIdentifier,(int)indexPath.item] forIndexPath:indexPath];
    }
    HJHomdModel *model = self.titleModelArray[indexPath.row];
    cell.urlstring = model.urlstring;
    cell.title = model.title;
    return cell;
}
#pragma mark - HJHomeScrollViewDelegate
- (void)titleScrollView:(HJHomeScrollView *)titleScrollView WithTitleLabel:(UILabel *)label{
    NSInteger i = label.tag;
    UILabel *lastlabel = self.homeScrollView.subviews[self.index];
    lastlabel.textColor = [UIColor redColor];
    lastlabel.textColor = [UIColor orangeColor];
    self.index = i;
    [self.collectionView setContentOffset:CGPointMake(i * ScreenWidth, 0) animated:NO];
}

#pragma mark - 上下联动的实现
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndDecelerating:scrollView];
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
