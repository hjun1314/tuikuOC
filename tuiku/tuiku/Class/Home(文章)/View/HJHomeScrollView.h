//
//  HJHomeScrollView.h
//  tuiku
//
//  Created by hjun on 2017/7/21.
//  Copyright © 2017年 hjun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HJHomeScrollView;
@protocol  HJHomeScrollViewDelegate <NSObject>

- (void)titleScrollView:(HJHomeScrollView *)titleScrollView WithTitleLabel:(UILabel *)label;

@end
@interface HJHomeScrollView : UIScrollView

@property (nonatomic,strong)NSArray *titleModelArray;

@property (nonatomic,weak)id <HJHomeScrollViewDelegate>Mydelegate;


@end
