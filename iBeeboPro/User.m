//
//  User.m
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "User.h"
#import "H5icon.h"


NSString *const kUserId = @"id";
NSString *const kUserH5icon = @"h5icon";
NSString *const kUserDescription = @"description";
NSString *const kUserFansNum = @"fansNum";
NSString *const kUserValid = @"valid";
NSString *const kUserFollowMe = @"follow_me";
NSString *const kUserProfileUrl = @"profile_url";
NSString *const kUserVerified = @"verified";
NSString *const kUserStatusesCount = @"statuses_count";
NSString *const kUserMbtype = @"mbtype";
NSString *const kUserProfileImageUrl = @"profile_image_url";
NSString *const kUserVerifiedReason = @"verified_reason";
NSString *const kUserIsmember = @"ismember";
NSString *const kUserRemark = @"remark";
NSString *const kUserFollowing = @"following";
NSString *const kUserVerifiedType = @"verified_type";
NSString *const kUserScreenName = @"screen_name";
NSString *const kUserGender = @"gender";


@interface User ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation User

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
            self.userIdentifier = [[self objectOrNilForKey:kUserId fromDictionary:dict] doubleValue];
            self.h5icon = [H5icon modelObjectWithDictionary:[dict objectForKey:kUserH5icon]];
            self.userDescription = [self objectOrNilForKey:kUserDescription fromDictionary:dict];
            self.fansNum = [self objectOrNilForKey:kUserFansNum fromDictionary:dict];
            self.valid = [self objectOrNilForKey:kUserValid fromDictionary:dict];
            self.followMe = [[self objectOrNilForKey:kUserFollowMe fromDictionary:dict] boolValue];
            self.profileUrl = [self objectOrNilForKey:kUserProfileUrl fromDictionary:dict];
            self.verified = [[self objectOrNilForKey:kUserVerified fromDictionary:dict] boolValue];
            self.statusesCount = [[self objectOrNilForKey:kUserStatusesCount fromDictionary:dict] doubleValue];
            self.mbtype = [[self objectOrNilForKey:kUserMbtype fromDictionary:dict] doubleValue];
            self.profileImageUrl = [self objectOrNilForKey:kUserProfileImageUrl fromDictionary:dict];
            self.verifiedReason = [self objectOrNilForKey:kUserVerifiedReason fromDictionary:dict];
            self.ismember = [[self objectOrNilForKey:kUserIsmember fromDictionary:dict] doubleValue];
            self.remark = [self objectOrNilForKey:kUserRemark fromDictionary:dict];
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
    [mutableDict setValue:[self.h5icon dictionaryRepresentation] forKey:kUserH5icon];
    [mutableDict setValue:self.userDescription forKey:kUserDescription];
    [mutableDict setValue:self.fansNum forKey:kUserFansNum];
    [mutableDict setValue:self.valid forKey:kUserValid];
    [mutableDict setValue:[NSNumber numberWithBool:self.followMe] forKey:kUserFollowMe];
    [mutableDict setValue:self.profileUrl forKey:kUserProfileUrl];
    [mutableDict setValue:[NSNumber numberWithBool:self.verified] forKey:kUserVerified];
    [mutableDict setValue:[NSNumber numberWithDouble:self.statusesCount] forKey:kUserStatusesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mbtype] forKey:kUserMbtype];
    [mutableDict setValue:self.profileImageUrl forKey:kUserProfileImageUrl];
    [mutableDict setValue:self.verifiedReason forKey:kUserVerifiedReason];
    [mutableDict setValue:[NSNumber numberWithDouble:self.ismember] forKey:kUserIsmember];
    [mutableDict setValue:self.remark forKey:kUserRemark];
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
    self.h5icon = [aDecoder decodeObjectForKey:kUserH5icon];
    self.userDescription = [aDecoder decodeObjectForKey:kUserDescription];
    self.fansNum = [aDecoder decodeObjectForKey:kUserFansNum];
    self.valid = [aDecoder decodeObjectForKey:kUserValid];
    self.followMe = [aDecoder decodeBoolForKey:kUserFollowMe];
    self.profileUrl = [aDecoder decodeObjectForKey:kUserProfileUrl];
    self.verified = [aDecoder decodeBoolForKey:kUserVerified];
    self.statusesCount = [aDecoder decodeDoubleForKey:kUserStatusesCount];
    self.mbtype = [aDecoder decodeDoubleForKey:kUserMbtype];
    self.profileImageUrl = [aDecoder decodeObjectForKey:kUserProfileImageUrl];
    self.verifiedReason = [aDecoder decodeObjectForKey:kUserVerifiedReason];
    self.ismember = [aDecoder decodeDoubleForKey:kUserIsmember];
    self.remark = [aDecoder decodeObjectForKey:kUserRemark];
    self.following = [aDecoder decodeBoolForKey:kUserFollowing];
    self.verifiedType = [aDecoder decodeDoubleForKey:kUserVerifiedType];
    self.screenName = [aDecoder decodeObjectForKey:kUserScreenName];
    self.gender = [aDecoder decodeObjectForKey:kUserGender];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_userIdentifier forKey:kUserId];
    [aCoder encodeObject:_h5icon forKey:kUserH5icon];
    [aCoder encodeObject:_userDescription forKey:kUserDescription];
    [aCoder encodeObject:_fansNum forKey:kUserFansNum];
    [aCoder encodeObject:_valid forKey:kUserValid];
    [aCoder encodeBool:_followMe forKey:kUserFollowMe];
    [aCoder encodeObject:_profileUrl forKey:kUserProfileUrl];
    [aCoder encodeBool:_verified forKey:kUserVerified];
    [aCoder encodeDouble:_statusesCount forKey:kUserStatusesCount];
    [aCoder encodeDouble:_mbtype forKey:kUserMbtype];
    [aCoder encodeObject:_profileImageUrl forKey:kUserProfileImageUrl];
    [aCoder encodeObject:_verifiedReason forKey:kUserVerifiedReason];
    [aCoder encodeDouble:_ismember forKey:kUserIsmember];
    [aCoder encodeObject:_remark forKey:kUserRemark];
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
        copy.h5icon = [self.h5icon copyWithZone:zone];
        copy.userDescription = [self.userDescription copyWithZone:zone];
        copy.fansNum = [self.fansNum copyWithZone:zone];
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
