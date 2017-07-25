//
//  HJHomeScrollView.m
//  tuiku
//
//  Created by hjun on 2017/7/21.
//  Copyright © 2017年 hjun. All rights reserved.
//

#import "HJHomeScrollView.h"
#import "HJHomdModel.h"
@implementation HJHomeScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.showsHorizontalScrollIndicator = NO;

    }
    return self;
}

- (void)setTitleModelArray:(NSArray *)titleModelArray{
    _titleModelArray = titleModelArray;
    CGFloat titleLabelWidth = 0;
    if (titleModelArray.count == 3) {
        titleLabelWidth = [UIScreen mainScreen].bounds.size.width * 1.0 / 3;
    }else{
         titleLabelWidth = [UIScreen mainScreen].bounds.size.width * 1.0 / 7;
    }
    for (int i = 0; i<titleModelArray.count; i++) {
        HJHomdModel *model = titleModelArray[i];
        CGFloat titleLabelX = i * titleLabelWidth;
        CGFloat titleLabelY = 0;
        CGFloat titleLabelHight = self.frame.size.height;
        
        
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.tag = i;
        titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelWidth, titleLabelHight);
        titleLabel.text = model.title;
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.userInteractionEnabled = YES;
        [titleLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleLabelClick:)]];
        
        [self addSubview:titleLabel];

    }
    self.contentSize = CGSizeMake(titleModelArray.count * titleLabelWidth, self.frame.size.height);
}

-(void)titleLabelClick:(UITapGestureRecognizer *)recognizer{
    
    UILabel *label = (UILabel *)recognizer.view;
    
    if ([self.Mydelegate respondsToSelector:@selector(titleScrollView:WithTitleLabel:)]) {
        [self.Mydelegate titleScrollView:self WithTitleLabel:label];
    }
    
}
@end
