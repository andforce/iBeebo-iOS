//
//  TimeLineCell.m
//  iBeeboPro
//
//  Created by 迪远 王 on 16/7/26.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import "TimeLineCell.h"
#import <UIImageView+WebCache.h>

@implementation TimeLineCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)showImages:(NSArray<Pics *> *)pics{
    if (_timeLineImage0 != nil) {
        [_timeLineImage0 sd_setImageWithURL:[NSURL URLWithString:pics[0].url]];
    }
    if (_timeLineImage1 != nil) {
        [_timeLineImage1 sd_setImageWithURL:[NSURL URLWithString:pics[1].url]];
    }
    if (_timeLineImage2 != nil) {
        [_timeLineImage2 sd_setImageWithURL:[NSURL URLWithString:pics[2].url]];
    }
    if (_timeLineImage3 != nil) {
        [_timeLineImage3 sd_setImageWithURL:[NSURL URLWithString:pics[3].url]];
    }
    if (_timeLineImage4 != nil) {
        [_timeLineImage4 sd_setImageWithURL:[NSURL URLWithString:pics[4].url]];
    }
    if (_timeLineImage5 != nil) {
        [_timeLineImage5 sd_setImageWithURL:[NSURL URLWithString:pics[5].url]];
    }
    if (_timeLineImage6 != nil) {
        [_timeLineImage6 sd_setImageWithURL:[NSURL URLWithString:pics[6].url]];
    }
    if (_timeLineImage7 != nil) {
        [_timeLineImage7 sd_setImageWithURL:[NSURL URLWithString:pics[7].url]];
    }
    if (_timeLineImage8 != nil) {
        [_timeLineImage8 sd_setImageWithURL:[NSURL URLWithString:pics[8].url]];
    }
}
@end
