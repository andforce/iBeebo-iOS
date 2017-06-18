//
// Created by 迪远 王 on 2017/6/18.
// Copyright (c) 2017 andforce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseWeibo.h"

@class RetweetedStatus, PageInfo, User, Visible;

@interface RetweetedWeibo : BaseWeibo

@property (nonatomic, assign) double attitudesCount;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, assign) double textLength;
@property (nonatomic, assign) double hasActionTypeCard;
@property (nonatomic, strong) PageInfo *pageInfo;
@property (nonatomic, strong) NSString *mid;
@property (nonatomic, strong) NSString *gifIds;
@property (nonatomic, strong) NSString *originalPic;
@property (nonatomic, strong) NSString *cardid;
@property (nonatomic, assign) double commentsCount;
@property (nonatomic, assign) BOOL isLongText;
@property (nonatomic, assign) double repostsCount;
@property (nonatomic, assign) double isShowBulletin;
@property (nonatomic, strong) NSString *thumbnailPic;
@property (nonatomic, assign) BOOL favorited;
@property (nonatomic, strong) NSString *bmiddlePic;
@property (nonatomic, strong) NSString *retweetedStatusIdentifier;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSArray *pics;
@property (nonatomic, strong) NSAttributedString *text;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSArray *picIds;
@property (nonatomic, strong) Visible *visible;
@property (nonatomic, strong) NSString *picStatus;
@property (nonatomic, strong) NSString *bid;

- (instancetype)initWithRetweetedStatus:(RetweetedStatus *)retweetedStatus;

@end