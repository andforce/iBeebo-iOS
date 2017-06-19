//
//  HotPics.m
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HotPics.h"
#import "HotLarge.h"
#import "HotGeo.h"


NSString *const kHotPicsLarge = @"large";
NSString *const kHotPicsSize = @"size";
NSString *const kHotPicsUrl = @"url";
NSString *const kHotPicsPid = @"pid";
NSString *const kHotPicsGeo = @"geo";


@interface HotPics ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotPics

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
            self.large = [HotLarge modelObjectWithDictionary:[dict objectForKey:kHotPicsLarge]];
            self.size = [self objectOrNilForKey:kHotPicsSize fromDictionary:dict];
            self.url = [self objectOrNilForKey:kHotPicsUrl fromDictionary:dict];
            self.pid = [self objectOrNilForKey:kHotPicsPid fromDictionary:dict];
            self.geo = [HotGeo modelObjectWithDictionary:[dict objectForKey:kHotPicsGeo]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.large dictionaryRepresentation] forKey:kHotPicsLarge];
    [mutableDict setValue:self.size forKey:kHotPicsSize];
    [mutableDict setValue:self.url forKey:kHotPicsUrl];
    [mutableDict setValue:self.pid forKey:kHotPicsPid];
    [mutableDict setValue:[self.geo dictionaryRepresentation] forKey:kHotPicsGeo];

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

    self.large = [aDecoder decodeObjectForKey:kHotPicsLarge];
    self.size = [aDecoder decodeObjectForKey:kHotPicsSize];
    self.url = [aDecoder decodeObjectForKey:kHotPicsUrl];
    self.pid = [aDecoder decodeObjectForKey:kHotPicsPid];
    self.geo = [aDecoder decodeObjectForKey:kHotPicsGeo];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_large forKey:kHotPicsLarge];
    [aCoder encodeObject:_size forKey:kHotPicsSize];
    [aCoder encodeObject:_url forKey:kHotPicsUrl];
    [aCoder encodeObject:_pid forKey:kHotPicsPid];
    [aCoder encodeObject:_geo forKey:kHotPicsGeo];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotPics *copy = [[HotPics alloc] init];
    
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
