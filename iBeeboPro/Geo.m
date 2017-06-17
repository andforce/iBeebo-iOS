//
//  Geo.m
//
//  Created by   on 2017/6/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Geo.h"


NSString *const kGeoWidth = @"width";
NSString *const kGeoCroped = @"croped";
NSString *const kGeoHeight = @"height";


@interface Geo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Geo

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
            self.width = [self objectOrNilForKey:kGeoWidth fromDictionary:dict];
            self.croped = [[self objectOrNilForKey:kGeoCroped fromDictionary:dict] boolValue];
            self.height = [self objectOrNilForKey:kGeoHeight fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.width forKey:kGeoWidth];
    [mutableDict setValue:[NSNumber numberWithBool:self.croped] forKey:kGeoCroped];
    [mutableDict setValue:self.height forKey:kGeoHeight];

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

    self.width = [aDecoder decodeObjectForKey:kGeoWidth];
    self.croped = [aDecoder decodeBoolForKey:kGeoCroped];
    self.height = [aDecoder decodeObjectForKey:kGeoHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_width forKey:kGeoWidth];
    [aCoder encodeBool:_croped forKey:kGeoCroped];
    [aCoder encodeObject:_height forKey:kGeoHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    Geo *copy = [[Geo alloc] init];
    
    if (copy) {

        copy.width = [self.width copyWithZone:zone];
        copy.croped = self.croped;
        copy.height = [self.height copyWithZone:zone];
    }
    
    return copy;
}


@end
