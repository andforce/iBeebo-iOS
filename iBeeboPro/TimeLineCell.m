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
#import "TimeLinePics.h"

@interface TimeLineCell()<UITextViewDelegate>{
    HotWeibo *_hotWeibo;

    Weibo * _weibo;

    NSMutableArray *_array;
}
@property (weak, nonatomic) IBOutlet TimeLinePics *timeLinePicView;

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
            if (weibo.picIds.count != 9){
                [self showImages:weibo.pics];
            } else{
                [self.timeLinePicView showWithPicCount:9];
            }
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
        
        
        if (hotWeibo.pics.count != 9){
            [self showImages:hotWeibo.pics];
        } else{
            [self.timeLinePicView showWithPicCount:8];
        }
        
    } else{
        [_pageInfoImage sd_setImageWithURL:[NSURL URLWithString:pageInfo.pagePic.url]];
        _pageDesc.text = pageInfo.content1;

    }
}

- (void) loadImage:(NSArray<Pics *> *)pics into:(UIImageView *) imageView withIndex:(int) index{
    [imageView sd_setImageWithURL:[NSURL URLWithString:pics[(NSUInteger) index].url] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {

        NYTExamplePhoto *photo1 = [[NYTExamplePhoto alloc] init];

        photo1.attributedCaptionTitle = [[NSAttributedString alloc] initWithString:@"1" attributes:nil];
        photo1.image = image;
        _array[(NSUInteger) index] = photo1;
    }];
}

-(void)showImages:(NSArray<Pics *> *)pics{
    if (_timeLineImage0 != nil) {
        [self loadImage:pics into:_timeLineImage0 withIndex:0];
    }
    if (_timeLineImage1 != nil) {
        [self loadImage:pics into:_timeLineImage1 withIndex:1];
    }
    if (_timeLineImage2 != nil) {
        [self loadImage:pics into:_timeLineImage2 withIndex:2];
    }
    if (_timeLineImage3 != nil) {
        [self loadImage:pics into:_timeLineImage3 withIndex:3];
    }
    if (_timeLineImage4 != nil) {
        [self loadImage:pics into:_timeLineImage4 withIndex:4];
    }
    if (_timeLineImage5 != nil) {
        [self loadImage:pics into:_timeLineImage5 withIndex:5];
    }
    if (_timeLineImage6 != nil) {
        [self loadImage:pics into:_timeLineImage6 withIndex:6];
    }
    if (_timeLineImage7 != nil) {
        [self loadImage:pics into:_timeLineImage7 withIndex:7];
    }
    if (_timeLineImage8 != nil) {
        [self loadImage:pics into:_timeLineImage8 withIndex:8];
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
