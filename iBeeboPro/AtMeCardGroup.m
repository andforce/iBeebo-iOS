//
//  AtMeCardGroup.m
//
//  Created by   on 2017/6/21
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "AtMeCardGroup.h"
#import "AtMeCard.h"
#import "AtMeTopicStruct.h"
#import "AtMeUser.h"
#import "AtMeVisible.h"
#import "AtMeUrlStruct.h"


NSString *const kAtMeCardGroupFavorited = @"favorited";
NSString *const kAtMeCardGroupAttitudesStatus = @"attitudes_status";
NSString *const kAtMeCardGroupCreatedAt = @"created_at";
NSString *const kAtMeCardGroupId = @"id";
NSString *const kAtMeCardGroupCard = @"card";
NSString *const kAtMeCardGroupIsShowBulletin = @"is_show_bulletin";
NSString *const kAtMeCardGroupIsLongText = @"isLongText";
NSString *const kAtMeCardGroupTopicStruct = @"topic_struct";
NSString *const kAtMeCardGroupText = @"text";
NSString *const kAtMeCardGroupIdstr = @"idstr";
NSString *const kAtMeCardGroupBid = @"bid";
NSString *const kAtMeCardGroupLikeCount = @"like_count";
NSString *const kAtMeCardGroupGifIds = @"gif_ids";
NSString *const kAtMeCardGroupHasActionTypeCard = @"hasActionTypeCard";
NSString *const kAtMeCardGroupSourceType = @"source_type";
NSString *const kAtMeCardGroupHotWeiboTags = @"hot_weibo_tags";
NSString *const kAtMeCardGroupType = @"type";
NSString *const kAtMeCardGroupCreatedTimestamp = @"created_timestamp";
NSString *const kAtMeCardGroupUser = @"user";
NSString *const kAtMeCardGroupTextTagTips = @"text_tag_tips";
NSString *const kAtMeCardGroupCommentsCount = @"comments_count";
NSString *const kAtMeCardGroupSource = @"source";
NSString *const kAtMeCardGroupSourceAllowclick = @"source_allowclick";
NSString *const kAtMeCardGroupBizFeature = @"biz_feature";
NSString *const kAtMeCardGroupPositiveRecomFlag = @"positive_recom_flag";
NSString *const kAtMeCardGroupVisible = @"visible";
NSString *const kAtMeCardGroupAppid = @"appid";
NSString *const kAtMeCardGroupMid = @"mid";
NSString *const kAtMeCardGroupPicIds = @"pic_ids";
NSString *const kAtMeCardGroupRepostsCount = @"reposts_count";
NSString *const kAtMeCardGroupUserType = @"userType";
NSString *const kAtMeCardGroupAttitudesCount = @"attitudes_count";
NSString *const kAtMeCardGroupMlevel = @"mlevel";
NSString *const kAtMeCardGroupRid = @"rid";
NSString *const kAtMeCardGroupCardid = @"cardid";
NSString *const kAtMeCardGroupModType = @"mod_type";
NSString *const kAtMeCardGroupPid = @"pid";
NSString *const kAtMeCardGroupUrlStruct = @"url_struct";


@interface AtMeCardGroup ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation AtMeCardGroup

@synthesize favorited = _favorited;
@synthesize attitudesStatus = _attitudesStatus;
@synthesize createdAt = _createdAt;
@synthesize cardGroupIdentifier = _cardGroupIdentifier;
@synthesize card = _card;
@synthesize isShowBulletin = _isShowBulletin;
@synthesize isLongText = _isLongText;
@synthesize topicStruct = _topicStruct;
@synthesize text = _text;
@synthesize idstr = _idstr;
@synthesize bid = _bid;
@synthesize likeCount = _likeCount;
@synthesize gifIds = _gifIds;
@synthesize hasActionTypeCard = _hasActionTypeCard;
@synthesize sourceType = _sourceType;
@synthesize hotWeiboTags = _hotWeiboTags;
@synthesize type = _type;
@synthesize createdTimestamp = _createdTimestamp;
@synthesize user = _user;
@synthesize textTagTips = _textTagTips;
@synthesize commentsCount = _commentsCount;
@synthesize source = _source;
@synthesize sourceAllowclick = _sourceAllowclick;
@synthesize bizFeature = _bizFeature;
@synthesize positiveRecomFlag = _positiveRecomFlag;
@synthesize visible = _visible;
@synthesize appid = _appid;
@synthesize mid = _mid;
@synthesize picIds = _picIds;
@synthesize repostsCount = _repostsCount;
@synthesize userType = _userType;
@synthesize attitudesCount = _attitudesCount;
@synthesize mlevel = _mlevel;
@synthesize rid = _rid;
@synthesize cardid = _cardid;
@synthesize modType = _modType;
@synthesize pid = _pid;
@synthesize urlStruct = _urlStruct;


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
            self.favorited = [[self objectOrNilForKey:kAtMeCardGroupFavorited fromDictionary:dict] boolValue];
            self.attitudesStatus = [[self objectOrNilForKey:kAtMeCardGroupAttitudesStatus fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kAtMeCardGroupCreatedAt fromDictionary:dict];
            self.cardGroupIdentifier = [[self objectOrNilForKey:kAtMeCardGroupId fromDictionary:dict] doubleValue];
            self.card = [AtMeCard modelObjectWithDictionary:[dict objectForKey:kAtMeCardGroupCard]];
            self.isShowBulletin = [[self objectOrNilForKey:kAtMeCardGroupIsShowBulletin fromDictionary:dict] doubleValue];
            self.isLongText = [[self objectOrNilForKey:kAtMeCardGroupIsLongText fromDictionary:dict] boolValue];
    NSObject *receivedAtMeTopicStruct = [dict objectForKey:kAtMeCardGroupTopicStruct];
    NSMutableArray *parsedAtMeTopicStruct = [NSMutableArray array];
    if ([receivedAtMeTopicStruct isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAtMeTopicStruct) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAtMeTopicStruct addObject:[AtMeTopicStruct modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAtMeTopicStruct isKindOfClass:[NSDictionary class]]) {
       [parsedAtMeTopicStruct addObject:[AtMeTopicStruct modelObjectWithDictionary:(NSDictionary *)receivedAtMeTopicStruct]];
    }

    self.topicStruct = [NSArray arrayWithArray:parsedAtMeTopicStruct];
            self.text = [self objectOrNilForKey:kAtMeCardGroupText fromDictionary:dict];
            self.idstr = [self objectOrNilForKey:kAtMeCardGroupIdstr fromDictionary:dict];
            self.bid = [self objectOrNilForKey:kAtMeCardGroupBid fromDictionary:dict];
            self.likeCount = [[self objectOrNilForKey:kAtMeCardGroupLikeCount fromDictionary:dict] doubleValue];
            self.gifIds = [self objectOrNilForKey:kAtMeCardGroupGifIds fromDictionary:dict];
            self.hasActionTypeCard = [[self objectOrNilForKey:kAtMeCardGroupHasActionTypeCard fromDictionary:dict] doubleValue];
            self.sourceType = [[self objectOrNilForKey:kAtMeCardGroupSourceType fromDictionary:dict] doubleValue];
            self.hotWeiboTags = [self objectOrNilForKey:kAtMeCardGroupHotWeiboTags fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kAtMeCardGroupType fromDictionary:dict] doubleValue];
            self.createdTimestamp = [[self objectOrNilForKey:kAtMeCardGroupCreatedTimestamp fromDictionary:dict] doubleValue];
            self.user = [AtMeUser modelObjectWithDictionary:[dict objectForKey:kAtMeCardGroupUser]];
            self.textTagTips = [self objectOrNilForKey:kAtMeCardGroupTextTagTips fromDictionary:dict];
            self.commentsCount = [[self objectOrNilForKey:kAtMeCardGroupCommentsCount fromDictionary:dict] doubleValue];
            self.source = [self objectOrNilForKey:kAtMeCardGroupSource fromDictionary:dict];
            self.sourceAllowclick = [[self objectOrNilForKey:kAtMeCardGroupSourceAllowclick fromDictionary:dict] doubleValue];
            self.bizFeature = [[self objectOrNilForKey:kAtMeCardGroupBizFeature fromDictionary:dict] doubleValue];
            self.positiveRecomFlag = [[self objectOrNilForKey:kAtMeCardGroupPositiveRecomFlag fromDictionary:dict] doubleValue];
            self.visible = [AtMeVisible modelObjectWithDictionary:[dict objectForKey:kAtMeCardGroupVisible]];
            self.appid = [[self objectOrNilForKey:kAtMeCardGroupAppid fromDictionary:dict] doubleValue];
            self.mid = [self objectOrNilForKey:kAtMeCardGroupMid fromDictionary:dict];
            self.picIds = [self objectOrNilForKey:kAtMeCardGroupPicIds fromDictionary:dict];
            self.repostsCount = [[self objectOrNilForKey:kAtMeCardGroupRepostsCount fromDictionary:dict] doubleValue];
            self.userType = [[self objectOrNilForKey:kAtMeCardGroupUserType fromDictionary:dict] doubleValue];
            self.attitudesCount = [[self objectOrNilForKey:kAtMeCardGroupAttitudesCount fromDictionary:dict] doubleValue];
            self.mlevel = [[self objectOrNilForKey:kAtMeCardGroupMlevel fromDictionary:dict] doubleValue];
            self.rid = [self objectOrNilForKey:kAtMeCardGroupRid fromDictionary:dict];
            self.cardid = [self objectOrNilForKey:kAtMeCardGroupCardid fromDictionary:dict];
            self.modType = [self objectOrNilForKey:kAtMeCardGroupModType fromDictionary:dict];
            self.pid = [[self objectOrNilForKey:kAtMeCardGroupPid fromDictionary:dict] doubleValue];
    NSObject *receivedAtMeUrlStruct = [dict objectForKey:kAtMeCardGroupUrlStruct];
    NSMutableArray *parsedAtMeUrlStruct = [NSMutableArray array];
    if ([receivedAtMeUrlStruct isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedAtMeUrlStruct) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedAtMeUrlStruct addObject:[AtMeUrlStruct modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedAtMeUrlStruct isKindOfClass:[NSDictionary class]]) {
       [parsedAtMeUrlStruct addObject:[AtMeUrlStruct modelObjectWithDictionary:(NSDictionary *)receivedAtMeUrlStruct]];
    }

    self.urlStruct = [NSArray arrayWithArray:parsedAtMeUrlStruct];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.favorited] forKey:kAtMeCardGroupFavorited];
    [mutableDict setValue:[NSNumber numberWithDouble:self.attitudesStatus] forKey:kAtMeCardGroupAttitudesStatus];
    [mutableDict setValue:self.createdAt forKey:kAtMeCardGroupCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cardGroupIdentifier] forKey:kAtMeCardGroupId];
    [mutableDict setValue:[self.card dictionaryRepresentation] forKey:kAtMeCardGroupCard];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isShowBulletin] forKey:kAtMeCardGroupIsShowBulletin];
    [mutableDict setValue:[NSNumber numberWithBool:self.isLongText] forKey:kAtMeCardGroupIsLongText];
    NSMutableArray *tempArrayForTopicStruct = [NSMutableArray array];
    for (NSObject *subArrayObject in self.topicStruct) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTopicStruct addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTopicStruct addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTopicStruct] forKey:kAtMeCardGroupTopicStruct];
    [mutableDict setValue:self.text forKey:kAtMeCardGroupText];
    [mutableDict setValue:self.idstr forKey:kAtMeCardGroupIdstr];
    [mutableDict setValue:self.bid forKey:kAtMeCardGroupBid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likeCount] forKey:kAtMeCardGroupLikeCount];
    [mutableDict setValue:self.gifIds forKey:kAtMeCardGroupGifIds];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasActionTypeCard] forKey:kAtMeCardGroupHasActionTypeCard];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sourceType] forKey:kAtMeCardGroupSourceType];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHotWeiboTags] forKey:kAtMeCardGroupHotWeiboTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kAtMeCardGroupType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdTimestamp] forKey:kAtMeCardGroupCreatedTimestamp];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kAtMeCardGroupUser];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTextTagTips] forKey:kAtMeCardGroupTextTagTips];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kAtMeCardGroupCommentsCount];
    [mutableDict setValue:self.source forKey:kAtMeCardGroupSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sourceAllowclick] forKey:kAtMeCardGroupSourceAllowclick];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bizFeature] forKey:kAtMeCardGroupBizFeature];
    [mutableDict setValue:[NSNumber numberWithDouble:self.positiveRecomFlag] forKey:kAtMeCardGroupPositiveRecomFlag];
    [mutableDict setValue:[self.visible dictionaryRepresentation] forKey:kAtMeCardGroupVisible];
    [mutableDict setValue:[NSNumber numberWithDouble:self.appid] forKey:kAtMeCardGroupAppid];
    [mutableDict setValue:self.mid forKey:kAtMeCardGroupMid];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPicIds] forKey:kAtMeCardGroupPicIds];
    [mutableDict setValue:[NSNumber numberWithDouble:self.repostsCount] forKey:kAtMeCardGroupRepostsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userType] forKey:kAtMeCardGroupUserType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.attitudesCount] forKey:kAtMeCardGroupAttitudesCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mlevel] forKey:kAtMeCardGroupMlevel];
    [mutableDict setValue:self.rid forKey:kAtMeCardGroupRid];
    [mutableDict setValue:self.cardid forKey:kAtMeCardGroupCardid];
    [mutableDict setValue:self.modType forKey:kAtMeCardGroupModType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pid] forKey:kAtMeCardGroupPid];
    NSMutableArray *tempArrayForUrlStruct = [NSMutableArray array];
    for (NSObject *subArrayObject in self.urlStruct) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForUrlStruct addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForUrlStruct addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForUrlStruct] forKey:kAtMeCardGroupUrlStruct];

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

    self.favorited = [aDecoder decodeBoolForKey:kAtMeCardGroupFavorited];
    self.attitudesStatus = [aDecoder decodeDoubleForKey:kAtMeCardGroupAttitudesStatus];
    self.createdAt = [aDecoder decodeObjectForKey:kAtMeCardGroupCreatedAt];
    self.cardGroupIdentifier = [aDecoder decodeDoubleForKey:kAtMeCardGroupId];
    self.card = [aDecoder decodeObjectForKey:kAtMeCardGroupCard];
    self.isShowBulletin = [aDecoder decodeDoubleForKey:kAtMeCardGroupIsShowBulletin];
    self.isLongText = [aDecoder decodeBoolForKey:kAtMeCardGroupIsLongText];
    self.topicStruct = [aDecoder decodeObjectForKey:kAtMeCardGroupTopicStruct];
    self.text = [aDecoder decodeObjectForKey:kAtMeCardGroupText];
    self.idstr = [aDecoder decodeObjectForKey:kAtMeCardGroupIdstr];
    self.bid = [aDecoder decodeObjectForKey:kAtMeCardGroupBid];
    self.likeCount = [aDecoder decodeDoubleForKey:kAtMeCardGroupLikeCount];
    self.gifIds = [aDecoder decodeObjectForKey:kAtMeCardGroupGifIds];
    self.hasActionTypeCard = [aDecoder decodeDoubleForKey:kAtMeCardGroupHasActionTypeCard];
    self.sourceType = [aDecoder decodeDoubleForKey:kAtMeCardGroupSourceType];
    self.hotWeiboTags = [aDecoder decodeObjectForKey:kAtMeCardGroupHotWeiboTags];
    self.type = [aDecoder decodeDoubleForKey:kAtMeCardGroupType];
    self.createdTimestamp = [aDecoder decodeDoubleForKey:kAtMeCardGroupCreatedTimestamp];
    self.user = [aDecoder decodeObjectForKey:kAtMeCardGroupUser];
    self.textTagTips = [aDecoder decodeObjectForKey:kAtMeCardGroupTextTagTips];
    self.commentsCount = [aDecoder decodeDoubleForKey:kAtMeCardGroupCommentsCount];
    self.source = [aDecoder decodeObjectForKey:kAtMeCardGroupSource];
    self.sourceAllowclick = [aDecoder decodeDoubleForKey:kAtMeCardGroupSourceAllowclick];
    self.bizFeature = [aDecoder decodeDoubleForKey:kAtMeCardGroupBizFeature];
    self.positiveRecomFlag = [aDecoder decodeDoubleForKey:kAtMeCardGroupPositiveRecomFlag];
    self.visible = [aDecoder decodeObjectForKey:kAtMeCardGroupVisible];
    self.appid = [aDecoder decodeDoubleForKey:kAtMeCardGroupAppid];
    self.mid = [aDecoder decodeObjectForKey:kAtMeCardGroupMid];
    self.picIds = [aDecoder decodeObjectForKey:kAtMeCardGroupPicIds];
    self.repostsCount = [aDecoder decodeDoubleForKey:kAtMeCardGroupRepostsCount];
    self.userType = [aDecoder decodeDoubleForKey:kAtMeCardGroupUserType];
    self.attitudesCount = [aDecoder decodeDoubleForKey:kAtMeCardGroupAttitudesCount];
    self.mlevel = [aDecoder decodeDoubleForKey:kAtMeCardGroupMlevel];
    self.rid = [aDecoder decodeObjectForKey:kAtMeCardGroupRid];
    self.cardid = [aDecoder decodeObjectForKey:kAtMeCardGroupCardid];
    self.modType = [aDecoder decodeObjectForKey:kAtMeCardGroupModType];
    self.pid = [aDecoder decodeDoubleForKey:kAtMeCardGroupPid];
    self.urlStruct = [aDecoder decodeObjectForKey:kAtMeCardGroupUrlStruct];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_favorited forKey:kAtMeCardGroupFavorited];
    [aCoder encodeDouble:_attitudesStatus forKey:kAtMeCardGroupAttitudesStatus];
    [aCoder encodeObject:_createdAt forKey:kAtMeCardGroupCreatedAt];
    [aCoder encodeDouble:_cardGroupIdentifier forKey:kAtMeCardGroupId];
    [aCoder encodeObject:_card forKey:kAtMeCardGroupCard];
    [aCoder encodeDouble:_isShowBulletin forKey:kAtMeCardGroupIsShowBulletin];
    [aCoder encodeBool:_isLongText forKey:kAtMeCardGroupIsLongText];
    [aCoder encodeObject:_topicStruct forKey:kAtMeCardGroupTopicStruct];
    [aCoder encodeObject:_text forKey:kAtMeCardGroupText];
    [aCoder encodeObject:_idstr forKey:kAtMeCardGroupIdstr];
    [aCoder encodeObject:_bid forKey:kAtMeCardGroupBid];
    [aCoder encodeDouble:_likeCount forKey:kAtMeCardGroupLikeCount];
    [aCoder encodeObject:_gifIds forKey:kAtMeCardGroupGifIds];
    [aCoder encodeDouble:_hasActionTypeCard forKey:kAtMeCardGroupHasActionTypeCard];
    [aCoder encodeDouble:_sourceType forKey:kAtMeCardGroupSourceType];
    [aCoder encodeObject:_hotWeiboTags forKey:kAtMeCardGroupHotWeiboTags];
    [aCoder encodeDouble:_type forKey:kAtMeCardGroupType];
    [aCoder encodeDouble:_createdTimestamp forKey:kAtMeCardGroupCreatedTimestamp];
    [aCoder encodeObject:_user forKey:kAtMeCardGroupUser];
    [aCoder encodeObject:_textTagTips forKey:kAtMeCardGroupTextTagTips];
    [aCoder encodeDouble:_commentsCount forKey:kAtMeCardGroupCommentsCount];
    [aCoder encodeObject:_source forKey:kAtMeCardGroupSource];
    [aCoder encodeDouble:_sourceAllowclick forKey:kAtMeCardGroupSourceAllowclick];
    [aCoder encodeDouble:_bizFeature forKey:kAtMeCardGroupBizFeature];
    [aCoder encodeDouble:_positiveRecomFlag forKey:kAtMeCardGroupPositiveRecomFlag];
    [aCoder encodeObject:_visible forKey:kAtMeCardGroupVisible];
    [aCoder encodeDouble:_appid forKey:kAtMeCardGroupAppid];
    [aCoder encodeObject:_mid forKey:kAtMeCardGroupMid];
    [aCoder encodeObject:_picIds forKey:kAtMeCardGroupPicIds];
    [aCoder encodeDouble:_repostsCount forKey:kAtMeCardGroupRepostsCount];
    [aCoder encodeDouble:_userType forKey:kAtMeCardGroupUserType];
    [aCoder encodeDouble:_attitudesCount forKey:kAtMeCardGroupAttitudesCount];
    [aCoder encodeDouble:_mlevel forKey:kAtMeCardGroupMlevel];
    [aCoder encodeObject:_rid forKey:kAtMeCardGroupRid];
    [aCoder encodeObject:_cardid forKey:kAtMeCardGroupCardid];
    [aCoder encodeObject:_modType forKey:kAtMeCardGroupModType];
    [aCoder encodeDouble:_pid forKey:kAtMeCardGroupPid];
    [aCoder encodeObject:_urlStruct forKey:kAtMeCardGroupUrlStruct];
}

- (id)copyWithZone:(NSZone *)zone
{
    AtMeCardGroup *copy = [[AtMeCardGroup alloc] init];
    
    if (copy) {

        copy.favorited = self.favorited;
        copy.attitudesStatus = self.attitudesStatus;
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.cardGroupIdentifier = self.cardGroupIdentifier;
        copy.card = [self.card copyWithZone:zone];
        copy.isShowBulletin = self.isShowBulletin;
        copy.isLongText = self.isLongText;
        copy.topicStruct = [self.topicStruct copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.idstr = [self.idstr copyWithZone:zone];
        copy.bid = [self.bid copyWithZone:zone];
        copy.likeCount = self.likeCount;
        copy.gifIds = [self.gifIds copyWithZone:zone];
        copy.hasActionTypeCard = self.hasActionTypeCard;
        copy.sourceType = self.sourceType;
        copy.hotWeiboTags = [self.hotWeiboTags copyWithZone:zone];
        copy.type = self.type;
        copy.createdTimestamp = self.createdTimestamp;
        copy.user = [self.user copyWithZone:zone];
        copy.textTagTips = [self.textTagTips copyWithZone:zone];
        copy.commentsCount = self.commentsCount;
        copy.source = [self.source copyWithZone:zone];
        copy.sourceAllowclick = self.sourceAllowclick;
        copy.bizFeature = self.bizFeature;
        copy.positiveRecomFlag = self.positiveRecomFlag;
        copy.visible = [self.visible copyWithZone:zone];
        copy.appid = self.appid;
        copy.mid = [self.mid copyWithZone:zone];
        copy.picIds = [self.picIds copyWithZone:zone];
        copy.repostsCount = self.repostsCount;
        copy.userType = self.userType;
        copy.attitudesCount = self.attitudesCount;
        copy.mlevel = self.mlevel;
        copy.rid = [self.rid copyWithZone:zone];
        copy.cardid = [self.cardid copyWithZone:zone];
        copy.modType = [self.modType copyWithZone:zone];
        copy.pid = self.pid;
        copy.urlStruct = [self.urlStruct copyWithZone:zone];
    }
    
    return copy;
}


@end
