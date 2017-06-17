//
//  User.m
//
//  Created by   on 2017/6/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "User.h"


NSString *const kUserId = @"id";
NSString *const kUserDescription = @"description";
NSString *const kUserFollowersCount = @"followers_count";
NSString *const kUserUrank = @"urank";
NSString *const kUserFollowMe = @"follow_me";
NSString *const kUserProfileUrl = @"profile_url";
NSString *const kUserVerified = @"verified";
NSString *const kUserMbtype = @"mbtype";
NSString *const kUserVerifiedReason = @"verified_reason";
NSString *const kUserProfileImageUrl = @"profile_image_url";
NSString *const kUserStatusesCount = @"statuses_count";
NSString *const kUserVerifiedTypeExt = @"verified_type_ext";
NSString *const kUserFollowCount = @"follow_count";
NSString *const kUserCoverImagePhone = @"cover_image_phone";
NSString *const kUserMbrank = @"mbrank";
NSString *const kUserFollowing = @"following";
NSString *const kUserVerifiedType = @"verified_type";
NSString *const kUserScreenName = @"screen_name";
NSString *const kUserGender = @"gender";


@interface User ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation User

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
            self.userIdentifier = [[self objectOrNilForKey:kUserId fromDictionary:dict] doubleValue];
            self.userDescription = [self objectOrNilForKey:kUserDescription fromDictionary:dict];
            self.followersCount = [[self objectOrNilForKey:kUserFollowersCount fromDictionary:dict] doubleValue];
            self.urank = [[self objectOrNilForKey:kUserUrank fromDictionary:dict] doubleValue];
            self.followMe = [[self objectOrNilForKey:kUserFollowMe fromDictionary:dict] boolValue];
            self.profileUrl = [self objectOrNilForKey:kUserProfileUrl fromDictionary:dict];
            self.verified = [[self objectOrNilForKey:kUserVerified fromDictionary:dict] boolValue];
            self.mbtype = [[self objectOrNilForKey:kUserMbtype fromDictionary:dict] doubleValue];
            self.verifiedReason = [self objectOrNilForKey:kUserVerifiedReason fromDictionary:dict];
            self.profileImageUrl = [self objectOrNilForKey:kUserProfileImageUrl fromDictionary:dict];
            self.statusesCount = [[self objectOrNilForKey:kUserStatusesCount fromDictionary:dict] doubleValue];
            self.verifiedTypeExt = [[self objectOrNilForKey:kUserVerifiedTypeExt fromDictionary:dict] doubleValue];
            self.followCount = [[self objectOrNilForKey:kUserFollowCount fromDictionary:dict] doubleValue];
            self.coverImagePhone = [self objectOrNilForKey:kUserCoverImagePhone fromDictionary:dict];
            self.mbrank = [[self objectOrNilForKey:kUserMbrank fromDictionary:dict] doubleValue];
            self.following = [[self objectOrNilForKey:kUserFollowing fromDictionary:dict] boolValue];
            self.verifiedType = [[self objectOrNilForKey:kUserVerifiedType fromDictionary:dict] doubleValue];
            self.screenName = [self objectOrNilForKey:kUserScreenName fromDictionary:dict];
            self.gender = [self objectOrNilForKey:kUserGender fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdentifier] forKey:kUserId];
    [mutableDict setValue:self.userDescription forKey:kUserDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followersCount] forKey:kUserFollowersCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.urank] forKey:kUserUrank];
    [mutableDict setValue:[NSNumber numberWithBool:self.followMe] forKey:kUserFollowMe];
    [mutableDict setValue:self.profileUrl forKey:kUserProfileUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.verified] forKey:kUserVerified];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mbtype] forKey:kUserMbtype];
    [mutableDict setValue:self.verifiedReason forKey:kUserVerifiedReason];
    [mutableDict setValue:self.profileImageUrl forKey:kUserProfileImageUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.statusesCount] forKey:kUserStatusesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.verifiedTypeExt] forKey:kUserVerifiedTypeExt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.followCount] forKey:kUserFollowCount];
    [mutableDict setValue:self.coverImagePhone forKey:kUserCoverImagePhone];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mbrank] forKey:kUserMbrank];
    [mutableDict setValue:[NSNumber numberWithBool:self.following] forKey:kUserFollowing];
    [mutableDict setValue:[NSNumber numberWithDouble:self.verifiedType] forKey:kUserVerifiedType];
    [mutableDict setValue:self.screenName forKey:kUserScreenName];
    [mutableDict setValue:self.gender forKey:kUserGender];

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

    self.userIdentifier = [aDecoder decodeDoubleForKey:kUserId];
    self.userDescription = [aDecoder decodeObjectForKey:kUserDescription];
    self.followersCount = [aDecoder decodeDoubleForKey:kUserFollowersCount];
    self.urank = [aDecoder decodeDoubleForKey:kUserUrank];
    self.followMe = [aDecoder decodeBoolForKey:kUserFollowMe];
    self.profileUrl = [aDecoder decodeObjectForKey:kUserProfileUrl];
    self.verified = [aDecoder decodeBoolForKey:kUserVerified];
    self.mbtype = [aDecoder decodeDoubleForKey:kUserMbtype];
    self.verifiedReason = [aDecoder decodeObjectForKey:kUserVerifiedReason];
    self.profileImageUrl = [aDecoder decodeObjectForKey:kUserProfileImageUrl];
    self.statusesCount = [aDecoder decodeDoubleForKey:kUserStatusesCount];
    self.verifiedTypeExt = [aDecoder decodeDoubleForKey:kUserVerifiedTypeExt];
    self.followCount = [aDecoder decodeDoubleForKey:kUserFollowCount];
    self.coverImagePhone = [aDecoder decodeObjectForKey:kUserCoverImagePhone];
    self.mbrank = [aDecoder decodeDoubleForKey:kUserMbrank];
    self.following = [aDecoder decodeBoolForKey:kUserFollowing];
    self.verifiedType = [aDecoder decodeDoubleForKey:kUserVerifiedType];
    self.screenName = [aDecoder decodeObjectForKey:kUserScreenName];
    self.gender = [aDecoder decodeObjectForKey:kUserGender];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_userIdentifier forKey:kUserId];
    [aCoder encodeObject:_userDescription forKey:kUserDescription];
    [aCoder encodeDouble:_followersCount forKey:kUserFollowersCount];
    [aCoder encodeDouble:_urank forKey:kUserUrank];
    [aCoder encodeBool:_followMe forKey:kUserFollowMe];
    [aCoder encodeObject:_profileUrl forKey:kUserProfileUrl];
    [aCoder encodeBool:_verified forKey:kUserVerified];
    [aCoder encodeDouble:_mbtype forKey:kUserMbtype];
    [aCoder encodeObject:_verifiedReason forKey:kUserVerifiedReason];
    [aCoder encodeObject:_profileImageUrl forKey:kUserProfileImageUrl];
    [aCoder encodeDouble:_statusesCount forKey:kUserStatusesCount];
    [aCoder encodeDouble:_verifiedTypeExt forKey:kUserVerifiedTypeExt];
    [aCoder encodeDouble:_followCount forKey:kUserFollowCount];
    [aCoder encodeObject:_coverImagePhone forKey:kUserCoverImagePhone];
    [aCoder encodeDouble:_mbrank forKey:kUserMbrank];
    [aCoder encodeBool:_following forKey:kUserFollowing];
    [aCoder encodeDouble:_verifiedType forKey:kUserVerifiedType];
    [aCoder encodeObject:_screenName forKey:kUserScreenName];
    [aCoder encodeObject:_gender forKey:kUserGender];
}

- (id)copyWithZone:(NSZone *)zone
{
    User *copy = [[User alloc] init];
    
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
