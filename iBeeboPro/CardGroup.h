//
//  CardGroup.h
//
//  Created by   on 2017/6/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Mblog;

@interface CardGroup : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *text;
@property (nonatomic, assign) double cardType;
@property (nonatomic, strong) Mblog *mblog;
@property (nonatomic, strong) NSString *scheme;
@property (nonatomic, strong) NSString *modType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
