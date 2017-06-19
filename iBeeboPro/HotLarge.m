//
//  HotLarge.m
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HotLarge.h"
#import "HotGeo.h"


NSString *const kHotLargeUrl = @"url";
NSString *const kHotLargeSize = @"size";
NSString *const kHotLargeGeo = @"geo";


@interface HotLarge ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotLarge

@synthesize url = _url;
@synthesize size = _size;
@synthesize geo = _geo;


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
            self.url = [self objectOrNilForKey:kHotLargeUrl fromDictionary:dict];
            self.size = [self objectOrNilForKey:kHotLargeSize fromDictionary:dict];
            self.geo = [HotGeo modelObjectWithDictionary:[dict objectForKey:kHotLargeGeo]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.url forKey:kHotLargeUrl];
    [mutableDict setValue:self.size forKey:kHotLargeSize];
    [mutableDict setValue:[self.geo dictionaryRepresentation] forKey:kHotLargeGeo];

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

    self.url = [aDecoder decodeObjectForKey:kHotLargeUrl];
    self.size = [aDecoder decodeObjectForKey:kHotLargeSize];
    self.geo = [aDecoder decodeObjectForKey:kHotLargeGeo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_url forKey:kHotLargeUrl];
    [aCoder encodeObject:_size forKey:kHotLargeSize];
    [aCoder encodeObject:_geo forKey:kHotLargeGeo];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotLarge *copy = [[HotLarge alloc] init];
    
    if (copy) {

        copy.url = [self.url copyWithZone:zone];
        copy.size = [self.size copyWithZone:zone];
        copy.geo = [self.geo copyWithZone:zone];
    }
    
    return copy;
}


@end
