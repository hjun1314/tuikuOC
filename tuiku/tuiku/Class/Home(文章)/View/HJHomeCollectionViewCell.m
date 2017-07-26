//
//  HJHomeCollectionViewCell.m
//  tuiku
//
//  Created by hjun on 2017/7/24.
//  Copyright © 2017年 hjun. All rights reserved.
//

#import "HJHomeCollectionViewCell.h"
#import "HJContentController.h"
@interface HJHomeCollectionViewCell()

@property (nonatomic,strong)HJContentController *conterVc;


@end
@implementation HJHomeCollectionViewCell

- (void)setUrlstring:(NSString *)urlstring{
    _urlstring = urlstring;
}

- (HJContentController *)conterVc{
    if (_conterVc == nil) {
        _conterVc = [[HJContentController alloc]init];
    }
    return _conterVc;
    
}
- (void)setTitle:(NSString *)title{
    _title = title;
    self.conterVc.titlename = title;
    self.conterVc.urlstring = _urlstring;
    self.conterVc.tableView.frame = self.bounds;
    [self.contentView addSubview:self.conterVc.tableView];
}

@end
