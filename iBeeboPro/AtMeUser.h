//
//  AtMeUser.h
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AtMeH5icon;

@interface AtMeUser : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double userIdentifier;
@property (nonatomic, strong) AtMeH5icon *h5icon;
@property (nonatomic, strong) NSString *userDescription;
@property (nonatomic, assign) double fansNum;
@property (nonatomic, assign) id valid;
@property (nonatomic, assign) BOOL followMe;
@property (nonatomic, strong) NSString *profileUrl;
@property (nonatomic, assign) BOOL verified;
@property (nonatomic, assign) double statusesCount;
@property (nonatomic, assign) double mbtype;
@property (nonatomic, strong) NSString *profileImageUrl;
@property (nonatomic, strong) NSString *verifiedReason;
@property (nonatomic, assign) double ismember;
@property (nonatomic, strong) NSString *remark;
@property (nonatomic, assign) BOOL following;
@property (nonatomic, assign) double verifiedType;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, strong) NSString *gender;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
