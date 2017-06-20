//
//  MeCardGroup.h
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MeUser;

@interface MeCardGroup : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double displayArrow;
@property (nonatomic, strong) NSString *desc1;
@property (nonatomic, assign) double subType;
@property (nonatomic, assign) double backgroundColor;
@property (nonatomic, assign) double bold;
@property (nonatomic, strong) NSString *buttons;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, assign) double desc2;
@property (nonatomic, strong) NSArray *apps;
@property (nonatomic, assign) double cardType;
@property (nonatomic, strong) NSString *scheme;
@property (nonatomic, strong) NSString *itemid;
@property (nonatomic, strong) NSString *descExtr;
@property (nonatomic, strong) MeUser *user;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
