//
//  HJContentCell.m
//  tuiku
//
//  Created by hjun on 2017/7/25.
//  Copyright © 2017年 hjun. All rights reserved.
//

#import "HJContentCell.h"
#import "HJContentModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
@interface HJContentCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *feedLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;


@end
@implementation HJContentCell

- (void)setContent:(HJContentModel *)content{
    _content = content;
    self.titleLabel.text = content.title;
    self.feedLabel.text = content.feed_title;
    self.timeLabel.text = content.time;
    if (content.img) {
        [self.iconImage sd_setImageWithURL:[NSURL URLWithString:content.img] placeholderImage:[UIImage imageNamed:@"abs_pic"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if (error) {
                self.iconImage.image = [UIImage imageNamed:@"abs_pic_broken"];
            }

        }];
        
    }
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
