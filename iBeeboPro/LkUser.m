//
//  LkUser.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "LkUser.h"
#import "LkH5icon.h"


NSString *const kLkUserMbtype = @"mbtype";
NSString *const kLkUserH5icon = @"h5icon";
NSString *const kLkUserProfileImageUrl = @"profile_image_url";
NSString *const kLkUserId = @"id";
NSString *const kLkUserProfileUrl = @"profile_url";
NSString *const kLkUserVerified = @"verified";
NSString *const kLkUserScreenName = @"screen_name";
NSString *const kLkUserVerifiedType = @"verified_type";


@interface LkUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LkUser

@synthesize mbtype = _mbtype;
@synthesize h5icon = _h5icon;
@synthesize profileImageUrl = _profileImageUrl;
@synthesize userIdentifier = _userIdentifier;
@synthesize profileUrl = _profileUrl;
@synthesize verified = _verified;
@synthesize screenName = _screenName;
@synthesize verifiedType = _verifiedType;


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
            self.mbtype = [[self objectOrNilForKey:kLkUserMbtype fromDictionary:dict] doubleValue];
            self.h5icon = [LkH5icon modelObjectWithDictionary:[dict objectForKey:kLkUserH5icon]];
            self.profileImageUrl = [self objectOrNilForKey:kLkUserProfileImageUrl fromDictionary:dict];
            self.userIdentifier = [[self objectOrNilForKey:kLkUserId fromDictionary:dict] doubleValue];
            self.profileUrl = [self objectOrNilForKey:kLkUserProfileUrl fromDictionary:dict];
            self.verified = [[self objectOrNilForKey:kLkUserVerified fromDictionary:dict] boolValue];
            self.screenName = [self objectOrNilForKey:kLkUserScreenName fromDictionary:dict];
            self.verifiedType = [[self objectOrNilForKey:kLkUserVerifiedType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mbtype] forKey:kLkUserMbtype];
    [mutableDict setValue:[self.h5icon dictionaryRepresentation] forKey:kLkUserH5icon];
    [mutableDict setValue:self.profileImageUrl forKey:kLkUserProfileImageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdentifier] forKey:kLkUserId];
    [mutableDict setValue:self.profileUrl forKey:kLkUserProfileUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.verified] forKey:kLkUserVerified];
    [mutableDict setValue:self.screenName forKey:kLkUserScreenName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.verifiedType] forKey:kLkUserVerifiedType];

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

    self.mbtype = [aDecoder decodeDoubleForKey:kLkUserMbtype];
    self.h5icon = [aDecoder decodeObjectForKey:kLkUserH5icon];
    self.profileImageUrl = [aDecoder decodeObjectForKey:kLkUserProfileImageUrl];
    self.userIdentifier = [aDecoder decodeDoubleForKey:kLkUserId];
    self.profileUrl = [aDecoder decodeObjectForKey:kLkUserProfileUrl];
    self.verified = [aDecoder decodeBoolForKey:kLkUserVerified];
    self.screenName = [aDecoder decodeObjectForKey:kLkUserScreenName];
    self.verifiedType = [aDecoder decodeDoubleForKey:kLkUserVerifiedType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_mbtype forKey:kLkUserMbtype];
    [aCoder encodeObject:_h5icon forKey:kLkUserH5icon];
    [aCoder encodeObject:_profileImageUrl forKey:kLkUserProfileImageUrl];
    [aCoder encodeDouble:_userIdentifier forKey:kLkUserId];
    [aCoder encodeObject:_profileUrl forKey:kLkUserProfileUrl];
    [aCoder encodeBool:_verified forKey:kLkUserVerified];
    [aCoder encodeObject:_screenName forKey:kLkUserScreenName];
    [aCoder encodeDouble:_verifiedType forKey:kLkUserVerifiedType];
}

- (id)copyWithZone:(NSZone *)zone
{
    LkUser *copy = [[LkUser alloc] init];
    
    if (copy) {

        copy.mbtype = self.mbtype;
        copy.h5icon = [self.h5icon copyWithZone:zone];
        copy.profileImageUrl = [self.profileImageUrl copyWithZone:zone];
        copy.userIdentifier = self.userIdentifier;
        copy.profileUrl = [self.profileUrl copyWithZone:zone];
        copy.verified = self.verified;
        copy.screenName = [self.screenName copyWithZone:zone];
        copy.verifiedType = self.verifiedType;
    }
    
    return copy;
}


@end
