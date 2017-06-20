//
//  CmtCardGroup.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CmtCardGroup.h"
#import "CmtCard.h"
#import "CmtUser.h"


NSString *const kCmtCardGroupSource = @"source";
NSString *const kCmtCardGroupId = @"id";
NSString *const kCmtCardGroupCard = @"card";
NSString *const kCmtCardGroupReplyId = @"reply_id";
NSString *const kCmtCardGroupCreatedAt = @"created_at";
NSString *const kCmtCardGroupText = @"text";
NSString *const kCmtCardGroupReplyText = @"reply_text";
NSString *const kCmtCardGroupModType = @"mod_type";
NSString *const kCmtCardGroupType = @"type";
NSString *const kCmtCardGroupUser = @"user";


@interface CmtCardGroup ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CmtCardGroup

@synthesize source = _source;
@synthesize cardGroupIdentifier = _cardGroupIdentifier;
@synthesize card = _card;
@synthesize replyId = _replyId;
@synthesize createdAt = _createdAt;
@synthesize text = _text;
@synthesize replyText = _replyText;
@synthesize modType = _modType;
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
            self.source = [self objectOrNilForKey:kCmtCardGroupSource fromDictionary:dict];
            self.cardGroupIdentifier = [[self objectOrNilForKey:kCmtCardGroupId fromDictionary:dict] doubleValue];
            self.card = [CmtCard modelObjectWithDictionary:[dict objectForKey:kCmtCardGroupCard]];
            self.replyId = [[self objectOrNilForKey:kCmtCardGroupReplyId fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kCmtCardGroupCreatedAt fromDictionary:dict];
            self.text = [self objectOrNilForKey:kCmtCardGroupText fromDictionary:dict];
            self.replyText = [self objectOrNilForKey:kCmtCardGroupReplyText fromDictionary:dict];
            self.modType = [self objectOrNilForKey:kCmtCardGroupModType fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kCmtCardGroupType fromDictionary:dict] doubleValue];
            self.user = [CmtUser modelObjectWithDictionary:[dict objectForKey:kCmtCardGroupUser]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.source forKey:kCmtCardGroupSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cardGroupIdentifier] forKey:kCmtCardGroupId];
    [mutableDict setValue:[self.card dictionaryRepresentation] forKey:kCmtCardGroupCard];
    [mutableDict setValue:[NSNumber numberWithDouble:self.replyId] forKey:kCmtCardGroupReplyId];
    [mutableDict setValue:self.createdAt forKey:kCmtCardGroupCreatedAt];
    [mutableDict setValue:self.text forKey:kCmtCardGroupText];
    [mutableDict setValue:self.replyText forKey:kCmtCardGroupReplyText];
    [mutableDict setValue:self.modType forKey:kCmtCardGroupModType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kCmtCardGroupType];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kCmtCardGroupUser];

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

    self.source = [aDecoder decodeObjectForKey:kCmtCardGroupSource];
    self.cardGroupIdentifier = [aDecoder decodeDoubleForKey:kCmtCardGroupId];
    self.card = [aDecoder decodeObjectForKey:kCmtCardGroupCard];
    self.replyId = [aDecoder decodeDoubleForKey:kCmtCardGroupReplyId];
    self.createdAt = [aDecoder decodeObjectForKey:kCmtCardGroupCreatedAt];
    self.text = [aDecoder decodeObjectForKey:kCmtCardGroupText];
    self.replyText = [aDecoder decodeObjectForKey:kCmtCardGroupReplyText];
    self.modType = [aDecoder decodeObjectForKey:kCmtCardGroupModType];
    self.type = [aDecoder decodeDoubleForKey:kCmtCardGroupType];
    self.user = [aDecoder decodeObjectForKey:kCmtCardGroupUser];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_source forKey:kCmtCardGroupSource];
    [aCoder encodeDouble:_cardGroupIdentifier forKey:kCmtCardGroupId];
    [aCoder encodeObject:_card forKey:kCmtCardGroupCard];
    [aCoder encodeDouble:_replyId forKey:kCmtCardGroupReplyId];
    [aCoder encodeObject:_createdAt forKey:kCmtCardGroupCreatedAt];
    [aCoder encodeObject:_text forKey:kCmtCardGroupText];
    [aCoder encodeObject:_replyText forKey:kCmtCardGroupReplyText];
    [aCoder encodeObject:_modType forKey:kCmtCardGroupModType];
    [aCoder encodeDouble:_type forKey:kCmtCardGroupType];
    [aCoder encodeObject:_user forKey:kCmtCardGroupUser];
}

- (id)copyWithZone:(NSZone *)zone
{
    CmtCardGroup *copy = [[CmtCardGroup alloc] init];
    
    if (copy) {

        copy.source = [self.source copyWithZone:zone];
        copy.cardGroupIdentifier = self.cardGroupIdentifier;
        copy.card = [self.card copyWithZone:zone];
        copy.replyId = self.replyId;
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.replyText = [self.replyText copyWithZone:zone];
        copy.modType = [self.modType copyWithZone:zone];
        copy.type = self.type;
        copy.user = [self.user copyWithZone:zone];
    }
    
    return copy;
}


@end
