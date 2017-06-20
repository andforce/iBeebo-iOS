//
//  AtMeUser.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "AtMeUser.h"
#import "AtMeH5icon.h"


NSString *const kAtMeUserId = @"id";
NSString *const kAtMeUserH5icon = @"h5icon";
NSString *const kAtMeUserDescription = @"description";
NSString *const kAtMeUserFansNum = @"fansNum";
NSString *const kAtMeUserValid = @"valid";
NSString *const kAtMeUserFollowMe = @"follow_me";
NSString *const kAtMeUserProfileUrl = @"profile_url";
NSString *const kAtMeUserVerified = @"verified";
NSString *const kAtMeUserStatusesCount = @"statuses_count";
NSString *const kAtMeUserMbtype = @"mbtype";
NSString *const kAtMeUserProfileImageUrl = @"profile_image_url";
NSString *const kAtMeUserVerifiedReason = @"verified_reason";
NSString *const kAtMeUserIsmember = @"ismember";
NSString *const kAtMeUserRemark = @"remark";
NSString *const kAtMeUserFollowing = @"following";
NSString *const kAtMeUserVerifiedType = @"verified_type";
NSString *const kAtMeUserScreenName = @"screen_name";
NSString *const kAtMeUserGender = @"gender";


@interface AtMeUser ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AtMeUser

@synthesize userIdentifier = _userIdentifier;
@synthesize h5icon = _h5icon;
@synthesize userDescription = _userDescription;
@synthesize fansNum = _fansNum;
@synthesize valid = _valid;
@synthesize followMe = _followMe;
@synthesize profileUrl = _profileUrl;
@synthesize verified = _verified;
@synthesize statusesCount = _statusesCount;
@synthesize mbtype = _mbtype;
@synthesize profileImageUrl = _profileImageUrl;
@synthesize verifiedReason = _verifiedReason;
@synthesize ismember = _ismember;
@synthesize remark = _remark;
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
            self.userIdentifier = [[self objectOrNilForKey:kAtMeUserId fromDictionary:dict] doubleValue];
            self.h5icon = [AtMeH5icon modelObjectWithDictionary:[dict objectForKey:kAtMeUserH5icon]];
            self.userDescription = [self objectOrNilForKey:kAtMeUserDescription fromDictionary:dict];
            self.fansNum = [[self objectOrNilForKey:kAtMeUserFansNum fromDictionary:dict] doubleValue];
            self.valid = [self objectOrNilForKey:kAtMeUserValid fromDictionary:dict];
            self.followMe = [[self objectOrNilForKey:kAtMeUserFollowMe fromDictionary:dict] boolValue];
            self.profileUrl = [self objectOrNilForKey:kAtMeUserProfileUrl fromDictionary:dict];
            self.verified = [[self objectOrNilForKey:kAtMeUserVerified fromDictionary:dict] boolValue];
            self.statusesCount = [[self objectOrNilForKey:kAtMeUserStatusesCount fromDictionary:dict] doubleValue];
            self.mbtype = [[self objectOrNilForKey:kAtMeUserMbtype fromDictionary:dict] doubleValue];
            self.profileImageUrl = [self objectOrNilForKey:kAtMeUserProfileImageUrl fromDictionary:dict];
            self.verifiedReason = [self objectOrNilForKey:kAtMeUserVerifiedReason fromDictionary:dict];
            self.ismember = [[self objectOrNilForKey:kAtMeUserIsmember fromDictionary:dict] doubleValue];
            self.remark = [self objectOrNilForKey:kAtMeUserRemark fromDictionary:dict];
            self.following = [[self objectOrNilForKey:kAtMeUserFollowing fromDictionary:dict] boolValue];
            self.verifiedType = [[self objectOrNilForKey:kAtMeUserVerifiedType fromDictionary:dict] doubleValue];
            self.screenName = [self objectOrNilForKey:kAtMeUserScreenName fromDictionary:dict];
            self.gender = [self objectOrNilForKey:kAtMeUserGender fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userIdentifier] forKey:kAtMeUserId];
    [mutableDict setValue:[self.h5icon dictionaryRepresentation] forKey:kAtMeUserH5icon];
    [mutableDict setValue:self.userDescription forKey:kAtMeUserDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.fansNum] forKey:kAtMeUserFansNum];
    [mutableDict setValue:self.valid forKey:kAtMeUserValid];
    [mutableDict setValue:[NSNumber numberWithBool:self.followMe] forKey:kAtMeUserFollowMe];
    [mutableDict setValue:self.profileUrl forKey:kAtMeUserProfileUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.verified] forKey:kAtMeUserVerified];
    [mutableDict setValue:[NSNumber numberWithDouble:self.statusesCount] forKey:kAtMeUserStatusesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mbtype] forKey:kAtMeUserMbtype];
    [mutableDict setValue:self.profileImageUrl forKey:kAtMeUserProfileImageUrl];
    [mutableDict setValue:self.verifiedReason forKey:kAtMeUserVerifiedReason];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ismember] forKey:kAtMeUserIsmember];
    [mutableDict setValue:self.remark forKey:kAtMeUserRemark];
    [mutableDict setValue:[NSNumber numberWithBool:self.following] forKey:kAtMeUserFollowing];
    [mutableDict setValue:[NSNumber numberWithDouble:self.verifiedType] forKey:kAtMeUserVerifiedType];
    [mutableDict setValue:self.screenName forKey:kAtMeUserScreenName];
    [mutableDict setValue:self.gender forKey:kAtMeUserGender];

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

    self.userIdentifier = [aDecoder decodeDoubleForKey:kAtMeUserId];
    self.h5icon = [aDecoder decodeObjectForKey:kAtMeUserH5icon];
    self.userDescription = [aDecoder decodeObjectForKey:kAtMeUserDescription];
    self.fansNum = [aDecoder decodeDoubleForKey:kAtMeUserFansNum];
    self.valid = [aDecoder decodeObjectForKey:kAtMeUserValid];
    self.followMe = [aDecoder decodeBoolForKey:kAtMeUserFollowMe];
    self.profileUrl = [aDecoder decodeObjectForKey:kAtMeUserProfileUrl];
    self.verified = [aDecoder decodeBoolForKey:kAtMeUserVerified];
    self.statusesCount = [aDecoder decodeDoubleForKey:kAtMeUserStatusesCount];
    self.mbtype = [aDecoder decodeDoubleForKey:kAtMeUserMbtype];
    self.profileImageUrl = [aDecoder decodeObjectForKey:kAtMeUserProfileImageUrl];
    self.verifiedReason = [aDecoder decodeObjectForKey:kAtMeUserVerifiedReason];
    self.ismember = [aDecoder decodeDoubleForKey:kAtMeUserIsmember];
    self.remark = [aDecoder decodeObjectForKey:kAtMeUserRemark];
    self.following = [aDecoder decodeBoolForKey:kAtMeUserFollowing];
    self.verifiedType = [aDecoder decodeDoubleForKey:kAtMeUserVerifiedType];
    self.screenName = [aDecoder decodeObjectForKey:kAtMeUserScreenName];
    self.gender = [aDecoder decodeObjectForKey:kAtMeUserGender];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_userIdentifier forKey:kAtMeUserId];
    [aCoder encodeObject:_h5icon forKey:kAtMeUserH5icon];
    [aCoder encodeObject:_userDescription forKey:kAtMeUserDescription];
    [aCoder encodeDouble:_fansNum forKey:kAtMeUserFansNum];
    [aCoder encodeObject:_valid forKey:kAtMeUserValid];
    [aCoder encodeBool:_followMe forKey:kAtMeUserFollowMe];
    [aCoder encodeObject:_profileUrl forKey:kAtMeUserProfileUrl];
    [aCoder encodeBool:_verified forKey:kAtMeUserVerified];
    [aCoder encodeDouble:_statusesCount forKey:kAtMeUserStatusesCount];
    [aCoder encodeDouble:_mbtype forKey:kAtMeUserMbtype];
    [aCoder encodeObject:_profileImageUrl forKey:kAtMeUserProfileImageUrl];
    [aCoder encodeObject:_verifiedReason forKey:kAtMeUserVerifiedReason];
    [aCoder encodeDouble:_ismember forKey:kAtMeUserIsmember];
    [aCoder encodeObject:_remark forKey:kAtMeUserRemark];
    [aCoder encodeBool:_following forKey:kAtMeUserFollowing];
    [aCoder encodeDouble:_verifiedType forKey:kAtMeUserVerifiedType];
    [aCoder encodeObject:_screenName forKey:kAtMeUserScreenName];
    [aCoder encodeObject:_gender forKey:kAtMeUserGender];
}

- (id)copyWithZone:(NSZone *)zone
{
    AtMeUser *copy = [[AtMeUser alloc] init];
    
    if (copy) {

        copy.userIdentifier = self.userIdentifier;
        copy.h5icon = [self.h5icon copyWithZone:zone];
        copy.userDescription = [self.userDescription copyWithZone:zone];
        copy.fansNum = self.fansNum;
        copy.valid = [self.valid copyWithZone:zone];
        copy.followMe = self.followMe;
        copy.profileUrl = [self.profileUrl copyWithZone:zone];
        copy.verified = self.verified;
        copy.statusesCount = self.statusesCount;
        copy.mbtype = self.mbtype;
        copy.profileImageUrl = [self.profileImageUrl copyWithZone:zone];
        copy.verifiedReason = [self.verifiedReason copyWithZone:zone];
        copy.ismember = self.ismember;
        copy.remark = [self.remark copyWithZone:zone];
        copy.following = self.following;
        copy.verifiedType = self.verifiedType;
        copy.screenName = [self.screenName copyWithZone:zone];
        copy.gender = [self.gender copyWithZone:zone];
    }
    
    return copy;
}


@end
