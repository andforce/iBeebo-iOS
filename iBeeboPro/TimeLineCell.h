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
#import "BottomView.h"

@class HotWeibo;

@interface TimeLineCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *timeLineAvatar;
@property (weak, nonatomic) IBOutlet UILabel *timeLineName;
@property (weak, nonatomic) IBOutlet UILabel *timeLineTime;
@property (weak, nonatomic) IBOutlet UILabel *timeLineSource;
@property (weak, nonatomic) IBOutlet UIWeiboTextView *timeLineContent;


@property (weak, nonatomic) IBOutlet UIImageView *pageInfoImage;
@property (weak, nonatomic) IBOutlet UILabel *pageDesc;

-(void) showStatus:(Weibo *)weibo;

-(void) showHotWeibo:(HotWeibo *)hotWeibo;

@property (weak, nonatomic) IBOutlet UIWeiboTextView *timeLineReTweetContent;

- (IBAction)showPageInfo:(id)sender;
@property (weak, nonatomic) IBOutlet BottomView *bottomView;

@end
