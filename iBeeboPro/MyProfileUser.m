//
//  MyProfileUser.m
//
//  Created by   on 2017/7/16
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "MyProfileUser.h"
#import "MyProfileBadge.h"
#import "MyProfileH5icon.h"


NSString *const kMyProfileUserDescription = @"description";
NSString *const kMyProfileUserUrank = @"urank";
NSString *const kMyProfileUserBadge = @"badge";
NSString *const kMyProfileUserFollowMe = @"follow_me";
NSString *const kMyProfileUserGenderIcon = @"genderIcon";
NSString *const kMyProfileUserVerifiedType = @"verified_type";
NSString *const kMyProfileUserVerifiedReason = @"verified_reason";
NSString *const kMyProfileUserScreenName = @"screen_name";
NSString *const kMyProfileUserFansNum = @"fansNum";
NSString *const kMyProfileUserProfileUrl = @"profile_url";
NSString *const kMyProfileUserVerified = @"verified";
NSString *const kMyProfileUserId = @"id";
NSString *const kMyProfileUserH5icon = @"h5icon";
NSString *const kMyProfileUserMbtype = @"mbtype";
NSString *const kMyProfileUserName = @"name";
NSString *const kMyProfileUserAvatarHd = @"avatar_hd";
NSString *const kMyProfileUserProfileImageUrl = @"profile_image_url";
NSString *const kMyProfileUserFollowing = @"following";
NSString *const kMyProfileUserAttNum = @"attNum";
NSString *const kMyProfileUserNativePlace = @"nativePlace";
NSString *const kMyProfileUserMblogNum = @"mblogNum";
NSString *const kMyProfileUserPtype = @"ptype";
NSString *const kMyProfileUserCreatedAt = @"created_at";
NSString *const kMyProfileUserFavouritesCount = @"favourites_count";
NSString *const kMyProfileUserTa = @"ta";
NSString *const kMyProfileUserMbrank = @"mbrank";


@interface MyProfileUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation MyProfileUser

@synthesize userDescription = _userDescription;
@synthesize urank = _urank;
@synthesize badge = _badge;
@synthesize followMe = _followMe;
@synthesize genderIcon = _genderIcon;
@synthesize verifiedType = _verifiedType;
@synthesize verifiedReason = _verifiedReason;
@synthesize screenName = _screenName;
@synthesize fansNum = _fansNum;
@synthesize profileUrl = _profileUrl;
@synthesize verified = _verified;
@synthesize userIdentifier = _userIdentifier;
@synthesize h5icon = _h5icon;
@synthesize mbtype = _mbtype;
@synthesize name = _name;
@synthesize avatarHd = _avatarHd;
@synthesize profileImageUrl = _profileImageUrl;
@synthesize following = _following;
@synthesize attNum = _attNum;
@synthesize nativePlace = _nativePlace;
@synthesize mblogNum = _mblogNum;
@synthesize ptype = _ptype;
@synthesize createdAt = _createdAt;
@synthesize favouritesCount = _favouritesCount;
@synthesize ta = _ta;
@synthesize mbrank = _mbrank;


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
            self.userDescription = [self objectOrNilForKey:kMyProfileUserDescription fromDictionary:dict];
            self.urank = [[self objectOrNilForKey:kMyProfileUserUrank fromDictionary:dict] doubleValue];
            self.badge = [MyProfileBadge modelObjectWithDictionary:[dict objectForKey:kMyProfileUserBadge]];
            self.followMe = [[self objectOrNilForKey:kMyProfileUserFollowMe fromDictionary:dict] boolValue];
            self.genderIcon = [self objectOrNilForKey:kMyProfileUserGenderIcon fromDictionary:dict];
            self.verifiedType = [[self objectOrNilForKey:kMyProfileUserVerifiedType fromDictionary:dict] doubleValue];
            self.verifiedReason = [self objectOrNilForKey:kMyProfileUserVerifiedReason fromDictionary:dict];
            self.screenName = [self objectOrNilForKey:kMyProfileUserScreenName fromDictionary:dict];
            self.fansNum = [[self objectOrNilForKey:kMyProfileUserFansNum fromDictionary:dict] doubleValue];
            self.profileUrl = [self objectOrNilForKey:kMyProfileUserProfileUrl fromDictionary:dict];
            self.verified = [[self objectOrNilForKey:kMyProfileUserVerified fromDictionary:dict] boolValue];
            self.userIdentifier = [self objectOrNilForKey:kMyProfileUserId fromDictionary:dict];
            self.h5icon = [MyProfileH5icon modelObjectWithDictionary:[dict objectForKey:kMyProfileUserH5icon]];
            self.mbtype = [[self objectOrNilForKey:kMyProfileUserMbtype fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kMyProfileUserName fromDictionary:dict];
            self.avatarHd = [self objectOrNilForKey:kMyProfileUserAvatarHd fromDictionary:dict];
            self.profileImageUrl = [self objectOrNilForKey:kMyProfileUserProfileImageUrl fromDictionary:dict];
            self.following = [[self objectOrNilForKey:kMyProfileUserFollowing fromDictionary:dict] boolValue];
            self.attNum = [[self objectOrNilForKey:kMyProfileUserAttNum fromDictionary:dict] doubleValue];
            self.nativePlace = [self objectOrNilForKey:kMyProfileUserNativePlace fromDictionary:dict];
            self.mblogNum = [[self objectOrNilForKey:kMyProfileUserMblogNum fromDictionary:dict] doubleValue];
            self.ptype = [[self objectOrNilForKey:kMyProfileUserPtype fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kMyProfileUserCreatedAt fromDictionary:dict];
            self.favouritesCount = [[self objectOrNilForKey:kMyProfileUserFavouritesCount fromDictionary:dict] doubleValue];
            self.ta = [self objectOrNilForKey:kMyProfileUserTa fromDictionary:dict];
            self.mbrank = [[self objectOrNilForKey:kMyProfileUserMbrank fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.userDescription forKey:kMyProfileUserDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.urank] forKey:kMyProfileUserUrank];
    [mutableDict setValue:[self.badge dictionaryRepresentation] forKey:kMyProfileUserBadge];
    [mutableDict setValue:[NSNumber numberWithBool:self.followMe] forKey:kMyProfileUserFollowMe];
    [mutableDict setValue:self.genderIcon forKey:kMyProfileUserGenderIcon];
    [mutableDict setValue:[NSNumber numberWithDouble:self.verifiedType] forKey:kMyProfileUserVerifiedType];
    [mutableDict setValue:self.verifiedReason forKey:kMyProfileUserVerifiedReason];
    [mutableDict setValue:self.screenName forKey:kMyProfileUserScreenName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fansNum] forKey:kMyProfileUserFansNum];
    [mutableDict setValue:self.profileUrl forKey:kMyProfileUserProfileUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.verified] forKey:kMyProfileUserVerified];
    [mutableDict setValue:self.userIdentifier forKey:kMyProfileUserId];
    [mutableDict setValue:[self.h5icon dictionaryRepresentation] forKey:kMyProfileUserH5icon];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mbtype] forKey:kMyProfileUserMbtype];
    [mutableDict setValue:self.name forKey:kMyProfileUserName];
    [mutableDict setValue:self.avatarHd forKey:kMyProfileUserAvatarHd];
    [mutableDict setValue:self.profileImageUrl forKey:kMyProfileUserProfileImageUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.following] forKey:kMyProfileUserFollowing];
    [mutableDict setValue:[NSNumber numberWithDouble:self.attNum] forKey:kMyProfileUserAttNum];
    [mutableDict setValue:self.nativePlace forKey:kMyProfileUserNativePlace];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mblogNum] forKey:kMyProfileUserMblogNum];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ptype] forKey:kMyProfileUserPtype];
    [mutableDict setValue:self.createdAt forKey:kMyProfileUserCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.favouritesCount] forKey:kMyProfileUserFavouritesCount];
    [mutableDict setValue:self.ta forKey:kMyProfileUserTa];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mbrank] forKey:kMyProfileUserMbrank];

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

    self.userDescription = [aDecoder decodeObjectForKey:kMyProfileUserDescription];
    self.urank = [aDecoder decodeDoubleForKey:kMyProfileUserUrank];
    self.badge = [aDecoder decodeObjectForKey:kMyProfileUserBadge];
    self.followMe = [aDecoder decodeBoolForKey:kMyProfileUserFollowMe];
    self.genderIcon = [aDecoder decodeObjectForKey:kMyProfileUserGenderIcon];
    self.verifiedType = [aDecoder decodeDoubleForKey:kMyProfileUserVerifiedType];
    self.verifiedReason = [aDecoder decodeObjectForKey:kMyProfileUserVerifiedReason];
    self.screenName = [aDecoder decodeObjectForKey:kMyProfileUserScreenName];
    self.fansNum = [aDecoder decodeDoubleForKey:kMyProfileUserFansNum];
    self.profileUrl = [aDecoder decodeObjectForKey:kMyProfileUserProfileUrl];
    self.verified = [aDecoder decodeBoolForKey:kMyProfileUserVerified];
    self.userIdentifier = [aDecoder decodeObjectForKey:kMyProfileUserId];
    self.h5icon = [aDecoder decodeObjectForKey:kMyProfileUserH5icon];
    self.mbtype = [aDecoder decodeDoubleForKey:kMyProfileUserMbtype];
    self.name = [aDecoder decodeObjectForKey:kMyProfileUserName];
    self.avatarHd = [aDecoder decodeObjectForKey:kMyProfileUserAvatarHd];
    self.profileImageUrl = [aDecoder decodeObjectForKey:kMyProfileUserProfileImageUrl];
    self.following = [aDecoder decodeBoolForKey:kMyProfileUserFollowing];
    self.attNum = [aDecoder decodeDoubleForKey:kMyProfileUserAttNum];
    self.nativePlace = [aDecoder decodeObjectForKey:kMyProfileUserNativePlace];
    self.mblogNum = [aDecoder decodeDoubleForKey:kMyProfileUserMblogNum];
    self.ptype = [aDecoder decodeDoubleForKey:kMyProfileUserPtype];
    self.createdAt = [aDecoder decodeObjectForKey:kMyProfileUserCreatedAt];
    self.favouritesCount = [aDecoder decodeDoubleForKey:kMyProfileUserFavouritesCount];
    self.ta = [aDecoder decodeObjectForKey:kMyProfileUserTa];
    self.mbrank = [aDecoder decodeDoubleForKey:kMyProfileUserMbrank];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_userDescription forKey:kMyProfileUserDescription];
    [aCoder encodeDouble:_urank forKey:kMyProfileUserUrank];
    [aCoder encodeObject:_badge forKey:kMyProfileUserBadge];
    [aCoder encodeBool:_followMe forKey:kMyProfileUserFollowMe];
    [aCoder encodeObject:_genderIcon forKey:kMyProfileUserGenderIcon];
    [aCoder encodeDouble:_verifiedType forKey:kMyProfileUserVerifiedType];
    [aCoder encodeObject:_verifiedReason forKey:kMyProfileUserVerifiedReason];
    [aCoder encodeObject:_screenName forKey:kMyProfileUserScreenName];
    [aCoder encodeDouble:_fansNum forKey:kMyProfileUserFansNum];
    [aCoder encodeObject:_profileUrl forKey:kMyProfileUserProfileUrl];
    [aCoder encodeBool:_verified forKey:kMyProfileUserVerified];
    [aCoder encodeObject:_userIdentifier forKey:kMyProfileUserId];
    [aCoder encodeObject:_h5icon forKey:kMyProfileUserH5icon];
    [aCoder encodeDouble:_mbtype forKey:kMyProfileUserMbtype];
    [aCoder encodeObject:_name forKey:kMyProfileUserName];
    [aCoder encodeObject:_avatarHd forKey:kMyProfileUserAvatarHd];
    [aCoder encodeObject:_profileImageUrl forKey:kMyProfileUserProfileImageUrl];
    [aCoder encodeBool:_following forKey:kMyProfileUserFollowing];
    [aCoder encodeDouble:_attNum forKey:kMyProfileUserAttNum];
    [aCoder encodeObject:_nativePlace forKey:kMyProfileUserNativePlace];
    [aCoder encodeDouble:_mblogNum forKey:kMyProfileUserMblogNum];
    [aCoder encodeDouble:_ptype forKey:kMyProfileUserPtype];
    [aCoder encodeObject:_createdAt forKey:kMyProfileUserCreatedAt];
    [aCoder encodeDouble:_favouritesCount forKey:kMyProfileUserFavouritesCount];
    [aCoder encodeObject:_ta forKey:kMyProfileUserTa];
    [aCoder encodeDouble:_mbrank forKey:kMyProfileUserMbrank];
}

- (id)copyWithZone:(NSZone *)zone
{
    MyProfileUser *copy = [[MyProfileUser alloc] init];
    
    if (copy) {

        copy.userDescription = [self.userDescription copyWithZone:zone];
        copy.urank = self.urank;
        copy.badge = [self.badge copyWithZone:zone];
        copy.followMe = self.followMe;
        copy.genderIcon = [self.genderIcon copyWithZone:zone];
        copy.verifiedType = self.verifiedType;
        copy.verifiedReason = [self.verifiedReason copyWithZone:zone];
        copy.screenName = [self.screenName copyWithZone:zone];
        copy.fansNum = self.fansNum;
        copy.profileUrl = [self.profileUrl copyWithZone:zone];
        copy.verified = self.verified;
        copy.userIdentifier = [self.userIdentifier copyWithZone:zone];
        copy.h5icon = [self.h5icon copyWithZone:zone];
        copy.mbtype = self.mbtype;
        copy.name = [self.name copyWithZone:zone];
        copy.avatarHd = [self.avatarHd copyWithZone:zone];
        copy.profileImageUrl = [self.profileImageUrl copyWithZone:zone];
        copy.following = self.following;
        copy.attNum = self.attNum;
        copy.nativePlace = [self.nativePlace copyWithZone:zone];
        copy.mblogNum = self.mblogNum;
        copy.ptype = self.ptype;
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.favouritesCount = self.favouritesCount;
        copy.ta = [self.ta copyWithZone:zone];
        copy.mbrank = self.mbrank;
    }
    
    return copy;
}


@end
