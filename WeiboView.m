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

#import <UIImageView+WebCache.h>

@interface WeiboView(){
    
    UIView * mainView;
}
@property (weak, nonatomic) IBOutlet UIImageView *weiboAvatar;
@property (weak, nonatomic) IBOutlet UILabel *weiboName;
@property (weak, nonatomic) IBOutlet UILabel *weiboTime;
@property (weak, nonatomic) IBOutlet UIWeiboTextView *weiboContent;
@property (weak, nonatomic) IBOutlet TimeLinePics *weiboPicView;
@property (strong, nonatomic) IBOutlet UIView *weiboMainView;


@property (weak, nonatomic) IBOutlet UIImageView *repostWeiboAvatar;
@property (weak, nonatomic) IBOutlet UILabel *repostWeiboName;
@property (weak, nonatomic) IBOutlet UILabel *repostWeiboTime;
@property (weak, nonatomic) IBOutlet UIWeiboTextView *repostWeiboContent;
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
    
    [_weiboAvatar sd_setImageWithURL:[NSURL URLWithString:avatarUrl]];
    _weiboName.text = name;
    _weiboTime.text = time;
    _weiboContent.attributedText = content;
    if (pics != nil && pics.count > 0) {
        [_weiboPicView showPictures:pics];
    } else{
        _weiboPicView.frame = CGRectZero;
    }

    
}

-(void)showRepostWeiboContent:(NSString *)avatarUrl name:(NSString *)name time:(NSString *)time content:(NSAttributedString *)content repostContent:(NSAttributedString *)repostContent pics:(NSArray *)pics{
    mainView = self.repostMainView;
    
    [self addRealView];
    
    [_repostWeiboAvatar sd_setImageWithURL:[NSURL URLWithString:avatarUrl]];
    _repostWeiboName.text = name;
    _repostWeiboTime.text = time;
    _repostWeiboContent.attributedText = content;
    _repostWeiboContent2.attributedText = repostContent;

    if (pics != nil && pics.count > 0) {
        [_repostWeiboPicView showPictures:pics];
    } else{
        _weiboPicView.frame = CGRectZero;
    }
}

-(void) addRealView{
    CGRect mainFrame = mainView.frame;
    CGRect rootFrame = self.frame;
    mainView.frame = CGRectMake(mainFrame.origin.x, mainFrame.origin.y, rootFrame.size.width, rootFrame.size.height);
    [self addSubview:mainView];
}

@end
