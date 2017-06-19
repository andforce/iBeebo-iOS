//
//  HotPics.h
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HotLarge, HotGeo;

@interface HotPics : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) HotLarge *large;
@property (nonatomic, strong) NSString *size;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *pid;
@property (nonatomic, strong) HotGeo *geo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
