//
//  MsgCardGroup.m
//
//  Created by   on 2017/6/20
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MsgCardGroup.h"
#import "MsgUser.h"


NSString *const kMsgCardGroupUnread = @"unread";
NSString *const kMsgCardGroupScheme = @"scheme";
NSString *const kMsgCardGroupModType = @"mod_type";
NSString *const kMsgCardGroupDisplayArrow = @"display_arrow";
NSString *const kMsgCardGroupTitle = @"title";
NSString *const kMsgCardGroupCreatedAt = @"created_at";
NSString *const kMsgCardGroupText = @"text";
NSString *const kMsgCardGroupType = @"type";
NSString *const kMsgCardGroupUser = @"user";


@interface MsgCardGroup ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MsgCardGroup

@synthesize unread = _unread;
@synthesize scheme = _scheme;
@synthesize modType = _modType;
@synthesize displayArrow = _displayArrow;
@synthesize title = _title;
@synthesize createdAt = _createdAt;
@synthesize text = _text;
@synthesize type = _type;
@synthesize user = _user;


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
            self.unread = [[self objectOrNilForKey:kMsgCardGroupUnread fromDictionary:dict] doubleValue];
            self.scheme = [self objectOrNilForKey:kMsgCardGroupScheme fromDictionary:dict];
            self.modType = [self objectOrNilForKey:kMsgCardGroupModType fromDictionary:dict];
            self.displayArrow = [[self objectOrNilForKey:kMsgCardGroupDisplayArrow fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kMsgCardGroupTitle fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kMsgCardGroupCreatedAt fromDictionary:dict];
            self.text = [self objectOrNilForKey:kMsgCardGroupText fromDictionary:dict];
            self.type = [self objectOrNilForKey:kMsgCardGroupType fromDictionary:dict];
            self.user = [MsgUser modelObjectWithDictionary:[dict objectForKey:kMsgCardGroupUser]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.unread] forKey:kMsgCardGroupUnread];
    [mutableDict setValue:self.scheme forKey:kMsgCardGroupScheme];
    [mutableDict setValue:self.modType forKey:kMsgCardGroupModType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.displayArrow] forKey:kMsgCardGroupDisplayArrow];
    [mutableDict setValue:self.title forKey:kMsgCardGroupTitle];
    [mutableDict setValue:self.createdAt forKey:kMsgCardGroupCreatedAt];
    [mutableDict setValue:self.text forKey:kMsgCardGroupText];
    [mutableDict setValue:self.type forKey:kMsgCardGroupType];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kMsgCardGroupUser];

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

    self.unread = [aDecoder decodeDoubleForKey:kMsgCardGroupUnread];
    self.scheme = [aDecoder decodeObjectForKey:kMsgCardGroupScheme];
    self.modType = [aDecoder decodeObjectForKey:kMsgCardGroupModType];
    self.displayArrow = [aDecoder decodeDoubleForKey:kMsgCardGroupDisplayArrow];
    self.title = [aDecoder decodeObjectForKey:kMsgCardGroupTitle];
    self.createdAt = [aDecoder decodeObjectForKey:kMsgCardGroupCreatedAt];
    self.text = [aDecoder decodeObjectForKey:kMsgCardGroupText];
    self.type = [aDecoder decodeObjectForKey:kMsgCardGroupType];
    self.user = [aDecoder decodeObjectForKey:kMsgCardGroupUser];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_unread forKey:kMsgCardGroupUnread];
    [aCoder encodeObject:_scheme forKey:kMsgCardGroupScheme];
    [aCoder encodeObject:_modType forKey:kMsgCardGroupModType];
    [aCoder encodeDouble:_displayArrow forKey:kMsgCardGroupDisplayArrow];
    [aCoder encodeObject:_title forKey:kMsgCardGroupTitle];
    [aCoder encodeObject:_createdAt forKey:kMsgCardGroupCreatedAt];
    [aCoder encodeObject:_text forKey:kMsgCardGroupText];
    [aCoder encodeObject:_type forKey:kMsgCardGroupType];
    [aCoder encodeObject:_user forKey:kMsgCardGroupUser];
}

- (id)copyWithZone:(NSZone *)zone
{
    MsgCardGroup *copy = [[MsgCardGroup alloc] init];
    
    if (copy) {

        copy.unread = self.unread;
        copy.scheme = [self.scheme copyWithZone:zone];
        copy.modType = [self.modType copyWithZone:zone];
        copy.displayArrow = self.displayArrow;
        copy.title = [self.title copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.user = [self.user copyWithZone:zone];
    }
    
    return copy;
}


@end
