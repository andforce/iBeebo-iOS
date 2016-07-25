//
//  Geo.m
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Geo.h"


NSString *const kGeoCroped = @"croped";
NSString *const kGeoWidth = @"width";
NSString *const kGeoHeight = @"height";
NSString *const kGeoByte = @"byte";


@interface Geo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Geo

@synthesize croped = _croped;
@synthesize width = _width;
@synthesize height = _height;
@synthesize byte = _byte;


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
            self.croped = [[self objectOrNilForKey:kGeoCroped fromDictionary:dict] boolValue];
            self.width = [[self objectOrNilForKey:kGeoWidth fromDictionary:dict] doubleValue];
            self.height = [[self objectOrNilForKey:kGeoHeight fromDictionary:dict] doubleValue];
            self.byte = [[self objectOrNilForKey:kGeoByte fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.croped] forKey:kGeoCroped];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kGeoWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kGeoHeight];
    [mutableDict setValue:[NSNumber numberWithDouble:self.byte] forKey:kGeoByte];

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

    self.croped = [aDecoder decodeBoolForKey:kGeoCroped];
    self.width = [aDecoder decodeDoubleForKey:kGeoWidth];
    self.height = [aDecoder decodeDoubleForKey:kGeoHeight];
    self.byte = [aDecoder decodeDoubleForKey:kGeoByte];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_croped forKey:kGeoCroped];
    [aCoder encodeDouble:_width forKey:kGeoWidth];
    [aCoder encodeDouble:_height forKey:kGeoHeight];
    [aCoder encodeDouble:_byte forKey:kGeoByte];
}

- (id)copyWithZone:(NSZone *)zone
{
    Geo *copy = [[Geo alloc] init];
    
    if (copy) {

        copy.croped = self.croped;
        copy.width = self.width;
        copy.height = self.height;
        copy.byte = self.byte;
    }
    
    return copy;
}


@end
