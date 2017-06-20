//
//  MsgUser.m
//
//  Created by   on 2017/6/20
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MsgUser.h"


NSString *const kMsgUserVerifiedType = @"verified_type";
NSString *const kMsgUserId = @"id";
NSString *const kMsgUserScreenName = @"screen_name";
NSString *const kMsgUserAvatarLarge = @"avatar_large";
NSString *const kMsgUserVerified = @"verified";
NSString *const kMsgUserRemark = @"remark";


@interface MsgUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MsgUser

@synthesize verifiedType = _verifiedType;
@synthesize userIdentifier = _userIdentifier;
@synthesize screenName = _screenName;
@synthesize avatarLarge = _avatarLarge;
@synthesize verified = _verified;
@synthesize remark = _remark;


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
            self.verifiedType = [[self objectOrNilForKey:kMsgUserVerifiedType fromDictionary:dict] doubleValue];
            self.userIdentifier = [[self objectOrNilForKey:kMsgUserId fromDictionary:dict] doubleValue];
            self.screenName = [self objectOrNilForKey:kMsgUserScreenName fromDictionary:dict];
            self.avatarLarge = [self objectOrNilForKey:kMsgUserAvatarLarge fromDictionary:dict];
            self.verified = [[self objectOrNilForKey:kMsgUserVerified fromDictionary:dict] boolValue];
            self.remark = [self objectOrNilForKey:kMsgUserRemark fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.verifiedType] forKey:kMsgUserVerifiedType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdentifier] forKey:kMsgUserId];
    [mutableDict setValue:self.screenName forKey:kMsgUserScreenName];
    [mutableDict setValue:self.avatarLarge forKey:kMsgUserAvatarLarge];
    [mutableDict setValue:[NSNumber numberWithBool:self.verified] forKey:kMsgUserVerified];
    [mutableDict setValue:self.remark forKey:kMsgUserRemark];

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

    self.verifiedType = [aDecoder decodeDoubleForKey:kMsgUserVerifiedType];
    self.userIdentifier = [aDecoder decodeDoubleForKey:kMsgUserId];
    self.screenName = [aDecoder decodeObjectForKey:kMsgUserScreenName];
    self.avatarLarge = [aDecoder decodeObjectForKey:kMsgUserAvatarLarge];
    self.verified = [aDecoder decodeBoolForKey:kMsgUserVerified];
    self.remark = [aDecoder decodeObjectForKey:kMsgUserRemark];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_verifiedType forKey:kMsgUserVerifiedType];
    [aCoder encodeDouble:_userIdentifier forKey:kMsgUserId];
    [aCoder encodeObject:_screenName forKey:kMsgUserScreenName];
    [aCoder encodeObject:_avatarLarge forKey:kMsgUserAvatarLarge];
    [aCoder encodeBool:_verified forKey:kMsgUserVerified];
    [aCoder encodeObject:_remark forKey:kMsgUserRemark];
}

- (id)copyWithZone:(NSZone *)zone
{
    MsgUser *copy = [[MsgUser alloc] init];
    
    if (copy) {

        copy.verifiedType = self.verifiedType;
        copy.userIdentifier = self.userIdentifier;
        copy.screenName = [self.screenName copyWithZone:zone];
        copy.avatarLarge = [self.avatarLarge copyWithZone:zone];
        copy.verified = self.verified;
        copy.remark = [self.remark copyWithZone:zone];
    }
    
    return copy;
}


@end
