//
//  TimeLineCell.h
//  iBeeboPro
//
//  Created by 迪远 王 on 16/7/26.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIWeiboTextView.h"
#import "Pics.h"
#import "Mblog.h"

@interface TimeLineCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *timeLineAvatar;
@property (weak, nonatomic) IBOutlet UILabel *timeLineName;
@property (weak, nonatomic) IBOutlet UILabel *timeLineTime;
@property (weak, nonatomic) IBOutlet UILabel *timeLineSource;
@property (weak, nonatomic) IBOutlet UIWeiboTextView *timeLineContent;

@property (weak, nonatomic) IBOutlet UIImageView *timeLineImage0;
@property (weak, nonatomic) IBOutlet UIImageView *timeLineImage1;
@property (weak, nonatomic) IBOutlet UIImageView *timeLineImage2;
@property (weak, nonatomic) IBOutlet UIImageView *timeLineImage3;
@property (weak, nonatomic) IBOutlet UIImageView *timeLineImage4;
@property (weak, nonatomic) IBOutlet UIImageView *timeLineImage5;
@property (weak, nonatomic) IBOutlet UIImageView *timeLineImage6;
@property (weak, nonatomic) IBOutlet UIImageView *timeLineImage7;
@property (weak, nonatomic) IBOutlet UIImageView *timeLineImage8;

-(void) showStatus:(Mblog *)status;

@property (weak, nonatomic) IBOutlet UIWeiboTextView *timeLineReTweetContent;
@property (weak, nonatomic) IBOutlet UIImageView *timeLineReTweetImage0;
@property (weak, nonatomic) IBOutlet UIImageView *timeLineReTweetImage1;
@property (weak, nonatomic) IBOutlet UIImageView *timeLineReTweetImage2;
@property (weak, nonatomic) IBOutlet UIImageView *timeLineReTweetImage3;
@property (weak, nonatomic) IBOutlet UIImageView *timeLineReTweetImage4;
@property (weak, nonatomic) IBOutlet UIImageView *timeLineReTweetImage5;
@property (weak, nonatomic) IBOutlet UIImageView *timeLineReTweetImage6;
@property (weak, nonatomic) IBOutlet UIImageView *timeLineReTweetImage7;
@property (weak, nonatomic) IBOutlet UIImageView *timeLineReTweetImage8;


@end
