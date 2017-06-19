//
//  HotMblog.h
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HotPageInfo, HotUser, HotVisible;

@interface HotMblog : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *rid;
@property (nonatomic, assign) double attitudesCount;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, assign) double textLength;
@property (nonatomic, strong) HotPageInfo *pageInfo;
@property (nonatomic, strong) NSString *idstr;
@property (nonatomic, strong) NSString *mid;
@property (nonatomic, strong) NSArray *buttons;
@property (nonatomic, assign) double recommendSource;
@property (nonatomic, strong) NSString *fromCateid;
@property (nonatomic, strong) NSString *cardid;
@property (nonatomic, assign) double commentsCount;
@property (nonatomic, strong) NSString *originalPic;
@property (nonatomic, assign) BOOL isLongText;
@property (nonatomic, assign) double repostsCount;
@property (nonatomic, assign) double expireTime;
@property (nonatomic, strong) NSString *thumbnailPic;
@property (nonatomic, assign) BOOL favorited;
@property (nonatomic, strong) NSString *bmiddlePic;
@property (nonatomic, strong) NSString *mblogIdentifier;
@property (nonatomic, strong) HotUser *user;
@property (nonatomic, strong) NSArray *pics;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) HotVisible *visible;
@property (nonatomic, strong) NSString *picStatus;
@property (nonatomic, strong) NSArray *mblogButtons;
@property (nonatomic, strong) NSString *bid;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
