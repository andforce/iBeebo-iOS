//
//  MeUser.h
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MeBadge, MeH5icon;

@interface MeUser : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *ta;
@property (nonatomic, assign) double urank;
@property (nonatomic, strong) MeBadge *badge;
@property (nonatomic, assign) BOOL followMe;
@property (nonatomic, strong) NSString *genderIcon;
@property (nonatomic, assign) double verifiedType;
@property (nonatomic, strong) NSString *verifiedReason;
@property (nonatomic, assign) double mbtype;
@property (nonatomic, assign) double fansNum;
@property (nonatomic, strong) NSString *profileUrl;
@property (nonatomic, assign) BOOL verified;
@property (nonatomic, strong) NSString *userIdentifier;
@property (nonatomic, strong) MeH5icon *h5icon;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, strong) NSString *avatarHd;
@property (nonatomic, strong) NSString *profileImageUrl;
@property (nonatomic, assign) BOOL following;
@property (nonatomic, assign) double attNum;
@property (nonatomic, strong) NSString *nativePlace;
@property (nonatomic, assign) double mblogNum;
@property (nonatomic, assign) double ptype;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) double favouritesCount;
@property (nonatomic, assign) double mbrank;
@property (nonatomic, strong) NSString *userDescription;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
