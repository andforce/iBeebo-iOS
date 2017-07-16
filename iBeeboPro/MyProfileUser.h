//
//  MyProfileUser.h
//
//  Created by   on 2017/7/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MyProfileBadge, MyProfileH5icon;

@interface MyProfileUser : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *userDescription;
@property (nonatomic, assign) double urank;
@property (nonatomic, strong) MyProfileBadge *badge;
@property (nonatomic, assign) BOOL followMe;
@property (nonatomic, strong) NSString *genderIcon;
@property (nonatomic, assign) double verifiedType;
@property (nonatomic, strong) NSString *verifiedReason;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, assign) double fansNum;
@property (nonatomic, strong) NSString *profileUrl;
@property (nonatomic, assign) BOOL verified;
@property (nonatomic, strong) NSString *userIdentifier;
@property (nonatomic, strong) MyProfileH5icon *h5icon;
@property (nonatomic, assign) double mbtype;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *avatarHd;
@property (nonatomic, strong) NSString *profileImageUrl;
@property (nonatomic, assign) BOOL following;
@property (nonatomic, assign) double attNum;
@property (nonatomic, strong) NSString *nativePlace;
@property (nonatomic, assign) double mblogNum;
@property (nonatomic, assign) double ptype;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) double favouritesCount;
@property (nonatomic, strong) NSString *ta;
@property (nonatomic, assign) double mbrank;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
