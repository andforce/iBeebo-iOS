//
//  RetweetedStatus.h
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PageInfo, ExtendInfo, User, Visible;

@interface RetweetedStatus : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) BOOL favorited;
@property (nonatomic, assign) double attitudesStatus;
@property (nonatomic, strong) PageInfo *pageInfo;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) double retweetedStatusIdentifier;
@property (nonatomic, strong) ExtendInfo *extendInfo;
@property (nonatomic, assign) BOOL isLongText;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *idstr;
@property (nonatomic, strong) NSArray *pics;
@property (nonatomic, strong) NSString *bid;
@property (nonatomic, assign) double likeCount;
@property (nonatomic, assign) double textLength;
@property (nonatomic, assign) double sourceType;
@property (nonatomic, strong) NSArray *hotWeiboTags;
@property (nonatomic, assign) double createdTimestamp;
@property (nonatomic, assign) double pageType;
@property (nonatomic, strong) User *user;
@property (nonatomic, strong) NSArray *textTagTips;
@property (nonatomic, assign) double commentsCount;
@property (nonatomic, strong) NSString *thumbnailPic;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, assign) double sourceAllowclick;
@property (nonatomic, assign) double bizFeature;
@property (nonatomic, assign) double positiveRecomFlag;
@property (nonatomic, strong) NSString *bmiddlePic;
@property (nonatomic, strong) Visible *visible;
@property (nonatomic, assign) double appid;
@property (nonatomic, strong) NSString *mid;
@property (nonatomic, strong) NSArray *picIds;
@property (nonatomic, assign) double repostsCount;
@property (nonatomic, assign) double userType;
@property (nonatomic, assign) double attitudesCount;
@property (nonatomic, assign) double mlevel;
@property (nonatomic, strong) NSString *originalPic;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
