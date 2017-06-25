//
//  AtMeTableViewCell.m
//  iBeeboPro
//
//  Created by 迪远 王 on 2017/6/21.
//  Copyright © 2017年 andforce. All rights reserved.
//

#import "AtMeTableViewCell.h"
#import "AtMeCardGroup.h"
#import "AtMeUser.h"
#import "AtMeCard.h"
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


- (void)showAtMe:(AtMeCardGroup *)cardGroup {
    [_atMeAvatar sd_setImageWithURL:[NSURL URLWithString:cardGroup.user.profileImageUrl]];
    _atMeName.text = cardGroup.user.screenName;
    _atMeTime.text = cardGroup.createdAt;
    _atMeSource.text = cardGroup.source;

    _atMeContent.text = cardGroup.text;


    [_orgAvatar sd_setImageWithURL:[NSURL URLWithString:cardGroup.card.pagePic]];
    _orgName.text = cardGroup.card.pageTitle;
    _orgContent.text = cardGroup.card.pageDesc;

}
@end
