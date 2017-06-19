//
//  HotUser.h
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HotUser : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double userIdentifier;
@property (nonatomic, strong) NSString *userDescription;
@property (nonatomic, assign) double followersCount;
@property (nonatomic, assign) double urank;
@property (nonatomic, assign) BOOL followMe;
@property (nonatomic, strong) NSString *profileUrl;
@property (nonatomic, assign) BOOL verified;
@property (nonatomic, assign) double mbtype;
@property (nonatomic, strong) NSString *verifiedReason;
@property (nonatomic, strong) NSString *profileImageUrl;
@property (nonatomic, assign) double statusesCount;
@property (nonatomic, assign) double verifiedTypeExt;
@property (nonatomic, assign) double followCount;
@property (nonatomic, strong) NSString *coverImagePhone;
@property (nonatomic, assign) double mbrank;
@property (nonatomic, assign) BOOL following;
@property (nonatomic, assign) double verifiedType;
@property (nonatomic, strong) NSString *screenName;
@property (nonatomic, strong) NSString *gender;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
