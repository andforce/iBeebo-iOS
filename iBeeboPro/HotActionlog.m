//
//  HotActionlog.m
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HotActionlog.h"


NSString *const kHotActionlogSource = @"source";
NSString *const kHotActionlogUicode = @"uicode";
NSString *const kHotActionlogCardid = @"cardid";
NSString *const kHotActionlogExt = @"ext";
NSString *const kHotActionlogActCode = @"act_code";
NSString *const kHotActionlogFid = @"fid";
NSString *const kHotActionlogLfid = @"lfid";
NSString *const kHotActionlogOid = @"oid";
NSString *const kHotActionlogActType = @"act_type";


@interface HotActionlog ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotActionlog

@synthesize source = _source;
@synthesize uicode = _uicode;
@synthesize cardid = _cardid;
@synthesize ext = _ext;
@synthesize actCode = _actCode;
@synthesize fid = _fid;
@synthesize lfid = _lfid;
@synthesize oid = _oid;
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
            self.source = [self objectOrNilForKey:kHotActionlogSource fromDictionary:dict];
            self.uicode = [self objectOrNilForKey:kHotActionlogUicode fromDictionary:dict];
            self.cardid = [self objectOrNilForKey:kHotActionlogCardid fromDictionary:dict];
            self.ext = [self objectOrNilForKey:kHotActionlogExt fromDictionary:dict];
            self.actCode = [self objectOrNilForKey:kHotActionlogActCode fromDictionary:dict];
            self.fid = [self objectOrNilForKey:kHotActionlogFid fromDictionary:dict];
            self.lfid = [self objectOrNilForKey:kHotActionlogLfid fromDictionary:dict];
            self.oid = [self objectOrNilForKey:kHotActionlogOid fromDictionary:dict];
            self.actType = [self objectOrNilForKey:kHotActionlogActType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.source forKey:kHotActionlogSource];
    [mutableDict setValue:self.uicode forKey:kHotActionlogUicode];
    [mutableDict setValue:self.cardid forKey:kHotActionlogCardid];
    [mutableDict setValue:self.ext forKey:kHotActionlogExt];
    [mutableDict setValue:self.actCode forKey:kHotActionlogActCode];
    [mutableDict setValue:self.fid forKey:kHotActionlogFid];
    [mutableDict setValue:self.lfid forKey:kHotActionlogLfid];
    [mutableDict setValue:self.oid forKey:kHotActionlogOid];
    [mutableDict setValue:self.actType forKey:kHotActionlogActType];

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

    self.source = [aDecoder decodeObjectForKey:kHotActionlogSource];
    self.uicode = [aDecoder decodeObjectForKey:kHotActionlogUicode];
    self.cardid = [aDecoder decodeObjectForKey:kHotActionlogCardid];
    self.ext = [aDecoder decodeObjectForKey:kHotActionlogExt];
    self.actCode = [aDecoder decodeObjectForKey:kHotActionlogActCode];
    self.fid = [aDecoder decodeObjectForKey:kHotActionlogFid];
    self.lfid = [aDecoder decodeObjectForKey:kHotActionlogLfid];
    self.oid = [aDecoder decodeObjectForKey:kHotActionlogOid];
    self.actType = [aDecoder decodeObjectForKey:kHotActionlogActType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_source forKey:kHotActionlogSource];
    [aCoder encodeObject:_uicode forKey:kHotActionlogUicode];
    [aCoder encodeObject:_cardid forKey:kHotActionlogCardid];
    [aCoder encodeObject:_ext forKey:kHotActionlogExt];
    [aCoder encodeObject:_actCode forKey:kHotActionlogActCode];
    [aCoder encodeObject:_fid forKey:kHotActionlogFid];
    [aCoder encodeObject:_lfid forKey:kHotActionlogLfid];
    [aCoder encodeObject:_oid forKey:kHotActionlogOid];
    [aCoder encodeObject:_actType forKey:kHotActionlogActType];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotActionlog *copy = [[HotActionlog alloc] init];
    
    if (copy) {

        copy.source = [self.source copyWithZone:zone];
        copy.uicode = [self.uicode copyWithZone:zone];
        copy.cardid = [self.cardid copyWithZone:zone];
        copy.ext = [self.ext copyWithZone:zone];
        copy.actCode = [self.actCode copyWithZone:zone];
        copy.fid = [self.fid copyWithZone:zone];
        copy.lfid = [self.lfid copyWithZone:zone];
        copy.oid = [self.oid copyWithZone:zone];
        copy.actType = [self.actType copyWithZone:zone];
    }
    
    return copy;
}


@end
