//
//  CmtUser.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "CmtUser.h"
#import "CmtH5icon.h"


NSString *const kCmtUserMbtype = @"mbtype";
NSString *const kCmtUserH5icon = @"h5icon";
NSString *const kCmtUserProfileImageUrl = @"profile_image_url";
NSString *const kCmtUserId = @"id";
NSString *const kCmtUserProfileUrl = @"profile_url";
NSString *const kCmtUserVerified = @"verified";
NSString *const kCmtUserScreenName = @"screen_name";
NSString *const kCmtUserVerifiedType = @"verified_type";


@interface CmtUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation CmtUser

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
            self.mbtype = [[self objectOrNilForKey:kCmtUserMbtype fromDictionary:dict] doubleValue];
            self.h5icon = [CmtH5icon modelObjectWithDictionary:[dict objectForKey:kCmtUserH5icon]];
            self.profileImageUrl = [self objectOrNilForKey:kCmtUserProfileImageUrl fromDictionary:dict];
            self.userIdentifier = [[self objectOrNilForKey:kCmtUserId fromDictionary:dict] doubleValue];
            self.profileUrl = [self objectOrNilForKey:kCmtUserProfileUrl fromDictionary:dict];
            self.verified = [[self objectOrNilForKey:kCmtUserVerified fromDictionary:dict] boolValue];
            self.screenName = [self objectOrNilForKey:kCmtUserScreenName fromDictionary:dict];
            self.verifiedType = [[self objectOrNilForKey:kCmtUserVerifiedType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mbtype] forKey:kCmtUserMbtype];
    [mutableDict setValue:[self.h5icon dictionaryRepresentation] forKey:kCmtUserH5icon];
    [mutableDict setValue:self.profileImageUrl forKey:kCmtUserProfileImageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdentifier] forKey:kCmtUserId];
    [mutableDict setValue:self.profileUrl forKey:kCmtUserProfileUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.verified] forKey:kCmtUserVerified];
    [mutableDict setValue:self.screenName forKey:kCmtUserScreenName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.verifiedType] forKey:kCmtUserVerifiedType];

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

    self.mbtype = [aDecoder decodeDoubleForKey:kCmtUserMbtype];
    self.h5icon = [aDecoder decodeObjectForKey:kCmtUserH5icon];
    self.profileImageUrl = [aDecoder decodeObjectForKey:kCmtUserProfileImageUrl];
    self.userIdentifier = [aDecoder decodeDoubleForKey:kCmtUserId];
    self.profileUrl = [aDecoder decodeObjectForKey:kCmtUserProfileUrl];
    self.verified = [aDecoder decodeBoolForKey:kCmtUserVerified];
    self.screenName = [aDecoder decodeObjectForKey:kCmtUserScreenName];
    self.verifiedType = [aDecoder decodeDoubleForKey:kCmtUserVerifiedType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_mbtype forKey:kCmtUserMbtype];
    [aCoder encodeObject:_h5icon forKey:kCmtUserH5icon];
    [aCoder encodeObject:_profileImageUrl forKey:kCmtUserProfileImageUrl];
    [aCoder encodeDouble:_userIdentifier forKey:kCmtUserId];
    [aCoder encodeObject:_profileUrl forKey:kCmtUserProfileUrl];
    [aCoder encodeBool:_verified forKey:kCmtUserVerified];
    [aCoder encodeObject:_screenName forKey:kCmtUserScreenName];
    [aCoder encodeDouble:_verifiedType forKey:kCmtUserVerifiedType];
}

- (id)copyWithZone:(NSZone *)zone
{
    CmtUser *copy = [[CmtUser alloc] init];
    
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
