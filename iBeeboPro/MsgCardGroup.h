//
//  MsgCardGroup.h
//
//  Created by   on 2017/6/20
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MsgUser;

@interface MsgCardGroup : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double unread;
@property (nonatomic, strong) NSString *scheme;
@property (nonatomic, strong) NSString *modType;
@property (nonatomic, assign) double displayArrow;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) MsgUser *user;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
