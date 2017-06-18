//
// Created by 迪远 王 on 2017/6/18.
// Copyright (c) 2017 andforce. All rights reserved.
//

#import "Weibo.h"
#import "Mblog.h"

#import "AFHTTPSessionManager+SimpleAction.h"
#import "User.h"
#import "LXStatusTextLink.h"
#import "LXStatusTextPart.h"
#import "RegexKitLite.h"
#import "EmotionsManager.h"
#import "NSString+Extensions.h"
#import "RetweetedStatus.h"
#import "RetweetedWeibo.h"
#import <IGHTMLQuery.h>
@implementation Weibo {

}

static UIFont *sStatusTextFont = nil;
static NSDictionary *sSpecialAttributes = nil;


- (instancetype)initWithMBlog:(Mblog *)mblog {
    self = [super init];
    if (self){

        sStatusTextFont = [UIFont systemFontOfSize:14];
        sSpecialAttributes = @{ NSForegroundColorAttributeName : [UIColor blueColor] };

        self.rawText = mblog.rawText;
        self.attitudesCount = mblog.attitudesCount;
        self.source = mblog.source;
        self.hasActionTypeCard = mblog.hasActionTypeCard;
        self.textLength = mblog.textLength;
        self.mid = mblog.mid;
        self.gifIds = mblog.gifIds;
        self.pageInfo = mblog.pageInfo;
        self.originalPic = mblog.originalPic;
        self.retweetedStatus = [[RetweetedWeibo alloc] initWithRetweetedStatus:mblog.retweetedStatus];
        self.commentsCount = mblog.commentsCount;
        self.cardid = mblog.cardid;
        self.isLongText = mblog.isLongText;
        self.repostsCount = mblog.repostsCount;
        self.isShowBulletin = mblog.isShowBulletin;
        self.favorited = mblog.favorited;
        self.thumbnailPic = mblog.thumbnailPic;
        self.bmiddlePic = mblog.bmiddlePic;
        self.mblogIdentifier = mblog.mblogIdentifier;
        self.user = mblog.user;
        self.mlevelSource = mblog.mlevelSource;
        self.pics = mblog.pics;
        self.text = [self attributedTextWithText:mblog.text];
        self.pid = mblog.pid;
        self.createdAt = mblog.createdAt;
        self.visible = mblog.visible;
        self.picIds = mblog.picIds;
        self.picStatus = mblog.picStatus;
        self.rid = mblog.rid;
        self.bid = mblog.bid;
    }
    return self;
}


@end