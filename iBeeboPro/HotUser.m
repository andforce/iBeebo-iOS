//
//  HotUser.m
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HotUser.h"


NSString *const kHotUserId = @"id";
NSString *const kHotUserDescription = @"description";
NSString *const kHotUserFollowersCount = @"followers_count";
NSString *const kHotUserUrank = @"urank";
NSString *const kHotUserFollowMe = @"follow_me";
NSString *const kHotUserProfileUrl = @"profile_url";
NSString *const kHotUserVerified = @"verified";
NSString *const kHotUserMbtype = @"mbtype";
NSString *const kHotUserVerifiedReason = @"verified_reason";
NSString *const kHotUserProfileImageUrl = @"profile_image_url";
NSString *const kHotUserStatusesCount = @"statuses_count";
NSString *const kHotUserVerifiedTypeExt = @"verified_type_ext";
NSString *const kHotUserFollowCount = @"follow_count";
NSString *const kHotUserCoverImagePhone = @"cover_image_phone";
NSString *const kHotUserMbrank = @"mbrank";
NSString *const kHotUserFollowing = @"following";
NSString *const kHotUserVerifiedType = @"verified_type";
NSString *const kHotUserScreenName = @"screen_name";
NSString *const kHotUserGender = @"gender";


@interface HotUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotUser

@synthesize userIdentifier = _userIdentifier;
@synthesize userDescription = _userDescription;
@synthesize followersCount = _followersCount;
@synthesize urank = _urank;
@synthesize followMe = _followMe;
@synthesize profileUrl = _profileUrl;
@synthesize verified = _verified;
@synthesize mbtype = _mbtype;
@synthesize verifiedReason = _verifiedReason;
@synthesize profileImageUrl = _profileImageUrl;
@synthesize statusesCount = _statusesCount;
@synthesize verifiedTypeExt = _verifiedTypeExt;
@synthesize followCount = _followCount;
@synthesize coverImagePhone = _coverImagePhone;
@synthesize mbrank = _mbrank;
@synthesize following = _following;
@synthesize verifiedType = _verifiedType;
@synthesize screenName = _screenName;
@synthesize gender = _gender;


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
            self.userIdentifier = [[self objectOrNilForKey:kHotUserId fromDictionary:dict] doubleValue];
            self.userDescription = [self objectOrNilForKey:kHotUserDescription fromDictionary:dict];
            self.followersCount = [[self objectOrNilForKey:kHotUserFollowersCount fromDictionary:dict] doubleValue];
            self.urank = [[self objectOrNilForKey:kHotUserUrank fromDictionary:dict] doubleValue];
            self.followMe = [[self objectOrNilForKey:kHotUserFollowMe fromDictionary:dict] boolValue];
            self.profileUrl = [self objectOrNilForKey:kHotUserProfileUrl fromDictionary:dict];
            self.verified = [[self objectOrNilForKey:kHotUserVerified fromDictionary:dict] boolValue];
            self.mbtype = [[self objectOrNilForKey:kHotUserMbtype fromDictionary:dict] doubleValue];
            self.verifiedReason = [self objectOrNilForKey:kHotUserVerifiedReason fromDictionary:dict];
            self.profileImageUrl = [self objectOrNilForKey:kHotUserProfileImageUrl fromDictionary:dict];
            self.statusesCount = [[self objectOrNilForKey:kHotUserStatusesCount fromDictionary:dict] doubleValue];
            self.verifiedTypeExt = [[self objectOrNilForKey:kHotUserVerifiedTypeExt fromDictionary:dict] doubleValue];
            self.followCount = [[self objectOrNilForKey:kHotUserFollowCount fromDictionary:dict] doubleValue];
            self.coverImagePhone = [self objectOrNilForKey:kHotUserCoverImagePhone fromDictionary:dict];
            self.mbrank = [[self objectOrNilForKey:kHotUserMbrank fromDictionary:dict] doubleValue];
            self.following = [[self objectOrNilForKey:kHotUserFollowing fromDictionary:dict] boolValue];
            self.verifiedType = [[self objectOrNilForKey:kHotUserVerifiedType fromDictionary:dict] doubleValue];
            self.screenName = [self objectOrNilForKey:kHotUserScreenName fromDictionary:dict];
            self.gender = [self objectOrNilForKey:kHotUserGender fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdentifier] forKey:kHotUserId];
    [mutableDict setValue:self.userDescription forKey:kHotUserDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followersCount] forKey:kHotUserFollowersCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.urank] forKey:kHotUserUrank];
    [mutableDict setValue:[NSNumber numberWithBool:self.followMe] forKey:kHotUserFollowMe];
    [mutableDict setValue:self.profileUrl forKey:kHotUserProfileUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.verified] forKey:kHotUserVerified];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mbtype] forKey:kHotUserMbtype];
    [mutableDict setValue:self.verifiedReason forKey:kHotUserVerifiedReason];
    [mutableDict setValue:self.profileImageUrl forKey:kHotUserProfileImageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.statusesCount] forKey:kHotUserStatusesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.verifiedTypeExt] forKey:kHotUserVerifiedTypeExt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followCount] forKey:kHotUserFollowCount];
    [mutableDict setValue:self.coverImagePhone forKey:kHotUserCoverImagePhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mbrank] forKey:kHotUserMbrank];
    [mutableDict setValue:[NSNumber numberWithBool:self.following] forKey:kHotUserFollowing];
    [mutableDict setValue:[NSNumber numberWithDouble:self.verifiedType] forKey:kHotUserVerifiedType];
    [mutableDict setValue:self.screenName forKey:kHotUserScreenName];
    [mutableDict setValue:self.gender forKey:kHotUserGender];

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

    self.userIdentifier = [aDecoder decodeDoubleForKey:kHotUserId];
    self.userDescription = [aDecoder decodeObjectForKey:kHotUserDescription];
    self.followersCount = [aDecoder decodeDoubleForKey:kHotUserFollowersCount];
    self.urank = [aDecoder decodeDoubleForKey:kHotUserUrank];
    self.followMe = [aDecoder decodeBoolForKey:kHotUserFollowMe];
    self.profileUrl = [aDecoder decodeObjectForKey:kHotUserProfileUrl];
    self.verified = [aDecoder decodeBoolForKey:kHotUserVerified];
    self.mbtype = [aDecoder decodeDoubleForKey:kHotUserMbtype];
    self.verifiedReason = [aDecoder decodeObjectForKey:kHotUserVerifiedReason];
    self.profileImageUrl = [aDecoder decodeObjectForKey:kHotUserProfileImageUrl];
    self.statusesCount = [aDecoder decodeDoubleForKey:kHotUserStatusesCount];
    self.verifiedTypeExt = [aDecoder decodeDoubleForKey:kHotUserVerifiedTypeExt];
    self.followCount = [aDecoder decodeDoubleForKey:kHotUserFollowCount];
    self.coverImagePhone = [aDecoder decodeObjectForKey:kHotUserCoverImagePhone];
    self.mbrank = [aDecoder decodeDoubleForKey:kHotUserMbrank];
    self.following = [aDecoder decodeBoolForKey:kHotUserFollowing];
    self.verifiedType = [aDecoder decodeDoubleForKey:kHotUserVerifiedType];
    self.screenName = [aDecoder decodeObjectForKey:kHotUserScreenName];
    self.gender = [aDecoder decodeObjectForKey:kHotUserGender];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_userIdentifier forKey:kHotUserId];
    [aCoder encodeObject:_userDescription forKey:kHotUserDescription];
    [aCoder encodeDouble:_followersCount forKey:kHotUserFollowersCount];
    [aCoder encodeDouble:_urank forKey:kHotUserUrank];
    [aCoder encodeBool:_followMe forKey:kHotUserFollowMe];
    [aCoder encodeObject:_profileUrl forKey:kHotUserProfileUrl];
    [aCoder encodeBool:_verified forKey:kHotUserVerified];
    [aCoder encodeDouble:_mbtype forKey:kHotUserMbtype];
    [aCoder encodeObject:_verifiedReason forKey:kHotUserVerifiedReason];
    [aCoder encodeObject:_profileImageUrl forKey:kHotUserProfileImageUrl];
    [aCoder encodeDouble:_statusesCount forKey:kHotUserStatusesCount];
    [aCoder encodeDouble:_verifiedTypeExt forKey:kHotUserVerifiedTypeExt];
    [aCoder encodeDouble:_followCount forKey:kHotUserFollowCount];
    [aCoder encodeObject:_coverImagePhone forKey:kHotUserCoverImagePhone];
    [aCoder encodeDouble:_mbrank forKey:kHotUserMbrank];
    [aCoder encodeBool:_following forKey:kHotUserFollowing];
    [aCoder encodeDouble:_verifiedType forKey:kHotUserVerifiedType];
    [aCoder encodeObject:_screenName forKey:kHotUserScreenName];
    [aCoder encodeObject:_gender forKey:kHotUserGender];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotUser *copy = [[HotUser alloc] init];
    
    if (copy) {

        copy.userIdentifier = self.userIdentifier;
        copy.userDescription = [self.userDescription copyWithZone:zone];
        copy.followersCount = self.followersCount;
        copy.urank = self.urank;
        copy.followMe = self.followMe;
        copy.profileUrl = [self.profileUrl copyWithZone:zone];
        copy.verified = self.verified;
        copy.mbtype = self.mbtype;
        copy.verifiedReason = [self.verifiedReason copyWithZone:zone];
        copy.profileImageUrl = [self.profileImageUrl copyWithZone:zone];
        copy.statusesCount = self.statusesCount;
        copy.verifiedTypeExt = self.verifiedTypeExt;
        copy.followCount = self.followCount;
        copy.coverImagePhone = [self.coverImagePhone copyWithZone:zone];
        copy.mbrank = self.mbrank;
        copy.following = self.following;
        copy.verifiedType = self.verifiedType;
        copy.screenName = [self.screenName copyWithZone:zone];
        copy.gender = [self.gender copyWithZone:zone];
    }
    
    return copy;
}


@end
