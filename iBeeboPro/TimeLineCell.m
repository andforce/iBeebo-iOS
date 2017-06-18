//
//  TimeLineCell.m
//  iBeeboPro
//
//  Created by 迪远 王 on 16/7/26.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import "TimeLineCell.h"
#import <UIImageView+WebCache.h>

#import "User.h"
#import "RetweetedWeibo.h"
#import "PageInfo.h"

@interface TimeLineCell()<UITextViewDelegate>{

}

@end


@implementation TimeLineCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)showStatus:(Weibo *)status{
    _timeLineTime.text = status.createdAt;
    
    _timeLineContent.attributedText = status.text;
    _timeLineContent.delegate = self;
    
    _timeLineName.text = status.user.screenName;
    _timeLineSource.text = status.source;
    [_timeLineAvatar sd_setImageWithURL:[NSURL URLWithString:status.user.profileImageUrl]];



    RetweetedWeibo * retweet = status.retweetedWeibo;

    BOOL isRetweet = retweet.text != nil;

    if (isRetweet){
        PageInfo *retweetPageInfo = status.retweetedWeibo.pageInfo;
        if (retweetPageInfo.pageUrl == nil){

            [self showImages:status.retweetedWeibo.pics];
            _timeLineReTweetContent.attributedText = status.retweetedWeibo.text;

        } else {
            _timeLineReTweetContent.attributedText = status.retweetedWeibo.text;
            [_pageInfoImage sd_setImageWithURL:[NSURL URLWithString:retweetPageInfo.pagePic]];
            _pageInfoContent.text = status.pageInfo.pageTitle;
            _pageDesc.text = status.pageInfo.pageDesc;
        }
    } else {
        PageInfo *pageInfo = status.pageInfo;
        if (pageInfo.pageUrl == nil) {
            [self showImages:status.pics];
        } else{
            PageInfo *pageInfo = status.pageInfo;

            [_pageInfoImage sd_setImageWithURL:[NSURL URLWithString:pageInfo.pagePic]];
            _pageInfoContent.text = pageInfo.pageTitle;
            _pageDesc.text = pageInfo.pageDesc;

        }
    }


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
