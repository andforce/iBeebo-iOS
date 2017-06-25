//
//  AtMeTableViewCell.m
//  iBeeboPro
//
//  Created by 迪远 王 on 2017/6/21.
//  Copyright © 2017年 andforce. All rights reserved.
//

#import "AtMeTableViewCell.h"
#import <UIImageView+WebCache.h>

@implementation AtMeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)showAtMe:(AtMeMessage *)atMeMessage {
    [_atMeAvatar sd_setImageWithURL:[NSURL URLWithString:atMeMessage.user.profileImageUrl]];
    _atMeName.text = atMeMessage.user.screenName;
    _atMeTime.text = atMeMessage.createdAt;
    _atMeSource.text = atMeMessage.source;

    _atMeContent.attributedText = atMeMessage.text;


    [_orgAvatar sd_setImageWithURL:[NSURL URLWithString:atMeMessage.card.pagePic]];
    _orgName.text = atMeMessage.card.pageTitle;
    _orgContent.text = atMeMessage.card.pageDesc;

}
@end
