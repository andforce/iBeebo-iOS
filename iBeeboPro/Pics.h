//
//  Pics.h
//
//  Created by   on 2017/6/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Large, Geo;

@interface Pics : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) Large *large;
@property (nonatomic, strong) NSString *size;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *pid;
@property (nonatomic, strong) Geo *geo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
