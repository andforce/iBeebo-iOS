//
//  CardGroup.h
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Mblog;

@interface CardGroup : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) Mblog *mblog;
@property (nonatomic, assign) double cardType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
