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
#import "HotUser.h"
#import "HotWeibo.h"
#import "HotPagePic.h"
#import "TransBundle.h"
#import "UIStoryboard+Forum.h"
#import "TransBundleUIViewController.h"
#import "AppDelegate.h"
#import "AGPlayerViewController.h"
#import <NYTPhotoViewer/NYTPhoto.h>
#import "TimeLinePics.h"
#import "WeiboView.h"

@interface TimeLineCell()<UITextViewDelegate>{
    HotWeibo *_hotWeibo;

}

@property (weak, nonatomic) IBOutlet WeiboView *viewView;

@end


@implementation TimeLineCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)showStatus:(Weibo *)weibo {

    _timeLineTime.text = weibo.createdAt;
    
    _timeLineContent.attributedText = weibo.text;
    _timeLineContent.delegate = self;
    
    _timeLineName.text = weibo.user.screenName;

    [_timeLineAvatar sd_setImageWithURL:[NSURL URLWithString:weibo.user.profileImageUrl]];

    RetweetedWeibo * retweet = weibo.retweetedWeibo;

    BOOL isRetweet = retweet.text != nil;

    if (isRetweet){
        PageInfo *retweetPageInfo = weibo.retweetedWeibo.pageInfo;
        if (retweetPageInfo.pageUrl == nil){

            _timeLineReTweetContent.attributedText = weibo.retweetedWeibo.text;

        } else {
            _timeLineReTweetContent.attributedText = weibo.retweetedWeibo.text;
            [_pageInfoImage sd_setImageWithURL:[NSURL URLWithString:retweetPageInfo.pagePic]];
            _pageDesc.text = weibo.pageInfo.pageDesc;
        }
    } else {
        PageInfo *pageInfo = weibo.pageInfo;
        if (pageInfo.pageUrl == nil) {

        } else{
            PageInfo *pageInfo = weibo.pageInfo;

            [_pageInfoImage sd_setImageWithURL:[NSURL URLWithString:pageInfo.pagePic]];
            _pageDesc.text = pageInfo.pageDesc;

        }
    }

    [_bottomView showBottomInfo:weibo.source repost:(int) weibo.repostsCount comments:(int) weibo.commentsCount like:(int) weibo.attitudesCount];
}

- (void)showHotWeibo:(HotWeibo *)hotWeibo {
    _hotWeibo = hotWeibo;
    
    HotPageInfo *pageInfo = hotWeibo.pageInfo;
    if (pageInfo.pageUrl == nil) {

        [self.viewView showWeiboContent:_hotWeibo.user.profileImageUrl name:_hotWeibo.user.screenName time:_hotWeibo.createdAt content:hotWeibo.text pics:_hotWeibo.pics];
        
    } else{
        _timeLineTime.text = hotWeibo.createdAt;
        
        _timeLineContent.attributedText = hotWeibo.text;
        _timeLineContent.delegate = self;
        
        _timeLineName.text = hotWeibo.user.screenName;
        
        [_timeLineAvatar sd_setImageWithURL:[NSURL URLWithString:hotWeibo.user.profileImageUrl]];
        [_pageInfoImage sd_setImageWithURL:[NSURL URLWithString:pageInfo.pagePic.url]];
        _pageDesc.text = pageInfo.content1;

    }

    [_bottomView showBottomInfo:hotWeibo.source repost:(int) hotWeibo.repostsCount comments:(int) hotWeibo.commentsCount like:(int) hotWeibo.attitudesCount];
}



- (IBAction)showPageInfo:(id)sender {
    //PageInfo *pageInfo = _hotWeibo.pageInfo.type;
    NSLog(@"showPageInfo: %@", _hotWeibo.pageInfo.type);
    if ([_hotWeibo.pageInfo.type isEqualToString:@"video"]){

        AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;

        UIStoryboard *storyboard = [UIStoryboard mainStoryboard];

        AGPlayerViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"AGPlayerViewController"];

        TransBundle *bundle = [[TransBundle alloc] init];
        [bundle putObjectValue:_hotWeibo.pageInfo forKey:@"hotPageInfo"];
        [controller transBundle:bundle forController:controller];


        [app.window.rootViewController presentViewController:controller animated:YES completion:^{

        }];
    }
}

@end
