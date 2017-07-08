//
//  UIWeiboTableViewCell.m
//  iBeeboPro
//
//  Created by 迪远 王 on 2017/7/8.
//  Copyright © 2017年 andforce. All rights reserved.
//

#import "UIWeiboTableViewCell.h"

@implementation UIWeiboTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        //NSArray * views = [[NSBundle mainBundle] loadNibNamed:@"UIWeiboTableViewCell" owner:nil options:nil];

        int count = self.subviews.count;
        
        NSString * idf = self.reuseIdentifier;

        NSString * idftmp = idf;
//        self.mainView = [views firstObject];
//
//        CGRect mainFrame = self.mainView.frame;
//        CGRect rootFrame = self.frame;
//        self.mainView.frame = CGRectMake(mainFrame.origin.x, mainFrame.origin.y, rootFrame.size.width, rootFrame.size.height);
//        [self addSubview:self.mainView];

    }
    return self;
}

@end
