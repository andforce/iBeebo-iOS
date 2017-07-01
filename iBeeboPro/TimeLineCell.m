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
#import <NYTPhotosViewController.h>
#import <NYTPhotoViewer/NYTPhoto.h>
#import "NYTExamplePhoto.h"

@interface TimeLineCell()<UITextViewDelegate>{
    HotWeibo *_hotWeibo;

    Weibo * _weibo;

    NSMutableArray *_array;
}

@end


@implementation TimeLineCell

- (void)awakeFromNib {
    [super awakeFromNib];

    _array = [NSMutableArray arrayWithCapacity:9];

    for (int i = 0; i < 9; i++){
        [_array addObject:@(i)];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)showStatus:(Weibo *)weibo {

    _weibo = weibo;

    _timeLineTime.text = weibo.createdAt;
    
    _timeLineContent.attributedText = weibo.text;
    _timeLineContent.delegate = self;
    
    _timeLineName.text = weibo.user.screenName;
    _timeLineSource.text = weibo.source;
    [_timeLineAvatar sd_setImageWithURL:[NSURL URLWithString:weibo.user.profileImageUrl]];



    RetweetedWeibo * retweet = weibo.retweetedWeibo;

    BOOL isRetweet = retweet.text != nil;

    if (isRetweet){
        PageInfo *retweetPageInfo = weibo.retweetedWeibo.pageInfo;
        if (retweetPageInfo.pageUrl == nil){

            [self showImages:weibo.retweetedWeibo.pics];
            _timeLineReTweetContent.attributedText = weibo.retweetedWeibo.text;

        } else {
            _timeLineReTweetContent.attributedText = weibo.retweetedWeibo.text;
            [_pageInfoImage sd_setImageWithURL:[NSURL URLWithString:retweetPageInfo.pagePic]];
            _pageDesc.text = weibo.pageInfo.pageDesc;
        }
    } else {
        PageInfo *pageInfo = weibo.pageInfo;
        if (pageInfo.pageUrl == nil) {
            [self showImages:weibo.pics];
        } else{
            PageInfo *pageInfo = weibo.pageInfo;

            [_pageInfoImage sd_setImageWithURL:[NSURL URLWithString:pageInfo.pagePic]];
            _pageDesc.text = pageInfo.pageDesc;

        }
    }
}


- (void)showHotWeibo:(HotWeibo *)hotWeibo {
    _hotWeibo = hotWeibo;

    _timeLineTime.text = hotWeibo.createdAt;

    _timeLineContent.attributedText = hotWeibo.text;
    _timeLineContent.delegate = self;

    _timeLineName.text = hotWeibo.user.screenName;
    _timeLineSource.text = hotWeibo.source;
    [_timeLineAvatar sd_setImageWithURL:[NSURL URLWithString:hotWeibo.user.profileImageUrl]];



    HotPageInfo *pageInfo = hotWeibo.pageInfo;
    if (pageInfo.pageUrl == nil) {
        [self showImages:hotWeibo.pics];
    } else{
        [_pageInfoImage sd_setImageWithURL:[NSURL URLWithString:pageInfo.pagePic.url]];
        _pageDesc.text = pageInfo.content1;

    }
}

-(void)showImages:(NSArray<Pics *> *)pics{
    if (_timeLineImage0 != nil) {
        [_timeLineImage0 sd_setImageWithURL:[NSURL URLWithString:pics[0].url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {

            NYTExamplePhoto *photo1 = [[NYTExamplePhoto alloc] init];

            photo1.attributedCaptionTitle = [[NSAttributedString alloc] initWithString:@"1" attributes:nil];
            photo1.image = image;
            _array[0] = photo1;
        }];
    }
    if (_timeLineImage1 != nil) {
        [_timeLineImage1 sd_setImageWithURL:[NSURL URLWithString:pics[1].url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            NYTExamplePhoto *photo1 = [[NYTExamplePhoto alloc] init];

            photo1.attributedCaptionTitle = [[NSAttributedString alloc] initWithString:@"2" attributes:nil];
            photo1.image = image;
            _array[1] = photo1;
        }];
    }
    if (_timeLineImage2 != nil) {
        [_timeLineImage2 sd_setImageWithURL:[NSURL URLWithString:pics[2].url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            NYTExamplePhoto *photo1 = [[NYTExamplePhoto alloc] init];

            photo1.attributedCaptionTitle = [[NSAttributedString alloc] initWithString:@"3" attributes:nil];
            photo1.image = image;
            _array[2] = photo1;
        }];
    }
    if (_timeLineImage3 != nil) {
        [_timeLineImage3 sd_setImageWithURL:[NSURL URLWithString:pics[3].url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            NYTExamplePhoto *photo1 = [[NYTExamplePhoto alloc] init];

            photo1.attributedCaptionTitle = [[NSAttributedString alloc] initWithString:@"4" attributes:nil];
            photo1.image = image;
            _array[3] = photo1;
        }];
    }
    if (_timeLineImage4 != nil) {
        [_timeLineImage4 sd_setImageWithURL:[NSURL URLWithString:pics[4].url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            NYTExamplePhoto *photo1 = [[NYTExamplePhoto alloc] init];

            photo1.attributedCaptionTitle = [[NSAttributedString alloc] initWithString:@"5" attributes:nil];
            photo1.image = image;
            _array[4] = photo1;
        }];
    }
    if (_timeLineImage5 != nil) {
        [_timeLineImage5 sd_setImageWithURL:[NSURL URLWithString:pics[5].url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            NYTExamplePhoto *photo1 = [[NYTExamplePhoto alloc] init];

            photo1.attributedCaptionTitle = [[NSAttributedString alloc] initWithString:@"6" attributes:nil];
            photo1.image = image;
            _array[5] = photo1;
        }];
    }
    if (_timeLineImage6 != nil) {
        [_timeLineImage6 sd_setImageWithURL:[NSURL URLWithString:pics[6].url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            NYTExamplePhoto *photo1 = [[NYTExamplePhoto alloc] init];

            photo1.attributedCaptionTitle = [[NSAttributedString alloc] initWithString:@"7" attributes:nil];
            photo1.image = image;
            _array[6] = photo1;
        }];
    }
    if (_timeLineImage7 != nil) {
        [_timeLineImage7 sd_setImageWithURL:[NSURL URLWithString:pics[7].url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            NYTExamplePhoto *photo1 = [[NYTExamplePhoto alloc] init];

            photo1.attributedCaptionTitle = [[NSAttributedString alloc] initWithString:@"8" attributes:nil];
            photo1.image = image;
            _array[7] = photo1;
        }];
    }
    if (_timeLineImage8 != nil) {
        [_timeLineImage8 sd_setImageWithURL:[NSURL URLWithString:pics[8].url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            NYTExamplePhoto *photo1 = [[NYTExamplePhoto alloc] init];

            photo1.attributedCaptionTitle = [[NSAttributedString alloc] initWithString:@"9" attributes:nil];
            photo1.image = image;
            _array[8] = photo1;
        }];
    }
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

- (void) showImageWithIndex:(int) index{
    NSMutableArray *filterArray = [NSMutableArray array];
    for (NYTExamplePhoto * image in _array){
        if ([image isKindOfClass:[NYTExamplePhoto class]]){
            [filterArray addObject:image];
        }
    }
    NYTExamplePhoto *selectImage = filterArray[(NSUInteger) index];

    NYTPhotosViewController *photosViewController = [[NYTPhotosViewController alloc] initWithPhotos:filterArray initialPhoto:selectImage];

    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [app.window.rootViewController presentViewController:photosViewController animated:YES completion:nil];
}

- (IBAction)show0Image:(id)sender {
    [self showImageWithIndex:0];
}

- (IBAction)show1Image:(id)sender {
    [self showImageWithIndex:1];
}

- (IBAction)show2Image:(id)sender {
    [self showImageWithIndex:2];
}

- (IBAction)show3Image:(id)sender {
    [self showImageWithIndex:3];
}

- (IBAction)show4Image:(id)sender {
    [self showImageWithIndex:4];
}

- (IBAction)show5Image:(id)sender {
    [self showImageWithIndex:5];
}

- (IBAction)show6Image:(id)sender {
    [self showImageWithIndex:6];
}

- (IBAction)show7Image:(id)sender {
    [self showImageWithIndex:7];
}

- (IBAction)show8Image:(id)sender {
    [self showImageWithIndex:8];
}

@end
