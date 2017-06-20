//
//  LkCardGroup.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LkCardGroup.h"
#import "LkCard.h"
#import "LkUser.h"


NSString *const kLkCardGroupId = @"id";
NSString *const kLkCardGroupSourceAllowclick = @"source_allowclick";
NSString *const kLkCardGroupCreatedAt = @"created_at";
NSString *const kLkCardGroupSourceType = @"source_type";
NSString *const kLkCardGroupAttitudeType = @"attitude_type";
NSString *const kLkCardGroupSource = @"source";
NSString *const kLkCardGroupAttitude = @"attitude";
NSString *const kLkCardGroupType = @"type";
NSString *const kLkCardGroupCard = @"card";
NSString *const kLkCardGroupText = @"text";
NSString *const kLkCardGroupUser = @"user";
NSString *const kLkCardGroupModType = @"mod_type";
NSString *const kLkCardGroupLastAttitude = @"last_attitude";


@interface LkCardGroup ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LkCardGroup

@synthesize cardGroupIdentifier = _cardGroupIdentifier;
@synthesize sourceAllowclick = _sourceAllowclick;
@synthesize createdAt = _createdAt;
@synthesize sourceType = _sourceType;
@synthesize attitudeType = _attitudeType;
@synthesize source = _source;
@synthesize attitude = _attitude;
@synthesize type = _type;
@synthesize card = _card;
@synthesize text = _text;
@synthesize user = _user;
@synthesize modType = _modType;
@synthesize lastAttitude = _lastAttitude;


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
            self.cardGroupIdentifier = [[self objectOrNilForKey:kLkCardGroupId fromDictionary:dict] doubleValue];
            self.sourceAllowclick = [[self objectOrNilForKey:kLkCardGroupSourceAllowclick fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kLkCardGroupCreatedAt fromDictionary:dict];
            self.sourceType = [[self objectOrNilForKey:kLkCardGroupSourceType fromDictionary:dict] doubleValue];
            self.attitudeType = [[self objectOrNilForKey:kLkCardGroupAttitudeType fromDictionary:dict] doubleValue];
            self.source = [self objectOrNilForKey:kLkCardGroupSource fromDictionary:dict];
            self.attitude = [self objectOrNilForKey:kLkCardGroupAttitude fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kLkCardGroupType fromDictionary:dict] doubleValue];
            self.card = [LkCard modelObjectWithDictionary:[dict objectForKey:kLkCardGroupCard]];
            self.text = [self objectOrNilForKey:kLkCardGroupText fromDictionary:dict];
            self.user = [LkUser modelObjectWithDictionary:[dict objectForKey:kLkCardGroupUser]];
            self.modType = [self objectOrNilForKey:kLkCardGroupModType fromDictionary:dict];
            self.lastAttitude = [self objectOrNilForKey:kLkCardGroupLastAttitude fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cardGroupIdentifier] forKey:kLkCardGroupId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sourceAllowclick] forKey:kLkCardGroupSourceAllowclick];
    [mutableDict setValue:self.createdAt forKey:kLkCardGroupCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sourceType] forKey:kLkCardGroupSourceType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.attitudeType] forKey:kLkCardGroupAttitudeType];
    [mutableDict setValue:self.source forKey:kLkCardGroupSource];
    [mutableDict setValue:self.attitude forKey:kLkCardGroupAttitude];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kLkCardGroupType];
    [mutableDict setValue:[self.card dictionaryRepresentation] forKey:kLkCardGroupCard];
    [mutableDict setValue:self.text forKey:kLkCardGroupText];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kLkCardGroupUser];
    [mutableDict setValue:self.modType forKey:kLkCardGroupModType];
    [mutableDict setValue:self.lastAttitude forKey:kLkCardGroupLastAttitude];

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

    self.cardGroupIdentifier = [aDecoder decodeDoubleForKey:kLkCardGroupId];
    self.sourceAllowclick = [aDecoder decodeDoubleForKey:kLkCardGroupSourceAllowclick];
    self.createdAt = [aDecoder decodeObjectForKey:kLkCardGroupCreatedAt];
    self.sourceType = [aDecoder decodeDoubleForKey:kLkCardGroupSourceType];
    self.attitudeType = [aDecoder decodeDoubleForKey:kLkCardGroupAttitudeType];
    self.source = [aDecoder decodeObjectForKey:kLkCardGroupSource];
    self.attitude = [aDecoder decodeObjectForKey:kLkCardGroupAttitude];
    self.type = [aDecoder decodeDoubleForKey:kLkCardGroupType];
    self.card = [aDecoder decodeObjectForKey:kLkCardGroupCard];
    self.text = [aDecoder decodeObjectForKey:kLkCardGroupText];
    self.user = [aDecoder decodeObjectForKey:kLkCardGroupUser];
    self.modType = [aDecoder decodeObjectForKey:kLkCardGroupModType];
    self.lastAttitude = [aDecoder decodeObjectForKey:kLkCardGroupLastAttitude];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_cardGroupIdentifier forKey:kLkCardGroupId];
    [aCoder encodeDouble:_sourceAllowclick forKey:kLkCardGroupSourceAllowclick];
    [aCoder encodeObject:_createdAt forKey:kLkCardGroupCreatedAt];
    [aCoder encodeDouble:_sourceType forKey:kLkCardGroupSourceType];
    [aCoder encodeDouble:_attitudeType forKey:kLkCardGroupAttitudeType];
    [aCoder encodeObject:_source forKey:kLkCardGroupSource];
    [aCoder encodeObject:_attitude forKey:kLkCardGroupAttitude];
    [aCoder encodeDouble:_type forKey:kLkCardGroupType];
    [aCoder encodeObject:_card forKey:kLkCardGroupCard];
    [aCoder encodeObject:_text forKey:kLkCardGroupText];
    [aCoder encodeObject:_user forKey:kLkCardGroupUser];
    [aCoder encodeObject:_modType forKey:kLkCardGroupModType];
    [aCoder encodeObject:_lastAttitude forKey:kLkCardGroupLastAttitude];
}

- (id)copyWithZone:(NSZone *)zone
{
    LkCardGroup *copy = [[LkCardGroup alloc] init];
    
    if (copy) {

        copy.cardGroupIdentifier = self.cardGroupIdentifier;
        copy.sourceAllowclick = self.sourceAllowclick;
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.sourceType = self.sourceType;
        copy.attitudeType = self.attitudeType;
        copy.source = [self.source copyWithZone:zone];
        copy.attitude = [self.attitude copyWithZone:zone];
        copy.type = self.type;
        copy.card = [self.card copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.user = [self.user copyWithZone:zone];
        copy.modType = [self.modType copyWithZone:zone];
        copy.lastAttitude = [self.lastAttitude copyWithZone:zone];
    }
    
    return copy;
}


@end
