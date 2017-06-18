//
// Created by 迪远 王 on 2017/6/18.
// Copyright (c) 2017 andforce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseWeibo.h"

@class Mblog, PageInfo, RetweetedWeibo, User, Visible;

@interface Weibo : BaseWeibo

@property (nonatomic, strong) NSString *rawText;
@property (nonatomic, assign) double attitudesCount;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, assign) double hasActionTypeCard;
@property (nonatomic, assign) double textLength;
@property (nonatomic, strong) NSString *mid;
@property (nonatomic, strong) NSString *gifIds;
@property (nonatomic, strong) PageInfo *pageInfo;
@property (nonatomic, strong) NSString *originalPic;
@property (nonatomic, strong) RetweetedWeibo *retweetedWeibo;
@property (nonatomic, assign) double commentsCount;
@property (nonatomic, strong) NSString *cardid;
@property (nonatomic, assign) BOOL isLongText;
@property (nonatomic, assign) double repostsCount;
@property (nonatomic, assign) double isShowBulletin;
@property (nonatomic, assign) BOOL favorited;
@property (nonatomic, strong) NSString *thumbnailPic;
@property (nonatomic, strong) NSString *bmiddlePic;
@property (nonatomic, strong) NSString *mblogIdentifier;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSString *mlevelSource;
@property (nonatomic, strong) NSArray *pics;
@property (nonatomic, strong) NSAttributedString *text;
@property (nonatomic, assign) double pid;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) Visible *visible;
@property (nonatomic, strong) NSArray *picIds;
@property (nonatomic, strong) NSString *picStatus;
@property (nonatomic, strong) NSString *rid;
@property (nonatomic, strong) NSString *bid;

- (instancetype)initWithMBlog:(Mblog *)mblog;

@end