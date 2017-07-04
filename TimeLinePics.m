//
//  TimeLinePics.m
//  iBeeboPro
//
//  Created by 迪远 王 on 2017/7/4.
//  Copyright © 2017年 andforce. All rights reserved.
//

#import "TimeLinePics.h"
#import "Pics.h"

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

@interface TimeLinePics () {
    
    UIView * mainView;
    
    NSArray * mainViewSubViews;
    
    NSMutableArray *_array;

}
@property (strong, nonatomic) IBOutlet UIView *onePicMainView;
@property (strong, nonatomic) IBOutlet UIView *twoPicMainView;
@property (strong, nonatomic) IBOutlet UIView *threePicMainView;
@property (strong, nonatomic) IBOutlet UIView *fourPicMainView;
@property (strong, nonatomic) IBOutlet UIView *fivePicMainView;
@property (strong, nonatomic) IBOutlet UIView *sixPicMainView;
@property (strong, nonatomic) IBOutlet UIView *sevenPicMainView;

@property (weak, nonatomic) IBOutlet UIImageView *eightPicMainView0;
@property (weak, nonatomic) IBOutlet UIImageView *eightPicMainView1;
@property (weak, nonatomic) IBOutlet UIImageView *eightPicMainView2;
@property (weak, nonatomic) IBOutlet UIImageView *eightPicMainView3;
@property (weak, nonatomic) IBOutlet UIImageView *eightPicMainView4;
@property (weak, nonatomic) IBOutlet UIImageView *eightPicMainView5;
@property (weak, nonatomic) IBOutlet UIImageView *eightPicMainView6;
@property (weak, nonatomic) IBOutlet UIImageView *eightPicMainView7;
@property (strong, nonatomic) IBOutlet UIView *eightPicMainView;


@property (weak, nonatomic) IBOutlet UIImageView *ninePicMainView0;
@property (weak, nonatomic) IBOutlet UIImageView *ninePicMainView1;
@property (weak, nonatomic) IBOutlet UIImageView *ninePicMainView2;
@property (weak, nonatomic) IBOutlet UIImageView *ninePicMainView3;
@property (weak, nonatomic) IBOutlet UIImageView *ninePicMainView4;
@property (weak, nonatomic) IBOutlet UIImageView *ninePicMainView5;
@property (weak, nonatomic) IBOutlet UIImageView *ninePicMainView6;
@property (weak, nonatomic) IBOutlet UIImageView *ninePicMainView7;
@property (weak, nonatomic) IBOutlet UIImageView *ninePicMainView8;
@property (strong, nonatomic) IBOutlet UIView *ninePicMainView;

@end

@implementation TimeLinePics

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

// xib 加载时调用
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSArray * views = [[NSBundle mainBundle] loadNibNamed:@"TimeLinePics" owner:self options:nil];
        self.twoPicMainView = views[1];
        
        self.onePicMainView = views[0];
        
        
        _array = [NSMutableArray arrayWithCapacity:9];
        
        for (int i = 0; i < 9; i++){
            [_array addObject:@(i)];
        }

    }
    return self;
}

-(void)showPictures:(NSArray<Pics *> *)pics{
    switch (pics.count) {
        case 1:
            mainView = _onePicMainView;
            break;
        case 2:
            mainView = _twoPicMainView;
            break;
        case 3:
            mainView = _threePicMainView;
            break;
        case 4:
            mainView = _fourPicMainView;
            break;
        case 5:
            mainView = _fivePicMainView;
            break;
        case 6:
            mainView = _sixPicMainView;
            break;
        case 7:
            mainView = _sevenPicMainView;
            break;
        case 8:
            mainView = _eightPicMainView;
            break;
        case 9:
            mainView = _ninePicMainView;
            break;
        default:
            mainView = nil;
            break;
    }
    
    if (mainView) {
        mainViewSubViews = mainView.subviews;
        
        for (UIImageView *uiv in mainViewSubViews) {
            
            uiv.userInteractionEnabled = YES;
            // 添加手势识别器
            [uiv addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick:)]];
        }
        
        CGRect mainFrame = mainView.frame;
        
        CGRect rootFrame = self.frame;
        mainView.frame = CGRectMake(mainFrame.origin.x, mainFrame.origin.y, rootFrame.size.width, rootFrame.size.height);
        [self addSubview:mainView];
        
        
        for (int i = 0; i < mainViewSubViews.count; i ++) {
            [self loadImage:pics into:mainViewSubViews[i] withIndex:i];
        }
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

- (IBAction)imageClick:(UITapGestureRecognizer *)sender {
    int index = (int)[self.ninePicMainView.subviews indexOfObject:sender.view];
    NSLog(@"imageClick %d", index);
    
    [self showImageWithIndex:index];
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

@end
