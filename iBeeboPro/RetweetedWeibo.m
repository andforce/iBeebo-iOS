//
// Created by 迪远 王 on 2017/6/18.
// Copyright (c) 2017 andforce. All rights reserved.
//

#import "RetweetedWeibo.h"
#import "RetweetedStatus.h"
#import "User.h"


@implementation RetweetedWeibo {

}
- (instancetype)initWithRetweetedStatus:(RetweetedStatus *)retweetedStatus {
    self = [self init];
    if (self){
        self.attitudesCount = retweetedStatus.attitudesCount;
        self.source = retweetedStatus.source;
        self.textLength = retweetedStatus.textLength;
        self.hasActionTypeCard = retweetedStatus.hasActionTypeCard;
        self.pageInfo = retweetedStatus.pageInfo;
        self.mid = retweetedStatus.mid;
        self.gifIds = retweetedStatus.gifIds;
        self.originalPic = retweetedStatus.originalPic;
        self.cardid = retweetedStatus.cardid;
        self.commentsCount = retweetedStatus.commentsCount;
        self.isLongText = retweetedStatus.isLongText;
        self.repostsCount = retweetedStatus.repostsCount;
        self.isShowBulletin = retweetedStatus.isShowBulletin;
        self.thumbnailPic = retweetedStatus.thumbnailPic;
        self.favorited = retweetedStatus.favorited;
        self.bmiddlePic = retweetedStatus.bmiddlePic;
        self.retweetedStatusIdentifier = retweetedStatus.retweetedStatusIdentifier;
        self.user = retweetedStatus.user;
        self.pics = retweetedStatus.pics;
        if (retweetedStatus.user.screenName == nil){
            self.text = nil;
        } else {
            NSString * retweet = [NSString stringWithFormat:@"@%@: %@",retweetedStatus.user.screenName, retweetedStatus.text];
            self.text = [self attributedTextWithText:retweet];
        }
        self.createdAt = retweetedStatus.createdAt;
        self.picIds = retweetedStatus.picIds;
        self.visible = retweetedStatus.visible;
        self.picStatus = retweetedStatus.picStatus;
        self.bid = retweetedStatus.bid;
    }
    return self;
}

@end