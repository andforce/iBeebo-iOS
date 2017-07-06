//
//  WeiboView.m
//  iBeeboPro
//
//  Created by 迪远 王 on 2017/7/6.
//  Copyright © 2017年 andforce. All rights reserved.
//

#import "WeiboView.h"
#import "UIWeiboTextView.h"
#import "TimeLinePics.h"
#import "WeiboUserInfo.h"

#import <UIImageView+WebCache.h>

@interface WeiboView(){
    
    UIView * mainView;
}

@property (weak, nonatomic) IBOutlet WeiboUserInfo *userInfo;
@property (weak, nonatomic) IBOutlet TimeLinePics *weiboPicView;
@property (strong, nonatomic) IBOutlet UIView *weiboMainView;


@property (weak, nonatomic) IBOutlet WeiboUserInfo *repostUserInfo;
@property (weak, nonatomic) IBOutlet UIWeiboTextView *repostWeiboContent2;
@property (weak, nonatomic) IBOutlet TimeLinePics *repostWeiboPicView;

@property (strong, nonatomic) IBOutlet UIView *repostMainView;


@end

@implementation WeiboView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        NSArray * views = [[NSBundle mainBundle] loadNibNamed:@"WeiboView" owner:self options:nil];
        self.weiboMainView = views[0];
        self.repostMainView = views[1];
    }
    return self;
}

-(void)showWeiboContent:(NSString *)avatarUrl name:(NSString *)name time:(NSString *)time content:(NSAttributedString *)content pics:(NSArray *)pics{
    
    mainView = self.weiboMainView;
    
    [self addRealView];
    
    [_userInfo showUserInfo:avatarUrl name:name time:time weiboContent:content];
    
    if (pics != nil && pics.count > 0) {
        [_weiboPicView showPictures:pics];
    } else{
        _weiboPicView.frame = CGRectZero;
    }

    
}

-(void)showRepostWeiboContent:(NSString *)avatarUrl name:(NSString *)name time:(NSString *)time content:(NSAttributedString *)content repostContent:(NSAttributedString *)repostContent pics:(NSArray *)pics{
    mainView = self.repostMainView;
    
    [self addRealView];
    
    [_repostUserInfo showUserInfo:avatarUrl name:name time:time weiboContent:repostContent];
    _repostWeiboContent2.attributedText = repostContent;

    if (pics != nil && pics.count > 0) {
        [_repostWeiboPicView showPictures:pics];
    } else{
        _repostWeiboPicView.frame = CGRectZero;
    }
}

-(void) addRealView{
    CGRect mainFrame = mainView.frame;
    CGRect rootFrame = self.frame;
    mainView.frame = CGRectMake(mainFrame.origin.x, mainFrame.origin.y, rootFrame.size.width, rootFrame.size.height);
    [self addSubview:mainView];
}

@end
