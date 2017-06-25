//
// Created by 迪远 王 on 2017/6/25.
// Copyright (c) 2017 andforce. All rights reserved.
//

#import "AtMeMessage.h"


@implementation AtMeMessage {

}
- (instancetype)initWithAtMeCardFroup:(AtMeCardGroup *)mblog {
    self = [self init];
    if (self){

        self.favorited = mblog.favorited;
        self.attitudesStatus = mblog.attitudesStatus;
        self.createdAt = mblog.createdAt;
        self.cardGroupIdentifier = mblog.cardGroupIdentifier;
        self.card = mblog.card;
        self.isShowBulletin = mblog.isShowBulletin;
        self.isLongText = mblog.isLongText;
        self.topicStruct = mblog.topicStruct;
        self.text = [self attributedTextWithText:mblog.text];
        self.idstr = mblog.idstr;
        self.bid = mblog.bid;
        self.likeCount = mblog.likeCount;
        self.gifIds = mblog.gifIds;
        self.hasActionTypeCard = mblog.hasActionTypeCard;
        self.sourceType = mblog.sourceType;
        self.hotWeiboTags = mblog.hotWeiboTags;
        self.type = mblog.type;
        self.createdTimestamp = mblog.createdTimestamp;
        self.user = mblog.user;
        self.textTagTips = mblog.textTagTips;
        self.commentsCount = mblog.commentsCount;
        self.source = mblog.source;
        self.sourceAllowclick = mblog.sourceAllowclick;
        self.bizFeature = mblog.bizFeature;
        self.positiveRecomFlag = mblog.positiveRecomFlag;
        self.visible = mblog.visible;
        self.appid = mblog.appid;
        self.mid = mblog.mid;
        self.picIds = mblog.picIds;
        self.repostsCount = mblog.repostsCount;
        self.userType = mblog.userType;
        self.attitudesCount = mblog.attitudesCount;
        self.mlevel = mblog.mlevel;
        self.rid = mblog.rid;
        self.cardid = mblog.cardid;
        self.modType = mblog.modType;
        self.pid = mblog.pid;
        self.urlStruct = mblog.urlStruct;
    }
    return self;
}

@end