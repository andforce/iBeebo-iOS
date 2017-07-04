//
//  TimeLinePics.m
//  iBeeboPro
//
//  Created by 迪远 王 on 2017/7/4.
//  Copyright © 2017年 andforce. All rights reserved.
//

#import "TimeLinePics.h"

@interface TimeLinePics () {

}
@property (strong, nonatomic) IBOutlet UIView *onePicMainView;
@property (strong, nonatomic) IBOutlet UIView *twoPicMainView;
@property (strong, nonatomic) IBOutlet UIView *threePicMainView;
@property (strong, nonatomic) IBOutlet UIView *fourPicMainView;
@property (strong, nonatomic) IBOutlet UIView *fivePicMainView;

@property (strong, nonatomic) IBOutlet UIView *sixPicMainView;
@property (strong, nonatomic) IBOutlet UIView *sevenPicMainView;
@property (strong, nonatomic) IBOutlet UIView *eightPicMainView;
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

    }
    return self;
}

-(void)showWithPicCount:(int)count{
    
    UIView * mainView = self.ninePicMainView;
    
    CGRect mainFrame = mainView.frame;
    
    CGRect rootFrame = self.frame;
    mainView.frame = CGRectMake(mainFrame.origin.x, mainFrame.origin.y, rootFrame.size.width, rootFrame.size.height);
    [self addSubview:mainView];
}

@end
