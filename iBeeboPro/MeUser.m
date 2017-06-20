//
//  MeUser.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MeUser.h"
#import "MeBadge.h"
#import "MeH5icon.h"


NSString *const kMeUserTa = @"ta";
NSString *const kMeUserUrank = @"urank";
NSString *const kMeUserBadge = @"badge";
NSString *const kMeUserFollowMe = @"follow_me";
NSString *const kMeUserGenderIcon = @"genderIcon";
NSString *const kMeUserVerifiedType = @"verified_type";
NSString *const kMeUserVerifiedReason = @"verified_reason";
NSString *const kMeUserMbtype = @"mbtype";
NSString *const kMeUserFansNum = @"fansNum";
NSString *const kMeUserProfileUrl = @"profile_url";
NSString *const kMeUserVerified = @"verified";
NSString *const kMeUserId = @"id";
NSString *const kMeUserH5icon = @"h5icon";
NSString *const kMeUserName = @"name";
NSString *const kMeUserScreenName = @"screen_name";
NSString *const kMeUserAvatarHd = @"avatar_hd";
NSString *const kMeUserProfileImageUrl = @"profile_image_url";
NSString *const kMeUserFollowing = @"following";
NSString *const kMeUserAttNum = @"attNum";
NSString *const kMeUserNativePlace = @"nativePlace";
NSString *const kMeUserMblogNum = @"mblogNum";
NSString *const kMeUserPtype = @"ptype";
NSString *const kMeUserCreatedAt = @"created_at";
NSString *const kMeUserFavouritesCount = @"favourites_count";
NSString *const kMeUserMbrank = @"mbrank";
NSString *const kMeUserDescription = @"description";


@interface MeUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MeUser

@synthesize ta = _ta;
@synthesize urank = _urank;
@synthesize badge = _badge;
@synthesize followMe = _followMe;
@synthesize genderIcon = _genderIcon;
@synthesize verifiedType = _verifiedType;
@synthesize verifiedReason = _verifiedReason;
@synthesize mbtype = _mbtype;
@synthesize fansNum = _fansNum;
@synthesize profileUrl = _profileUrl;
@synthesize verified = _verified;
@synthesize userIdentifier = _userIdentifier;
@synthesize h5icon = _h5icon;
@synthesize name = _name;
@synthesize screenName = _screenName;
@synthesize avatarHd = _avatarHd;
@synthesize profileImageUrl = _profileImageUrl;
@synthesize following = _following;
@synthesize attNum = _attNum;
@synthesize nativePlace = _nativePlace;
@synthesize mblogNum = _mblogNum;
@synthesize ptype = _ptype;
@synthesize createdAt = _createdAt;
@synthesize favouritesCount = _favouritesCount;
@synthesize mbrank = _mbrank;
@synthesize userDescription = _userDescription;


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
            self.ta = [self objectOrNilForKey:kMeUserTa fromDictionary:dict];
            self.urank = [[self objectOrNilForKey:kMeUserUrank fromDictionary:dict] doubleValue];
            self.badge = [MeBadge modelObjectWithDictionary:[dict objectForKey:kMeUserBadge]];
            self.followMe = [[self objectOrNilForKey:kMeUserFollowMe fromDictionary:dict] boolValue];
            self.genderIcon = [self objectOrNilForKey:kMeUserGenderIcon fromDictionary:dict];
            self.verifiedType = [[self objectOrNilForKey:kMeUserVerifiedType fromDictionary:dict] doubleValue];
            self.verifiedReason = [self objectOrNilForKey:kMeUserVerifiedReason fromDictionary:dict];
            self.mbtype = [[self objectOrNilForKey:kMeUserMbtype fromDictionary:dict] doubleValue];
            self.fansNum = [[self objectOrNilForKey:kMeUserFansNum fromDictionary:dict] doubleValue];
            self.profileUrl = [self objectOrNilForKey:kMeUserProfileUrl fromDictionary:dict];
            self.verified = [[self objectOrNilForKey:kMeUserVerified fromDictionary:dict] boolValue];
            self.userIdentifier = [self objectOrNilForKey:kMeUserId fromDictionary:dict];
            self.h5icon = [MeH5icon modelObjectWithDictionary:[dict objectForKey:kMeUserH5icon]];
            self.name = [self objectOrNilForKey:kMeUserName fromDictionary:dict];
            self.screenName = [self objectOrNilForKey:kMeUserScreenName fromDictionary:dict];
            self.avatarHd = [self objectOrNilForKey:kMeUserAvatarHd fromDictionary:dict];
            self.profileImageUrl = [self objectOrNilForKey:kMeUserProfileImageUrl fromDictionary:dict];
            self.following = [[self objectOrNilForKey:kMeUserFollowing fromDictionary:dict] boolValue];
            self.attNum = [[self objectOrNilForKey:kMeUserAttNum fromDictionary:dict] doubleValue];
            self.nativePlace = [self objectOrNilForKey:kMeUserNativePlace fromDictionary:dict];
            self.mblogNum = [[self objectOrNilForKey:kMeUserMblogNum fromDictionary:dict] doubleValue];
            self.ptype = [[self objectOrNilForKey:kMeUserPtype fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kMeUserCreatedAt fromDictionary:dict];
            self.favouritesCount = [[self objectOrNilForKey:kMeUserFavouritesCount fromDictionary:dict] doubleValue];
            self.mbrank = [[self objectOrNilForKey:kMeUserMbrank fromDictionary:dict] doubleValue];
            self.userDescription = [self objectOrNilForKey:kMeUserDescription fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.ta forKey:kMeUserTa];
    [mutableDict setValue:[NSNumber numberWithDouble:self.urank] forKey:kMeUserUrank];
    [mutableDict setValue:[self.badge dictionaryRepresentation] forKey:kMeUserBadge];
    [mutableDict setValue:[NSNumber numberWithBool:self.followMe] forKey:kMeUserFollowMe];
    [mutableDict setValue:self.genderIcon forKey:kMeUserGenderIcon];
    [mutableDict setValue:[NSNumber numberWithDouble:self.verifiedType] forKey:kMeUserVerifiedType];
    [mutableDict setValue:self.verifiedReason forKey:kMeUserVerifiedReason];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mbtype] forKey:kMeUserMbtype];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fansNum] forKey:kMeUserFansNum];
    [mutableDict setValue:self.profileUrl forKey:kMeUserProfileUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.verified] forKey:kMeUserVerified];
    [mutableDict setValue:self.userIdentifier forKey:kMeUserId];
    [mutableDict setValue:[self.h5icon dictionaryRepresentation] forKey:kMeUserH5icon];
    [mutableDict setValue:self.name forKey:kMeUserName];
    [mutableDict setValue:self.screenName forKey:kMeUserScreenName];
    [mutableDict setValue:self.avatarHd forKey:kMeUserAvatarHd];
    [mutableDict setValue:self.profileImageUrl forKey:kMeUserProfileImageUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.following] forKey:kMeUserFollowing];
    [mutableDict setValue:[NSNumber numberWithDouble:self.attNum] forKey:kMeUserAttNum];
    [mutableDict setValue:self.nativePlace forKey:kMeUserNativePlace];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mblogNum] forKey:kMeUserMblogNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ptype] forKey:kMeUserPtype];
    [mutableDict setValue:self.createdAt forKey:kMeUserCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favouritesCount] forKey:kMeUserFavouritesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mbrank] forKey:kMeUserMbrank];
    [mutableDict setValue:self.userDescription forKey:kMeUserDescription];

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

    self.ta = [aDecoder decodeObjectForKey:kMeUserTa];
    self.urank = [aDecoder decodeDoubleForKey:kMeUserUrank];
    self.badge = [aDecoder decodeObjectForKey:kMeUserBadge];
    self.followMe = [aDecoder decodeBoolForKey:kMeUserFollowMe];
    self.genderIcon = [aDecoder decodeObjectForKey:kMeUserGenderIcon];
    self.verifiedType = [aDecoder decodeDoubleForKey:kMeUserVerifiedType];
    self.verifiedReason = [aDecoder decodeObjectForKey:kMeUserVerifiedReason];
    self.mbtype = [aDecoder decodeDoubleForKey:kMeUserMbtype];
    self.fansNum = [aDecoder decodeDoubleForKey:kMeUserFansNum];
    self.profileUrl = [aDecoder decodeObjectForKey:kMeUserProfileUrl];
    self.verified = [aDecoder decodeBoolForKey:kMeUserVerified];
    self.userIdentifier = [aDecoder decodeObjectForKey:kMeUserId];
    self.h5icon = [aDecoder decodeObjectForKey:kMeUserH5icon];
    self.name = [aDecoder decodeObjectForKey:kMeUserName];
    self.screenName = [aDecoder decodeObjectForKey:kMeUserScreenName];
    self.avatarHd = [aDecoder decodeObjectForKey:kMeUserAvatarHd];
    self.profileImageUrl = [aDecoder decodeObjectForKey:kMeUserProfileImageUrl];
    self.following = [aDecoder decodeBoolForKey:kMeUserFollowing];
    self.attNum = [aDecoder decodeDoubleForKey:kMeUserAttNum];
    self.nativePlace = [aDecoder decodeObjectForKey:kMeUserNativePlace];
    self.mblogNum = [aDecoder decodeDoubleForKey:kMeUserMblogNum];
    self.ptype = [aDecoder decodeDoubleForKey:kMeUserPtype];
    self.createdAt = [aDecoder decodeObjectForKey:kMeUserCreatedAt];
    self.favouritesCount = [aDecoder decodeDoubleForKey:kMeUserFavouritesCount];
    self.mbrank = [aDecoder decodeDoubleForKey:kMeUserMbrank];
    self.userDescription = [aDecoder decodeObjectForKey:kMeUserDescription];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_ta forKey:kMeUserTa];
    [aCoder encodeDouble:_urank forKey:kMeUserUrank];
    [aCoder encodeObject:_badge forKey:kMeUserBadge];
    [aCoder encodeBool:_followMe forKey:kMeUserFollowMe];
    [aCoder encodeObject:_genderIcon forKey:kMeUserGenderIcon];
    [aCoder encodeDouble:_verifiedType forKey:kMeUserVerifiedType];
    [aCoder encodeObject:_verifiedReason forKey:kMeUserVerifiedReason];
    [aCoder encodeDouble:_mbtype forKey:kMeUserMbtype];
    [aCoder encodeDouble:_fansNum forKey:kMeUserFansNum];
    [aCoder encodeObject:_profileUrl forKey:kMeUserProfileUrl];
    [aCoder encodeBool:_verified forKey:kMeUserVerified];
    [aCoder encodeObject:_userIdentifier forKey:kMeUserId];
    [aCoder encodeObject:_h5icon forKey:kMeUserH5icon];
    [aCoder encodeObject:_name forKey:kMeUserName];
    [aCoder encodeObject:_screenName forKey:kMeUserScreenName];
    [aCoder encodeObject:_avatarHd forKey:kMeUserAvatarHd];
    [aCoder encodeObject:_profileImageUrl forKey:kMeUserProfileImageUrl];
    [aCoder encodeBool:_following forKey:kMeUserFollowing];
    [aCoder encodeDouble:_attNum forKey:kMeUserAttNum];
    [aCoder encodeObject:_nativePlace forKey:kMeUserNativePlace];
    [aCoder encodeDouble:_mblogNum forKey:kMeUserMblogNum];
    [aCoder encodeDouble:_ptype forKey:kMeUserPtype];
    [aCoder encodeObject:_createdAt forKey:kMeUserCreatedAt];
    [aCoder encodeDouble:_favouritesCount forKey:kMeUserFavouritesCount];
    [aCoder encodeDouble:_mbrank forKey:kMeUserMbrank];
    [aCoder encodeObject:_userDescription forKey:kMeUserDescription];
}

- (id)copyWithZone:(NSZone *)zone
{
    MeUser *copy = [[MeUser alloc] init];
    
    if (copy) {

        copy.ta = [self.ta copyWithZone:zone];
        copy.urank = self.urank;
        copy.badge = [self.badge copyWithZone:zone];
        copy.followMe = self.followMe;
        copy.genderIcon = [self.genderIcon copyWithZone:zone];
        copy.verifiedType = self.verifiedType;
        copy.verifiedReason = [self.verifiedReason copyWithZone:zone];
        copy.mbtype = self.mbtype;
        copy.fansNum = self.fansNum;
        copy.profileUrl = [self.profileUrl copyWithZone:zone];
        copy.verified = self.verified;
        copy.userIdentifier = [self.userIdentifier copyWithZone:zone];
        copy.h5icon = [self.h5icon copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.screenName = [self.screenName copyWithZone:zone];
        copy.avatarHd = [self.avatarHd copyWithZone:zone];
        copy.profileImageUrl = [self.profileImageUrl copyWithZone:zone];
        copy.following = self.following;
        copy.attNum = self.attNum;
        copy.nativePlace = [self.nativePlace copyWithZone:zone];
        copy.mblogNum = self.mblogNum;
        copy.ptype = self.ptype;
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.favouritesCount = self.favouritesCount;
        copy.mbrank = self.mbrank;
        copy.userDescription = [self.userDescription copyWithZone:zone];
    }
    
    return copy;
}


@end
