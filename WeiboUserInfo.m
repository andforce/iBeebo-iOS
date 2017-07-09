//
//  WeiboUserInfo.m
//  iBeeboPro
//
//  Created by 迪远 王 on 2017/7/7.
//  Copyright © 2017年 andforce. All rights reserved.
//

#import "WeiboUserInfo.h"
#import "UIWeiboTextView.h"
#import <UIImageView+WebCache.h>

@interface WeiboUserInfo(){
    
    
}
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (strong, nonatomic) IBOutlet UIView *mainView;
@end

@implementation WeiboUserInfo

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
        NSArray * views = [[NSBundle mainBundle] loadNibNamed:@"WeiboUserInfo" owner:self options:nil];
        self.mainView = [views firstObject];
        
        CGRect mainFrame = self.mainView.frame;
        CGRect rootFrame = self.frame;
        self.mainView.frame = CGRectMake(mainFrame.origin.x, mainFrame.origin.y, rootFrame.size.width, rootFrame.size.height);
        [self addSubview:self.mainView];
        
    }
    return self;
}

-(void)showUserInfo:(NSString *)avatarUrl name:(NSString *)name time:(NSString *)time{
    [_avatarImageView sd_setImageWithURL:[NSURL URLWithString:avatarUrl]];
    _name.text = name;
    _time.text = time;
}

@end
