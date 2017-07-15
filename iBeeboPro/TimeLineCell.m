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
#import <AFNetworking/AFNetworkReachabilityManager.h>
#import <NYTPhotoViewer/NYTPhotosViewController.h>
#import "PicLargeMiddleSmall.h"

#import "WeiboUserInfo.h"
#import "NYTExamplePhoto.h"

@interface TimeLineCell()<UITextViewDelegate>{
    HotWeibo *_hotWeibo;
}


@property (weak, nonatomic) IBOutlet WeiboUserInfo *userInfo;
@property (weak, nonatomic) IBOutlet UITextView *weiboContent;
@property (weak, nonatomic) IBOutlet BottomView *bottomAction;
@property (weak, nonatomic) IBOutlet UITextView *orgContent;

@property (weak, nonatomic) IBOutlet UIImageView *image0;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UIImageView *image4;
@property (weak, nonatomic) IBOutlet UIImageView *image5;
@property (weak, nonatomic) IBOutlet UIImageView *image6;
@property (weak, nonatomic) IBOutlet UIImageView *image7;
@property (weak, nonatomic) IBOutlet UIImageView *image8;



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

    // PageInfo
    if ((weibo.pageInfo != nil && [weibo.pageInfo.objectType isEqualToString:@"video"])
        || (weibo.retweetedWeibo.pageInfo != nil && [weibo.retweetedWeibo.pageInfo.objectType isEqualToString:@"video"])) {

        RetweetedWeibo * retweet = weibo.retweetedWeibo;
        
        BOOL isRetweet = retweet.text != nil;

        if (isRetweet){

            self.weiboContent.attributedText = weibo.text;
            self.orgContent.attributedText = weibo.retweetedWeibo.text;
            
            PicLargeMiddleSmall * picLargeMiddleSmall = [[PicLargeMiddleSmall alloc] initWithUrl:weibo.retweetedWeibo.pageInfo.pagePic];
            [self showImage:picLargeMiddleSmall.small small:picLargeMiddleSmall.small toImage:self.image0];
        } else {
            self.weiboContent.attributedText = weibo.text;
            PicLargeMiddleSmall * picLargeMiddleSmall = [[PicLargeMiddleSmall alloc] initWithUrl:weibo.pageInfo.pagePic];
            [self showImage:picLargeMiddleSmall.small small:picLargeMiddleSmall.small toImage:self.image0];
        }

        
    }
    // Weibo
    else {
        RetweetedWeibo * retweet = weibo.retweetedWeibo;
        
        BOOL isRetweet = retweet.text != nil;
        
        NSArray<Pics*> * pics = weibo.pics;
        
        if (isRetweet){
            pics = weibo.retweetedWeibo.pics;
            self.weiboContent.attributedText = weibo.text;
            self.orgContent.attributedText = weibo.retweetedWeibo.text;
        } else {
            self.weiboContent.attributedText = weibo.text;
        }

        for (int i = 0; i < pics.count; i++){
            NSString * imgUrl = pics[(NSUInteger) i].url;
            PicLargeMiddleSmall * picLargeMiddleSmall = [[PicLargeMiddleSmall alloc] initWithUrl:imgUrl];

            UIImageView *uiImageView = [self viewWithTag:i + 100];
            [self showImage:picLargeMiddleSmall.small small:picLargeMiddleSmall.small toImage:uiImageView];

            uiImageView.userInteractionEnabled = YES;
            // 添加手势识别器
            [uiImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick:)]];
        }
    }


    [self.userInfo showUserInfo:weibo.user.profileImageUrl name:weibo.user.screenName time:weibo.createdAt];
    [self.bottomAction showBottomInfo:weibo.source repost:(int) weibo.repostsCount comments:(int) weibo.commentsCount like:(int) weibo.attitudesCount];
}

- (void)showHotWeibo:(HotWeibo *)weibo {
    _hotWeibo = weibo;

    HotPageInfo *pageInfo = weibo.pageInfo;

    if (pageInfo != nil && [pageInfo.type isEqualToString:@"video"]){

        NSURL * url = [NSURL URLWithString:pageInfo.pagePic.url];

        PicLargeMiddleSmall * picLargeMiddleSmall = [[PicLargeMiddleSmall alloc] initWithUrl:pageInfo.pagePic.url];
        [self showImage:picLargeMiddleSmall.large small:picLargeMiddleSmall.small toImage:self.image0];
    } else {

        NSArray<Pics*> * pics = weibo.pics;

        for (int i = 0; i < pics.count; i++){
            NSString * imgUrl = pics[(NSUInteger) i].url;
            PicLargeMiddleSmall * picLargeMiddleSmall = [[PicLargeMiddleSmall alloc] initWithUrl:imgUrl];
            UIImageView *uiImageView = [self viewWithTag:i + 100];
            [self showImage:picLargeMiddleSmall.large small:picLargeMiddleSmall.small toImage:uiImageView];

            uiImageView.userInteractionEnabled = YES;

            // 添加手势识别器
            [uiImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick:)]];
        }
    }

    self.weiboContent.attributedText = weibo.text;
    [self.userInfo showUserInfo:weibo.user.profileImageUrl name:weibo.user.screenName time:weibo.createdAt];
    [self.bottomAction showBottomInfo:weibo.source repost:(int) weibo.repostsCount comments:(int) weibo.commentsCount like:(int) weibo.attitudesCount];
}

- (IBAction)imageClick:(UITapGestureRecognizer *)sender {
    int index = sender.view.tag;
    NSLog(@"imageClick %d", index);

    //[self showImageWithIndex:index];
}

//- (void) showImageWithIndex:(int) index{
//    NSMutableArray *filterArray = [NSMutableArray array];
//    for (NYTExamplePhoto * image in _array){
//        if ([image isKindOfClass:[NYTExamplePhoto class]]){
//            [filterArray addObject:image];
//        }
//    }
//    NYTExamplePhoto *selectImage = filterArray[(NSUInteger) index];
//
//    NYTPhotosViewController *photosViewController = [[NYTPhotosViewController alloc] initWithPhotos:filterArray initialPhoto:selectImage];
//
//    AppDelegate *app = (AppDelegate *)[UIApplication sharedApplication].delegate;
//    [app.window.rootViewController presentViewController:photosViewController animated:YES completion:nil];
//}

- (void)showImage:(NSString *)org small:(NSString *)small toImage:(UIImageView *) img{
    // 占位图片
    //UIImage *placeholder = [UIImage imageNamed:@"placeholderImage"];
    // 从内存\沙盒缓存中获得原图
    UIImage *originalImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:org];
    if (originalImage) { // 如果内存\沙盒缓存有原图，那么就直接显示原图（不管现在是什么网络状态）
        [img sd_setImageWithURL:[NSURL URLWithString:org]];
    } else { // 内存\沙盒缓存没有原图

        int status = [[[NSUserDefaults standardUserDefaults] valueForKey:@"net_work_status"] intValue];

        if (status == AFNetworkReachabilityStatusReachableViaWiFi) { // 在使用Wifi, 下载原图
            [img sd_setImageWithURL:[NSURL URLWithString:org]];
        } else if (status == AFNetworkReachabilityStatusReachableViaWWAN) { // 在使用手机自带网络
            //     用户的配置项假设利用NSUserDefaults存储到了沙盒中
            //    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"alwaysDownloadOriginalImage"];
            //    [[NSUserDefaults standardUserDefaults] synchronize];
            //      #warning 从沙盒中读取用户的配置项：在3G\4G环境是否仍然下载原图
            BOOL alwaysDownloadOriginalImage = [[NSUserDefaults standardUserDefaults] boolForKey:@"alwaysDownloadOriginalImage"];
            if (alwaysDownloadOriginalImage) { // 下载原图
                [img sd_setImageWithURL:[NSURL URLWithString:org] ];
            } else { // 下载小图
                [img sd_setImageWithURL:[NSURL URLWithString:small] ];
            }
        } else { // 没有网络
            UIImage *thumbnailImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:small];
            if (thumbnailImage) { // 内存\沙盒缓存中有小图
                [img sd_setImageWithURL:[NSURL URLWithString:small] ];
            } else {
                [img sd_setImageWithURL:nil ];
            }
        }
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

@end
