//
//  AtMeTableViewCell.h
//  iBeeboPro
//
//  Created by 迪远 王 on 2017/6/21.
//  Copyright © 2017年 andforce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "UIWeiboTextView.h"
#import "AtMeMessage.h"

@class AtMeCardGroup;

@interface AtMeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *atMeAvatar;
@property (weak, nonatomic) IBOutlet UILabel *atMeName;
@property (weak, nonatomic) IBOutlet UILabel *atMeTime;
@property (weak, nonatomic) IBOutlet UILabel *atMeSource;
@property (weak, nonatomic) IBOutlet UIWeiboTextView *atMeContent;

@property (weak, nonatomic) IBOutlet UIImageView *orgAvatar;
@property (weak, nonatomic) IBOutlet UIWeiboTextView *orgName;
@property (weak, nonatomic) IBOutlet UIWeiboTextView *orgContent;

-(void) showAtMe:(AtMeMessage *)atMeMessage;

@end
