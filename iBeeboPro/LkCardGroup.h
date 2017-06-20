//
//  LkCardGroup.h
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LkCard, LkUser;

@interface LkCardGroup : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double cardGroupIdentifier;
@property (nonatomic, assign) double sourceAllowclick;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) double sourceType;
@property (nonatomic, assign) double attitudeType;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *attitude;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) LkCard *card;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) LkUser *user;
@property (nonatomic, strong) NSString *modType;
@property (nonatomic, strong) NSString *lastAttitude;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
