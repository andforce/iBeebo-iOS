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


-(void) showStatus:(Weibo *)weibo;

-(void) showHotWeibo:(HotWeibo *)hotWeibo;

- (IBAction)showPageInfo:(id)sender;

@end
