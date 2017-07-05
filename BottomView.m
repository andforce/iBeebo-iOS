//
//  BottomView.m
//  iBeeboPro
//
//  Created by 迪远 王 on 2017/7/5.
//  Copyright © 2017年 andforce. All rights reserved.
//

#import "BottomView.h"

@interface BottomView(){

    
}
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (weak, nonatomic) IBOutlet UILabel *source;
@property (weak, nonatomic) IBOutlet UILabel *repost;
@property (weak, nonatomic) IBOutlet UILabel *comments;
@property (weak, nonatomic) IBOutlet UILabel *like;

@end

@implementation BottomView

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
        NSArray * views = [[NSBundle mainBundle] loadNibNamed:@"BottomView" owner:self options:nil];
        self.mainView = [views firstObject];
        
        CGRect mainFrame = self.mainView.frame;
        CGRect rootFrame = self.frame;
        self.mainView.frame = CGRectMake(mainFrame.origin.x, mainFrame.origin.y, rootFrame.size.width, rootFrame.size.height);
        [self addSubview:self.mainView];
        
    }
    return self;
}

-(void)showBottomInfo:(NSString *)source repost:(int)repost comments:(int)comments like:(int)like{
    _source.text = source;
    _repost.text = [@(repost) stringValue];
    _comments.text = [@(comments) stringValue];
    _like.text = [@(like) stringValue];
    
}

@end
