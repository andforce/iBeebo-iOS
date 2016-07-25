//
//  Actionlog.m
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Actionlog.h"


NSString *const kActionlogExt = @"ext";
NSString *const kActionlogOid = @"oid";
NSString *const kActionlogActCode = @"act_code";
NSString *const kActionlogActType = @"act_type";


@interface Actionlog ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Actionlog

@synthesize ext = _ext;
@synthesize oid = _oid;
@synthesize actCode = _actCode;
@synthesize actType = _actType;


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
            self.ext = [self objectOrNilForKey:kActionlogExt fromDictionary:dict];
            self.oid = [self objectOrNilForKey:kActionlogOid fromDictionary:dict];
            self.actCode = [[self objectOrNilForKey:kActionlogActCode fromDictionary:dict] doubleValue];
            self.actType = [[self objectOrNilForKey:kActionlogActType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.ext forKey:kActionlogExt];
    [mutableDict setValue:self.oid forKey:kActionlogOid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.actCode] forKey:kActionlogActCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.actType] forKey:kActionlogActType];

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

    self.ext = [aDecoder decodeObjectForKey:kActionlogExt];
    self.oid = [aDecoder decodeObjectForKey:kActionlogOid];
    self.actCode = [aDecoder decodeDoubleForKey:kActionlogActCode];
    self.actType = [aDecoder decodeDoubleForKey:kActionlogActType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_ext forKey:kActionlogExt];
    [aCoder encodeObject:_oid forKey:kActionlogOid];
    [aCoder encodeDouble:_actCode forKey:kActionlogActCode];
    [aCoder encodeDouble:_actType forKey:kActionlogActType];
}

- (id)copyWithZone:(NSZone *)zone
{
    Actionlog *copy = [[Actionlog alloc] init];
    
    if (copy) {

        copy.ext = [self.ext copyWithZone:zone];
        copy.oid = [self.oid copyWithZone:zone];
        copy.actCode = self.actCode;
        copy.actType = self.actType;
    }
    
    return copy;
}


@end
