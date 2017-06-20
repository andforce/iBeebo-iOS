//
// Created by 迪远 王 on 2017/6/20.
// Copyright (c) 2017 andforce. All rights reserved.
//

#import "HotWeibo.h"
#import "HotMblog.h"

#import "AFHTTPSessionManager+SimpleAction.h"

@implementation HotWeibo {

}

static UIFont *sStatusTextFont = nil;
static NSDictionary *sSpecialAttributes = nil;

- (instancetype)initWithMBlog:(HotMblog *)mblog {
    self = [super init];
    if (self) {

        sStatusTextFont = [UIFont systemFontOfSize:14];
        sSpecialAttributes = @{ NSForegroundColorAttributeName : [UIColor blueColor] };

        self.bid = mblog.bid;
        self.attitudesCount = mblog.attitudesCount;
        self.source = mblog.source;
        self.textLength = mblog.textLength;
        self.pageInfo = mblog.pageInfo;
        self.idstr = mblog.idstr;
        self.mid = mblog.mid;
        self.buttons = mblog.buttons;
        self.recommendSource = mblog.recommendSource;
        self.fromCateid = mblog.fromCateid;
        self.commentsCount = mblog.commentsCount;
        self.originalPic = mblog.originalPic;
        self.cardid = mblog.cardid;
        self.isLongText = mblog.isLongText;
        self.repostsCount = mblog.repostsCount;
        self.syncMblog = mblog.syncMblog;
        self.thumbnailPic = mblog.thumbnailPic;
        self.favorited = mblog.favorited;
        self.bmiddlePic = mblog.bmiddlePic;
        self.mblogIdentifier = mblog.mblogIdentifier;
        self.user = mblog.user;
        self.topicId = mblog.topicId;
        self.pics = mblog.pics;
        self.text = [self attributedTextWithText:mblog.text];
        self.isImportedTopic = mblog.isImportedTopic;
        self.createdAt = mblog.createdAt;
        self.visible = mblog.visible;
        self.picStatus = mblog.picStatus;
        self.mblogButtons = mblog.mblogButtons;
        self.rid = mblog.rid;
    }
    return self;
}

@end