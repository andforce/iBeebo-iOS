//
//  Pics.h
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Geo;

@interface Pics : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *size;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *pid;
@property (nonatomic, strong) Geo *geo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
