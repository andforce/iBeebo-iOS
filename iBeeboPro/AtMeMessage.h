//
// Created by 迪远 王 on 2017/6/25.
// Copyright (c) 2017 andforce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseWeibo.h"
#import "AtMeCard.h"

#import "AtMeUser.h"
#import "AtMeVisible.h"
#import "AtMeCardGroup.h"

@interface AtMeMessage : BaseWeibo

@property (nonatomic, assign) BOOL favorited;
@property (nonatomic, assign) double attitudesStatus;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) double cardGroupIdentifier;
@property (nonatomic, strong) AtMeCard *card;
@property (nonatomic, assign) double isShowBulletin;
@property (nonatomic, assign) BOOL isLongText;
@property (nonatomic, strong) NSArray *topicStruct;
@property (nonatomic, strong) NSAttributedString *text;
@property (nonatomic, strong) NSString *idstr;
@property (nonatomic, strong) NSString *bid;
@property (nonatomic, assign) double likeCount;
@property (nonatomic, strong) NSString *gifIds;
@property (nonatomic, assign) double hasActionTypeCard;
@property (nonatomic, assign) double sourceType;
@property (nonatomic, strong) NSArray *hotWeiboTags;
@property (nonatomic, assign) double type;
@property (nonatomic, assign) double createdTimestamp;
@property (nonatomic, strong) AtMeUser *user;
@property (nonatomic, strong) NSArray *textTagTips;
@property (nonatomic, assign) double commentsCount;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, assign) double sourceAllowclick;
@property (nonatomic, assign) double bizFeature;
@property (nonatomic, assign) double positiveRecomFlag;
@property (nonatomic, strong) AtMeVisible *visible;
@property (nonatomic, assign) double appid;
@property (nonatomic, strong) NSString *mid;
@property (nonatomic, strong) NSArray *picIds;
@property (nonatomic, assign) double repostsCount;
@property (nonatomic, assign) double userType;
@property (nonatomic, assign) double attitudesCount;
@property (nonatomic, assign) double mlevel;
@property (nonatomic, strong) NSString *rid;
@property (nonatomic, strong) NSString *cardid;
@property (nonatomic, strong) NSString *modType;
@property (nonatomic, assign) double pid;
@property (nonatomic, strong) NSArray *urlStruct;

- (instancetype)initWithAtMeCardFroup:(AtMeCardGroup *)mblog;

@end