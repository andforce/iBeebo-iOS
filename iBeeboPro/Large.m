//
//  Large.m
//
//  Created by   on 2017/6/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Large.h"
#import "Geo.h"


NSString *const kLargeUrl = @"url";
NSString *const kLargeSize = @"size";
NSString *const kLargeGeo = @"geo";


@interface Large ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Large

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
            self.url = [self objectOrNilForKey:kLargeUrl fromDictionary:dict];
            self.size = [self objectOrNilForKey:kLargeSize fromDictionary:dict];
            self.geo = [Geo modelObjectWithDictionary:[dict objectForKey:kLargeGeo]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.url forKey:kLargeUrl];
    [mutableDict setValue:self.size forKey:kLargeSize];
    [mutableDict setValue:[self.geo dictionaryRepresentation] forKey:kLargeGeo];

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

    self.url = [aDecoder decodeObjectForKey:kLargeUrl];
    self.size = [aDecoder decodeObjectForKey:kLargeSize];
    self.geo = [aDecoder decodeObjectForKey:kLargeGeo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_url forKey:kLargeUrl];
    [aCoder encodeObject:_size forKey:kLargeSize];
    [aCoder encodeObject:_geo forKey:kLargeGeo];
}

- (id)copyWithZone:(NSZone *)zone
{
    Large *copy = [[Large alloc] init];
    
    if (copy) {

        copy.url = [self.url copyWithZone:zone];
        copy.size = [self.size copyWithZone:zone];
        copy.geo = [self.geo copyWithZone:zone];
    }
    
    return copy;
}


@end
