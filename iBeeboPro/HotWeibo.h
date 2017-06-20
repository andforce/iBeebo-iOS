//
// Created by 迪远 王 on 2017/6/20.
// Copyright (c) 2017 andforce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseWeibo.h"
#import "HotPageInfo.h"
#import "HotUser.h"
#import "HotVisible.h"

@class HotMblog;


@interface HotWeibo : BaseWeibo

@property (nonatomic, strong) NSString *bid;
@property (nonatomic, assign) double attitudesCount;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, assign) double textLength;
@property (nonatomic, strong) HotPageInfo *pageInfo;
@property (nonatomic, strong) NSString *idstr;
@property (nonatomic, strong) NSString *mid;
@property (nonatomic, strong) NSArray *buttons;
@property (nonatomic, assign) double recommendSource;
@property (nonatomic, strong) NSString *fromCateid;
@property (nonatomic, assign) double commentsCount;
@property (nonatomic, strong) NSString *originalPic;
@property (nonatomic, strong) NSString *cardid;
@property (nonatomic, assign) BOOL isLongText;
@property (nonatomic, assign) double repostsCount;
@property (nonatomic, assign) BOOL syncMblog;
@property (nonatomic, strong) NSString *thumbnailPic;
@property (nonatomic, assign) BOOL favorited;
@property (nonatomic, strong) NSString *bmiddlePic;
@property (nonatomic, strong) NSString *mblogIdentifier;
@property (nonatomic, strong) HotUser *user;
@property (nonatomic, strong) NSString *topicId;
@property (nonatomic, strong) NSArray *pics;
@property (nonatomic, strong) NSAttributedString *text;
@property (nonatomic, assign) BOOL isImportedTopic;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) HotVisible *visible;
@property (nonatomic, strong) NSString *picStatus;
@property (nonatomic, strong) NSArray *mblogButtons;
@property (nonatomic, strong) NSString *rid;


- (instancetype)initWithMBlog:(HotMblog *)mblog;

@end