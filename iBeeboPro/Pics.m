//
//  Pics.m
//
//  Created by   on 2017/6/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Pics.h"
#import "Large.h"
#import "Geo.h"


NSString *const kPicsLarge = @"large";
NSString *const kPicsSize = @"size";
NSString *const kPicsUrl = @"url";
NSString *const kPicsPid = @"pid";
NSString *const kPicsGeo = @"geo";


@interface Pics ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Pics

@synthesize large = _large;
@synthesize size = _size;
@synthesize url = _url;
@synthesize pid = _pid;
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
            self.large = [Large modelObjectWithDictionary:[dict objectForKey:kPicsLarge]];
            self.size = [self objectOrNilForKey:kPicsSize fromDictionary:dict];
            self.url = [self objectOrNilForKey:kPicsUrl fromDictionary:dict];
            self.pid = [self objectOrNilForKey:kPicsPid fromDictionary:dict];
            self.geo = [Geo modelObjectWithDictionary:[dict objectForKey:kPicsGeo]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.large dictionaryRepresentation] forKey:kPicsLarge];
    [mutableDict setValue:self.size forKey:kPicsSize];
    [mutableDict setValue:self.url forKey:kPicsUrl];
    [mutableDict setValue:self.pid forKey:kPicsPid];
    [mutableDict setValue:[self.geo dictionaryRepresentation] forKey:kPicsGeo];

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

    self.large = [aDecoder decodeObjectForKey:kPicsLarge];
    self.size = [aDecoder decodeObjectForKey:kPicsSize];
    self.url = [aDecoder decodeObjectForKey:kPicsUrl];
    self.pid = [aDecoder decodeObjectForKey:kPicsPid];
    self.geo = [aDecoder decodeObjectForKey:kPicsGeo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_large forKey:kPicsLarge];
    [aCoder encodeObject:_size forKey:kPicsSize];
    [aCoder encodeObject:_url forKey:kPicsUrl];
    [aCoder encodeObject:_pid forKey:kPicsPid];
    [aCoder encodeObject:_geo forKey:kPicsGeo];
}

- (id)copyWithZone:(NSZone *)zone
{
    Pics *copy = [[Pics alloc] init];
    
    if (copy) {

        copy.large = [self.large copyWithZone:zone];
        copy.size = [self.size copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.pid = [self.pid copyWithZone:zone];
        copy.geo = [self.geo copyWithZone:zone];
    }
    
    return copy;
}


@end
