//
//  AtMeActionlog.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "AtMeActionlog.h"


NSString *const kAtMeActionlogSource = @"source";
NSString *const kAtMeActionlogUid = @"uid";
NSString *const kAtMeActionlogCardid = @"cardid";
NSString *const kAtMeActionlogMid = @"mid";
NSString *const kAtMeActionlogExt = @"ext";
NSString *const kAtMeActionlogActCode = @"act_code";
NSString *const kAtMeActionlogUuid = @"uuid";
NSString *const kAtMeActionlogFid = @"fid";
NSString *const kAtMeActionlogLcardid = @"lcardid";
NSString *const kAtMeActionlogActType = @"act_type";


@interface AtMeActionlog ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AtMeActionlog

@synthesize source = _source;
@synthesize uid = _uid;
@synthesize cardid = _cardid;
@synthesize mid = _mid;
@synthesize ext = _ext;
@synthesize actCode = _actCode;
@synthesize uuid = _uuid;
@synthesize fid = _fid;
@synthesize lcardid = _lcardid;
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
            self.source = [self objectOrNilForKey:kAtMeActionlogSource fromDictionary:dict];
            self.uid = [self objectOrNilForKey:kAtMeActionlogUid fromDictionary:dict];
            self.cardid = [self objectOrNilForKey:kAtMeActionlogCardid fromDictionary:dict];
            self.mid = [self objectOrNilForKey:kAtMeActionlogMid fromDictionary:dict];
            self.ext = [self objectOrNilForKey:kAtMeActionlogExt fromDictionary:dict];
            self.actCode = [[self objectOrNilForKey:kAtMeActionlogActCode fromDictionary:dict] doubleValue];
            self.uuid = [[self objectOrNilForKey:kAtMeActionlogUuid fromDictionary:dict] doubleValue];
            self.fid = [self objectOrNilForKey:kAtMeActionlogFid fromDictionary:dict];
            self.lcardid = [self objectOrNilForKey:kAtMeActionlogLcardid fromDictionary:dict];
            self.actType = [[self objectOrNilForKey:kAtMeActionlogActType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.source forKey:kAtMeActionlogSource];
    [mutableDict setValue:self.uid forKey:kAtMeActionlogUid];
    [mutableDict setValue:self.cardid forKey:kAtMeActionlogCardid];
    [mutableDict setValue:self.mid forKey:kAtMeActionlogMid];
    [mutableDict setValue:self.ext forKey:kAtMeActionlogExt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.actCode] forKey:kAtMeActionlogActCode];
    [mutableDict setValue:[NSNumber numberWithDouble:self.uuid] forKey:kAtMeActionlogUuid];
    [mutableDict setValue:self.fid forKey:kAtMeActionlogFid];
    [mutableDict setValue:self.lcardid forKey:kAtMeActionlogLcardid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.actType] forKey:kAtMeActionlogActType];

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

    self.source = [aDecoder decodeObjectForKey:kAtMeActionlogSource];
    self.uid = [aDecoder decodeObjectForKey:kAtMeActionlogUid];
    self.cardid = [aDecoder decodeObjectForKey:kAtMeActionlogCardid];
    self.mid = [aDecoder decodeObjectForKey:kAtMeActionlogMid];
    self.ext = [aDecoder decodeObjectForKey:kAtMeActionlogExt];
    self.actCode = [aDecoder decodeDoubleForKey:kAtMeActionlogActCode];
    self.uuid = [aDecoder decodeDoubleForKey:kAtMeActionlogUuid];
    self.fid = [aDecoder decodeObjectForKey:kAtMeActionlogFid];
    self.lcardid = [aDecoder decodeObjectForKey:kAtMeActionlogLcardid];
    self.actType = [aDecoder decodeDoubleForKey:kAtMeActionlogActType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_source forKey:kAtMeActionlogSource];
    [aCoder encodeObject:_uid forKey:kAtMeActionlogUid];
    [aCoder encodeObject:_cardid forKey:kAtMeActionlogCardid];
    [aCoder encodeObject:_mid forKey:kAtMeActionlogMid];
    [aCoder encodeObject:_ext forKey:kAtMeActionlogExt];
    [aCoder encodeDouble:_actCode forKey:kAtMeActionlogActCode];
    [aCoder encodeDouble:_uuid forKey:kAtMeActionlogUuid];
    [aCoder encodeObject:_fid forKey:kAtMeActionlogFid];
    [aCoder encodeObject:_lcardid forKey:kAtMeActionlogLcardid];
    [aCoder encodeDouble:_actType forKey:kAtMeActionlogActType];
}

- (id)copyWithZone:(NSZone *)zone
{
    AtMeActionlog *copy = [[AtMeActionlog alloc] init];
    
    if (copy) {

        copy.source = [self.source copyWithZone:zone];
        copy.uid = [self.uid copyWithZone:zone];
        copy.cardid = [self.cardid copyWithZone:zone];
        copy.mid = [self.mid copyWithZone:zone];
        copy.ext = [self.ext copyWithZone:zone];
        copy.actCode = self.actCode;
        copy.uuid = self.uuid;
        copy.fid = [self.fid copyWithZone:zone];
        copy.lcardid = [self.lcardid copyWithZone:zone];
        copy.actType = self.actType;
    }
    
    return copy;
}


@end
