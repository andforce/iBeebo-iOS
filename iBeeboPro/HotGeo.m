//
//  HotGeo.m
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HotGeo.h"


NSString *const kHotGeoWidth = @"width";
NSString *const kHotGeoCroped = @"croped";
NSString *const kHotGeoHeight = @"height";


@interface HotGeo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotGeo

@synthesize width = _width;
@synthesize croped = _croped;
@synthesize height = _height;


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
            self.width = [self objectOrNilForKey:kHotGeoWidth fromDictionary:dict];
            self.croped = [[self objectOrNilForKey:kHotGeoCroped fromDictionary:dict] boolValue];
            self.height = [self objectOrNilForKey:kHotGeoHeight fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.width forKey:kHotGeoWidth];
    [mutableDict setValue:[NSNumber numberWithBool:self.croped] forKey:kHotGeoCroped];
    [mutableDict setValue:self.height forKey:kHotGeoHeight];

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

    self.width = [aDecoder decodeObjectForKey:kHotGeoWidth];
    self.croped = [aDecoder decodeBoolForKey:kHotGeoCroped];
    self.height = [aDecoder decodeObjectForKey:kHotGeoHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_width forKey:kHotGeoWidth];
    [aCoder encodeBool:_croped forKey:kHotGeoCroped];
    [aCoder encodeObject:_height forKey:kHotGeoHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotGeo *copy = [[HotGeo alloc] init];
    
    if (copy) {

        copy.width = [self.width copyWithZone:zone];
        copy.croped = self.croped;
        copy.height = [self.height copyWithZone:zone];
    }
    
    return copy;
}


@end
