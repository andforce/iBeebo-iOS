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
#import "Weibo.h"

@class HotWeibo;

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

@property (weak, nonatomic) IBOutlet UIImageView *pageInfoImage;
@property (weak, nonatomic) IBOutlet UILabel *pageDesc;

-(void) showStatus:(Weibo *)status;

-(void) showHotWeibo:(HotWeibo *)status;

@property (weak, nonatomic) IBOutlet UIWeiboTextView *timeLineReTweetContent;



@end
