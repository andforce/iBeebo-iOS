//
//  TimeLineCell.h
//  iBeeboPro
//
//  Created by 迪远 王 on 16/7/26.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeLineCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *timeLineAvatar;
@property (weak, nonatomic) IBOutlet UILabel *timeLineName;
@property (weak, nonatomic) IBOutlet UILabel *timeLineTime;
@property (weak, nonatomic) IBOutlet UILabel *timeLineSource;
@property (weak, nonatomic) IBOutlet UILabel *timeLineContent;

@end
