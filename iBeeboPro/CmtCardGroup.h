//
//  CmtCardGroup.h
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CmtCard, CmtUser;

@interface CmtCardGroup : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *source;
@property (nonatomic, assign) double cardGroupIdentifier;
@property (nonatomic, strong) CmtCard *card;
@property (nonatomic, assign) double replyId;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *replyText;
@property (nonatomic, strong) NSString *modType;
@property (nonatomic, assign) double type;
@property (nonatomic, strong) CmtUser *user;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
