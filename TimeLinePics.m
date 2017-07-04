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

    }
    return self;
}

-(void)showWithPicCount:(int)count{
    
    UIView * mainView = self.ninePicMainView;
    
    NSArray * images = mainView.subviews;
    
    for (UIImageView *uiv in images) {
        
        uiv.userInteractionEnabled = YES;
        // 添加手势识别器
        [uiv addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageClick:)]];
    }
    
    CGRect mainFrame = mainView.frame;
    
    CGRect rootFrame = self.frame;
    mainView.frame = CGRectMake(mainFrame.origin.x, mainFrame.origin.y, rootFrame.size.width, rootFrame.size.height);
    [self addSubview:mainView];
}
- (IBAction)imageClick:(UITapGestureRecognizer *)sender {
    NSLog(@"imageClick %d", (int)[self.ninePicMainView.subviews indexOfObject:sender.view]);
}

@end
