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
    _atMeName = cardGroup.user.screenName;

}
@end
