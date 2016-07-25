//
//  RetweetedStatus.m
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "RetweetedStatus.h"
#import "PageInfo.h"
#import "ExtendInfo.h"
#import "Pics.h"
#import "HotWeiboTags.h"
#import "User.h"
#import "Visible.h"


NSString *const kRetweetedStatusFavorited = @"favorited";
NSString *const kRetweetedStatusAttitudesStatus = @"attitudes_status";
NSString *const kRetweetedStatusPageInfo = @"page_info";
NSString *const kRetweetedStatusCreatedAt = @"created_at";
NSString *const kRetweetedStatusId = @"id";
NSString *const kRetweetedStatusExtendInfo = @"extend_info";
NSString *const kRetweetedStatusIsLongText = @"isLongText";
NSString *const kRetweetedStatusText = @"text";
NSString *const kRetweetedStatusIdstr = @"idstr";
NSString *const kRetweetedStatusPics = @"pics";
NSString *const kRetweetedStatusBid = @"bid";
NSString *const kRetweetedStatusLikeCount = @"like_count";
NSString *const kRetweetedStatusTextLength = @"textLength";
NSString *const kRetweetedStatusSourceType = @"source_type";
NSString *const kRetweetedStatusHotWeiboTags = @"hot_weibo_tags";
NSString *const kRetweetedStatusCreatedTimestamp = @"created_timestamp";
NSString *const kRetweetedStatusPageType = @"page_type";
NSString *const kRetweetedStatusUser = @"user";
NSString *const kRetweetedStatusTextTagTips = @"text_tag_tips";
NSString *const kRetweetedStatusCommentsCount = @"comments_count";
NSString *const kRetweetedStatusThumbnailPic = @"thumbnail_pic";
NSString *const kRetweetedStatusSource = @"source";
NSString *const kRetweetedStatusSourceAllowclick = @"source_allowclick";
NSString *const kRetweetedStatusBizFeature = @"biz_feature";
NSString *const kRetweetedStatusPositiveRecomFlag = @"positive_recom_flag";
NSString *const kRetweetedStatusBmiddlePic = @"bmiddle_pic";
NSString *const kRetweetedStatusVisible = @"visible";
NSString *const kRetweetedStatusAppid = @"appid";
NSString *const kRetweetedStatusMid = @"mid";
NSString *const kRetweetedStatusPicIds = @"pic_ids";
NSString *const kRetweetedStatusRepostsCount = @"reposts_count";
NSString *const kRetweetedStatusUserType = @"userType";
NSString *const kRetweetedStatusAttitudesCount = @"attitudes_count";
NSString *const kRetweetedStatusMlevel = @"mlevel";
NSString *const kRetweetedStatusOriginalPic = @"original_pic";


@interface RetweetedStatus ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RetweetedStatus

@synthesize favorited = _favorited;
@synthesize attitudesStatus = _attitudesStatus;
@synthesize pageInfo = _pageInfo;
@synthesize createdAt = _createdAt;
@synthesize retweetedStatusIdentifier = _retweetedStatusIdentifier;
@synthesize extendInfo = _extendInfo;
@synthesize isLongText = _isLongText;
@synthesize text = _text;
@synthesize idstr = _idstr;
@synthesize pics = _pics;
@synthesize bid = _bid;
@synthesize likeCount = _likeCount;
@synthesize textLength = _textLength;
@synthesize sourceType = _sourceType;
@synthesize hotWeiboTags = _hotWeiboTags;
@synthesize createdTimestamp = _createdTimestamp;
@synthesize pageType = _pageType;
@synthesize user = _user;
@synthesize textTagTips = _textTagTips;
@synthesize commentsCount = _commentsCount;
@synthesize thumbnailPic = _thumbnailPic;
@synthesize source = _source;
@synthesize sourceAllowclick = _sourceAllowclick;
@synthesize bizFeature = _bizFeature;
@synthesize positiveRecomFlag = _positiveRecomFlag;
@synthesize bmiddlePic = _bmiddlePic;
@synthesize visible = _visible;
@synthesize appid = _appid;
@synthesize mid = _mid;
@synthesize picIds = _picIds;
@synthesize repostsCount = _repostsCount;
@synthesize userType = _userType;
@synthesize attitudesCount = _attitudesCount;
@synthesize mlevel = _mlevel;
@synthesize originalPic = _originalPic;


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
            self.favorited = [[self objectOrNilForKey:kRetweetedStatusFavorited fromDictionary:dict] boolValue];
            self.attitudesStatus = [[self objectOrNilForKey:kRetweetedStatusAttitudesStatus fromDictionary:dict] doubleValue];
            self.pageInfo = [PageInfo modelObjectWithDictionary:[dict objectForKey:kRetweetedStatusPageInfo]];
            self.createdAt = [self objectOrNilForKey:kRetweetedStatusCreatedAt fromDictionary:dict];
            self.retweetedStatusIdentifier = [[self objectOrNilForKey:kRetweetedStatusId fromDictionary:dict] doubleValue];
            self.extendInfo = [ExtendInfo modelObjectWithDictionary:[dict objectForKey:kRetweetedStatusExtendInfo]];
            self.isLongText = [[self objectOrNilForKey:kRetweetedStatusIsLongText fromDictionary:dict] boolValue];
            self.text = [self objectOrNilForKey:kRetweetedStatusText fromDictionary:dict];
            self.idstr = [self objectOrNilForKey:kRetweetedStatusIdstr fromDictionary:dict];
    NSObject *receivedPics = [dict objectForKey:kRetweetedStatusPics];
    NSMutableArray *parsedPics = [NSMutableArray array];
    if ([receivedPics isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedPics) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedPics addObject:[Pics modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedPics isKindOfClass:[NSDictionary class]]) {
       [parsedPics addObject:[Pics modelObjectWithDictionary:(NSDictionary *)receivedPics]];
    }

    self.pics = [NSArray arrayWithArray:parsedPics];
            self.bid = [self objectOrNilForKey:kRetweetedStatusBid fromDictionary:dict];
            self.likeCount = [[self objectOrNilForKey:kRetweetedStatusLikeCount fromDictionary:dict] doubleValue];
            self.textLength = [[self objectOrNilForKey:kRetweetedStatusTextLength fromDictionary:dict] doubleValue];
            self.sourceType = [[self objectOrNilForKey:kRetweetedStatusSourceType fromDictionary:dict] doubleValue];
    NSObject *receivedHotWeiboTags = [dict objectForKey:kRetweetedStatusHotWeiboTags];
    NSMutableArray *parsedHotWeiboTags = [NSMutableArray array];
    if ([receivedHotWeiboTags isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHotWeiboTags) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHotWeiboTags addObject:[HotWeiboTags modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHotWeiboTags isKindOfClass:[NSDictionary class]]) {
       [parsedHotWeiboTags addObject:[HotWeiboTags modelObjectWithDictionary:(NSDictionary *)receivedHotWeiboTags]];
    }

    self.hotWeiboTags = [NSArray arrayWithArray:parsedHotWeiboTags];
            self.createdTimestamp = [[self objectOrNilForKey:kRetweetedStatusCreatedTimestamp fromDictionary:dict] doubleValue];
            self.pageType = [[self objectOrNilForKey:kRetweetedStatusPageType fromDictionary:dict] doubleValue];
            self.user = [User modelObjectWithDictionary:[dict objectForKey:kRetweetedStatusUser]];
            self.textTagTips = [self objectOrNilForKey:kRetweetedStatusTextTagTips fromDictionary:dict];
            self.commentsCount = [[self objectOrNilForKey:kRetweetedStatusCommentsCount fromDictionary:dict] doubleValue];
            self.thumbnailPic = [self objectOrNilForKey:kRetweetedStatusThumbnailPic fromDictionary:dict];
            self.source = [self objectOrNilForKey:kRetweetedStatusSource fromDictionary:dict];
            self.sourceAllowclick = [[self objectOrNilForKey:kRetweetedStatusSourceAllowclick fromDictionary:dict] doubleValue];
            self.bizFeature = [[self objectOrNilForKey:kRetweetedStatusBizFeature fromDictionary:dict] doubleValue];
            self.positiveRecomFlag = [[self objectOrNilForKey:kRetweetedStatusPositiveRecomFlag fromDictionary:dict] doubleValue];
            self.bmiddlePic = [self objectOrNilForKey:kRetweetedStatusBmiddlePic fromDictionary:dict];
            self.visible = [Visible modelObjectWithDictionary:[dict objectForKey:kRetweetedStatusVisible]];
            self.appid = [[self objectOrNilForKey:kRetweetedStatusAppid fromDictionary:dict] doubleValue];
            self.mid = [self objectOrNilForKey:kRetweetedStatusMid fromDictionary:dict];
            self.picIds = [self objectOrNilForKey:kRetweetedStatusPicIds fromDictionary:dict];
            self.repostsCount = [[self objectOrNilForKey:kRetweetedStatusRepostsCount fromDictionary:dict] doubleValue];
            self.userType = [[self objectOrNilForKey:kRetweetedStatusUserType fromDictionary:dict] doubleValue];
            self.attitudesCount = [[self objectOrNilForKey:kRetweetedStatusAttitudesCount fromDictionary:dict] doubleValue];
            self.mlevel = [[self objectOrNilForKey:kRetweetedStatusMlevel fromDictionary:dict] doubleValue];
            self.originalPic = [self objectOrNilForKey:kRetweetedStatusOriginalPic fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.favorited] forKey:kRetweetedStatusFavorited];
    [mutableDict setValue:[NSNumber numberWithDouble:self.attitudesStatus] forKey:kRetweetedStatusAttitudesStatus];
    [mutableDict setValue:[self.pageInfo dictionaryRepresentation] forKey:kRetweetedStatusPageInfo];
    [mutableDict setValue:self.createdAt forKey:kRetweetedStatusCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.retweetedStatusIdentifier] forKey:kRetweetedStatusId];
    [mutableDict setValue:[self.extendInfo dictionaryRepresentation] forKey:kRetweetedStatusExtendInfo];
    [mutableDict setValue:[NSNumber numberWithBool:self.isLongText] forKey:kRetweetedStatusIsLongText];
    [mutableDict setValue:self.text forKey:kRetweetedStatusText];
    [mutableDict setValue:self.idstr forKey:kRetweetedStatusIdstr];
    NSMutableArray *tempArrayForPics = [NSMutableArray array];
    for (NSObject *subArrayObject in self.pics) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPics addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPics addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPics] forKey:kRetweetedStatusPics];
    [mutableDict setValue:self.bid forKey:kRetweetedStatusBid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likeCount] forKey:kRetweetedStatusLikeCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.textLength] forKey:kRetweetedStatusTextLength];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sourceType] forKey:kRetweetedStatusSourceType];
    NSMutableArray *tempArrayForHotWeiboTags = [NSMutableArray array];
    for (NSObject *subArrayObject in self.hotWeiboTags) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHotWeiboTags addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHotWeiboTags addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHotWeiboTags] forKey:kRetweetedStatusHotWeiboTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdTimestamp] forKey:kRetweetedStatusCreatedTimestamp];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pageType] forKey:kRetweetedStatusPageType];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kRetweetedStatusUser];
    NSMutableArray *tempArrayForTextTagTips = [NSMutableArray array];
    for (NSObject *subArrayObject in self.textTagTips) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTextTagTips addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTextTagTips addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTextTagTips] forKey:kRetweetedStatusTextTagTips];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kRetweetedStatusCommentsCount];
    [mutableDict setValue:self.thumbnailPic forKey:kRetweetedStatusThumbnailPic];
    [mutableDict setValue:self.source forKey:kRetweetedStatusSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sourceAllowclick] forKey:kRetweetedStatusSourceAllowclick];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bizFeature] forKey:kRetweetedStatusBizFeature];
    [mutableDict setValue:[NSNumber numberWithDouble:self.positiveRecomFlag] forKey:kRetweetedStatusPositiveRecomFlag];
    [mutableDict setValue:self.bmiddlePic forKey:kRetweetedStatusBmiddlePic];
    [mutableDict setValue:[self.visible dictionaryRepresentation] forKey:kRetweetedStatusVisible];
    [mutableDict setValue:[NSNumber numberWithDouble:self.appid] forKey:kRetweetedStatusAppid];
    [mutableDict setValue:self.mid forKey:kRetweetedStatusMid];
    NSMutableArray *tempArrayForPicIds = [NSMutableArray array];
    for (NSObject *subArrayObject in self.picIds) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPicIds addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPicIds addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPicIds] forKey:kRetweetedStatusPicIds];
    [mutableDict setValue:[NSNumber numberWithDouble:self.repostsCount] forKey:kRetweetedStatusRepostsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userType] forKey:kRetweetedStatusUserType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.attitudesCount] forKey:kRetweetedStatusAttitudesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mlevel] forKey:kRetweetedStatusMlevel];
    [mutableDict setValue:self.originalPic forKey:kRetweetedStatusOriginalPic];

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

    self.favorited = [aDecoder decodeBoolForKey:kRetweetedStatusFavorited];
    self.attitudesStatus = [aDecoder decodeDoubleForKey:kRetweetedStatusAttitudesStatus];
    self.pageInfo = [aDecoder decodeObjectForKey:kRetweetedStatusPageInfo];
    self.createdAt = [aDecoder decodeObjectForKey:kRetweetedStatusCreatedAt];
    self.retweetedStatusIdentifier = [aDecoder decodeDoubleForKey:kRetweetedStatusId];
    self.extendInfo = [aDecoder decodeObjectForKey:kRetweetedStatusExtendInfo];
    self.isLongText = [aDecoder decodeBoolForKey:kRetweetedStatusIsLongText];
    self.text = [aDecoder decodeObjectForKey:kRetweetedStatusText];
    self.idstr = [aDecoder decodeObjectForKey:kRetweetedStatusIdstr];
    self.pics = [aDecoder decodeObjectForKey:kRetweetedStatusPics];
    self.bid = [aDecoder decodeObjectForKey:kRetweetedStatusBid];
    self.likeCount = [aDecoder decodeDoubleForKey:kRetweetedStatusLikeCount];
    self.textLength = [aDecoder decodeDoubleForKey:kRetweetedStatusTextLength];
    self.sourceType = [aDecoder decodeDoubleForKey:kRetweetedStatusSourceType];
    self.hotWeiboTags = [aDecoder decodeObjectForKey:kRetweetedStatusHotWeiboTags];
    self.createdTimestamp = [aDecoder decodeDoubleForKey:kRetweetedStatusCreatedTimestamp];
    self.pageType = [aDecoder decodeDoubleForKey:kRetweetedStatusPageType];
    self.user = [aDecoder decodeObjectForKey:kRetweetedStatusUser];
    self.textTagTips = [aDecoder decodeObjectForKey:kRetweetedStatusTextTagTips];
    self.commentsCount = [aDecoder decodeDoubleForKey:kRetweetedStatusCommentsCount];
    self.thumbnailPic = [aDecoder decodeObjectForKey:kRetweetedStatusThumbnailPic];
    self.source = [aDecoder decodeObjectForKey:kRetweetedStatusSource];
    self.sourceAllowclick = [aDecoder decodeDoubleForKey:kRetweetedStatusSourceAllowclick];
    self.bizFeature = [aDecoder decodeDoubleForKey:kRetweetedStatusBizFeature];
    self.positiveRecomFlag = [aDecoder decodeDoubleForKey:kRetweetedStatusPositiveRecomFlag];
    self.bmiddlePic = [aDecoder decodeObjectForKey:kRetweetedStatusBmiddlePic];
    self.visible = [aDecoder decodeObjectForKey:kRetweetedStatusVisible];
    self.appid = [aDecoder decodeDoubleForKey:kRetweetedStatusAppid];
    self.mid = [aDecoder decodeObjectForKey:kRetweetedStatusMid];
    self.picIds = [aDecoder decodeObjectForKey:kRetweetedStatusPicIds];
    self.repostsCount = [aDecoder decodeDoubleForKey:kRetweetedStatusRepostsCount];
    self.userType = [aDecoder decodeDoubleForKey:kRetweetedStatusUserType];
    self.attitudesCount = [aDecoder decodeDoubleForKey:kRetweetedStatusAttitudesCount];
    self.mlevel = [aDecoder decodeDoubleForKey:kRetweetedStatusMlevel];
    self.originalPic = [aDecoder decodeObjectForKey:kRetweetedStatusOriginalPic];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_favorited forKey:kRetweetedStatusFavorited];
    [aCoder encodeDouble:_attitudesStatus forKey:kRetweetedStatusAttitudesStatus];
    [aCoder encodeObject:_pageInfo forKey:kRetweetedStatusPageInfo];
    [aCoder encodeObject:_createdAt forKey:kRetweetedStatusCreatedAt];
    [aCoder encodeDouble:_retweetedStatusIdentifier forKey:kRetweetedStatusId];
    [aCoder encodeObject:_extendInfo forKey:kRetweetedStatusExtendInfo];
    [aCoder encodeBool:_isLongText forKey:kRetweetedStatusIsLongText];
    [aCoder encodeObject:_text forKey:kRetweetedStatusText];
    [aCoder encodeObject:_idstr forKey:kRetweetedStatusIdstr];
    [aCoder encodeObject:_pics forKey:kRetweetedStatusPics];
    [aCoder encodeObject:_bid forKey:kRetweetedStatusBid];
    [aCoder encodeDouble:_likeCount forKey:kRetweetedStatusLikeCount];
    [aCoder encodeDouble:_textLength forKey:kRetweetedStatusTextLength];
    [aCoder encodeDouble:_sourceType forKey:kRetweetedStatusSourceType];
    [aCoder encodeObject:_hotWeiboTags forKey:kRetweetedStatusHotWeiboTags];
    [aCoder encodeDouble:_createdTimestamp forKey:kRetweetedStatusCreatedTimestamp];
    [aCoder encodeDouble:_pageType forKey:kRetweetedStatusPageType];
    [aCoder encodeObject:_user forKey:kRetweetedStatusUser];
    [aCoder encodeObject:_textTagTips forKey:kRetweetedStatusTextTagTips];
    [aCoder encodeDouble:_commentsCount forKey:kRetweetedStatusCommentsCount];
    [aCoder encodeObject:_thumbnailPic forKey:kRetweetedStatusThumbnailPic];
    [aCoder encodeObject:_source forKey:kRetweetedStatusSource];
    [aCoder encodeDouble:_sourceAllowclick forKey:kRetweetedStatusSourceAllowclick];
    [aCoder encodeDouble:_bizFeature forKey:kRetweetedStatusBizFeature];
    [aCoder encodeDouble:_positiveRecomFlag forKey:kRetweetedStatusPositiveRecomFlag];
    [aCoder encodeObject:_bmiddlePic forKey:kRetweetedStatusBmiddlePic];
    [aCoder encodeObject:_visible forKey:kRetweetedStatusVisible];
    [aCoder encodeDouble:_appid forKey:kRetweetedStatusAppid];
    [aCoder encodeObject:_mid forKey:kRetweetedStatusMid];
    [aCoder encodeObject:_picIds forKey:kRetweetedStatusPicIds];
    [aCoder encodeDouble:_repostsCount forKey:kRetweetedStatusRepostsCount];
    [aCoder encodeDouble:_userType forKey:kRetweetedStatusUserType];
    [aCoder encodeDouble:_attitudesCount forKey:kRetweetedStatusAttitudesCount];
    [aCoder encodeDouble:_mlevel forKey:kRetweetedStatusMlevel];
    [aCoder encodeObject:_originalPic forKey:kRetweetedStatusOriginalPic];
}

- (id)copyWithZone:(NSZone *)zone
{
    RetweetedStatus *copy = [[RetweetedStatus alloc] init];
    
    if (copy) {

        copy.favorited = self.favorited;
        copy.attitudesStatus = self.attitudesStatus;
        copy.pageInfo = [self.pageInfo copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.retweetedStatusIdentifier = self.retweetedStatusIdentifier;
        copy.extendInfo = [self.extendInfo copyWithZone:zone];
        copy.isLongText = self.isLongText;
        copy.text = [self.text copyWithZone:zone];
        copy.idstr = [self.idstr copyWithZone:zone];
        copy.pics = [self.pics copyWithZone:zone];
        copy.bid = [self.bid copyWithZone:zone];
        copy.likeCount = self.likeCount;
        copy.textLength = self.textLength;
        copy.sourceType = self.sourceType;
        copy.hotWeiboTags = [self.hotWeiboTags copyWithZone:zone];
        copy.createdTimestamp = self.createdTimestamp;
        copy.pageType = self.pageType;
        copy.user = [self.user copyWithZone:zone];
        copy.textTagTips = [self.textTagTips copyWithZone:zone];
        copy.commentsCount = self.commentsCount;
        copy.thumbnailPic = [self.thumbnailPic copyWithZone:zone];
        copy.source = [self.source copyWithZone:zone];
        copy.sourceAllowclick = self.sourceAllowclick;
        copy.bizFeature = self.bizFeature;
        copy.positiveRecomFlag = self.positiveRecomFlag;
        copy.bmiddlePic = [self.bmiddlePic copyWithZone:zone];
        copy.visible = [self.visible copyWithZone:zone];
        copy.appid = self.appid;
        copy.mid = [self.mid copyWithZone:zone];
        copy.picIds = [self.picIds copyWithZone:zone];
        copy.repostsCount = self.repostsCount;
        copy.userType = self.userType;
        copy.attitudesCount = self.attitudesCount;
        copy.mlevel = self.mlevel;
        copy.originalPic = [self.originalPic copyWithZone:zone];
    }
    
    return copy;
}


@end
