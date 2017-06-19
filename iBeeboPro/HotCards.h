//
//  HotCards.h
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HotMblog;

@interface HotCards : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *itemid;
@property (nonatomic, strong) NSString *scheme;
@property (nonatomic, assign) double cardType;
@property (nonatomic, strong) NSArray *mblogButtons;
@property (nonatomic, strong) NSString *weiboNeed;
@property (nonatomic, strong) HotMblog *mblog;
@property (nonatomic, assign) double showType;
@property (nonatomic, strong) NSString *openurl;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
