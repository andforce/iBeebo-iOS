//
//  RetweetedStatus.h
//
//  Created by   on 2017/6/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PageInfo, User, Visible;

@interface RetweetedStatus : NSObject <NSCoding, NSCopying>

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
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSArray *picIds;
@property (nonatomic, strong) Visible *visible;
@property (nonatomic, strong) NSString *picStatus;
@property (nonatomic, strong) NSString *bid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
