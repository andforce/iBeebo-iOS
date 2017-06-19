//
//  HotMediaInfo.m
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HotMediaInfo.h"


NSString *const kHotMediaInfoStreamUrl = @"stream_url";


@interface HotMediaInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotMediaInfo

@synthesize streamUrl = _streamUrl;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.streamUrl = [self objectOrNilForKey:kHotMediaInfoStreamUrl fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.streamUrl forKey:kHotMediaInfoStreamUrl];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.streamUrl = [aDecoder decodeObjectForKey:kHotMediaInfoStreamUrl];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_streamUrl forKey:kHotMediaInfoStreamUrl];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotMediaInfo *copy = [[HotMediaInfo alloc] init];
    
    if (copy) {

        copy.streamUrl = [self.streamUrl copyWithZone:zone];
    }
    
    return copy;
}


@end
