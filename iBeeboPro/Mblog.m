//
//  Mblog.m
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Mblog.h"
#import "TopicStruct.h"
#import "Pics.h"
#import "RetweetedStatus.h"
#import "User.h"
#import "Visible.h"
#import "UrlStruct.h"


NSString *const kMblogFavorited = @"favorited";
NSString *const kMblogOriginalPic = @"original_pic";
NSString *const kMblogAttitudesStatus = @"attitudes_status";
NSString *const kMblogCreatedAt = @"created_at";
NSString *const kMblogId = @"id";
NSString *const kMblogIsLongText = @"isLongText";
NSString *const kMblogTopicStruct = @"topic_struct";
NSString *const kMblogText = @"text";
NSString *const kMblogIdstr = @"idstr";
NSString *const kMblogBid = @"bid";
NSString *const kMblogPics = @"pics";
NSString *const kMblogLikeCount = @"like_count";
NSString *const kMblogCreatedTimestamp = @"created_timestamp";
NSString *const kMblogSourceType = @"source_type";
NSString *const kMblogHotWeiboTags = @"hot_weibo_tags";
NSString *const kMblogRetweetedStatus = @"retweeted_status";
NSString *const kMblogTextLength = @"textLength";
NSString *const kMblogUser = @"user";
NSString *const kMblogTextTagTips = @"text_tag_tips";
NSString *const kMblogCommentsCount = @"comments_count";
NSString *const kMblogThumbnailPic = @"thumbnail_pic";
NSString *const kMblogSource = @"source";
NSString *const kMblogSourceAllowclick = @"source_allowclick";
NSString *const kMblogBizFeature = @"biz_feature";
NSString *const kMblogPositiveRecomFlag = @"positive_recom_flag";
NSString *const kMblogBmiddlePic = @"bmiddle_pic";
NSString *const kMblogVisible = @"visible";
NSString *const kMblogAppid = @"appid";
NSString *const kMblogMid = @"mid";
NSString *const kMblogCardid = @"cardid";
NSString *const kMblogRepostsCount = @"reposts_count";
NSString *const kMblogUserType = @"userType";
NSString *const kMblogAttitudesCount = @"attitudes_count";
NSString *const kMblogPicIds = @"pic_ids";
NSString *const kMblogMlevel = @"mlevel";
NSString *const kMblogRid = @"rid";
NSString *const kMblogPicStatus = @"picStatus";
NSString *const kMblogUrlStruct = @"url_struct";
NSString *const kMblogPid = @"pid";


@interface Mblog ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Mblog

@synthesize favorited = _favorited;
@synthesize originalPic = _originalPic;
@synthesize attitudesStatus = _attitudesStatus;
@synthesize createdAt = _createdAt;
@synthesize mblogIdentifier = _mblogIdentifier;
@synthesize isLongText = _isLongText;
@synthesize topicStruct = _topicStruct;
@synthesize text = _text;
@synthesize idstr = _idstr;
@synthesize bid = _bid;
@synthesize pics = _pics;
@synthesize likeCount = _likeCount;
@synthesize createdTimestamp = _createdTimestamp;
@synthesize sourceType = _sourceType;
@synthesize hotWeiboTags = _hotWeiboTags;
@synthesize retweetedStatus = _retweetedStatus;
@synthesize textLength = _textLength;
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
@synthesize cardid = _cardid;
@synthesize repostsCount = _repostsCount;
@synthesize userType = _userType;
@synthesize attitudesCount = _attitudesCount;
@synthesize picIds = _picIds;
@synthesize mlevel = _mlevel;
@synthesize rid = _rid;
@synthesize picStatus = _picStatus;
@synthesize urlStruct = _urlStruct;
@synthesize pid = _pid;


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
            self.favorited = [[self objectOrNilForKey:kMblogFavorited fromDictionary:dict] boolValue];
            self.originalPic = [self objectOrNilForKey:kMblogOriginalPic fromDictionary:dict];
            self.attitudesStatus = [[self objectOrNilForKey:kMblogAttitudesStatus fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kMblogCreatedAt fromDictionary:dict];
            self.mblogIdentifier = [[self objectOrNilForKey:kMblogId fromDictionary:dict] doubleValue];
            self.isLongText = [[self objectOrNilForKey:kMblogIsLongText fromDictionary:dict] boolValue];
    NSObject *receivedTopicStruct = [dict objectForKey:kMblogTopicStruct];
    NSMutableArray *parsedTopicStruct = [NSMutableArray array];
    if ([receivedTopicStruct isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedTopicStruct) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedTopicStruct addObject:[TopicStruct modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedTopicStruct isKindOfClass:[NSDictionary class]]) {
       [parsedTopicStruct addObject:[TopicStruct modelObjectWithDictionary:(NSDictionary *)receivedTopicStruct]];
    }

    self.topicStruct = [NSArray arrayWithArray:parsedTopicStruct];
            self.text = [self objectOrNilForKey:kMblogText fromDictionary:dict];
            self.idstr = [self objectOrNilForKey:kMblogIdstr fromDictionary:dict];
            self.bid = [self objectOrNilForKey:kMblogBid fromDictionary:dict];
    NSObject *receivedPics = [dict objectForKey:kMblogPics];
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
            self.likeCount = [[self objectOrNilForKey:kMblogLikeCount fromDictionary:dict] doubleValue];
            self.createdTimestamp = [[self objectOrNilForKey:kMblogCreatedTimestamp fromDictionary:dict] doubleValue];
            self.sourceType = [[self objectOrNilForKey:kMblogSourceType fromDictionary:dict] doubleValue];
            self.hotWeiboTags = [self objectOrNilForKey:kMblogHotWeiboTags fromDictionary:dict];
            self.retweetedStatus = [RetweetedStatus modelObjectWithDictionary:[dict objectForKey:kMblogRetweetedStatus]];
            self.textLength = [[self objectOrNilForKey:kMblogTextLength fromDictionary:dict] doubleValue];
            self.user = [User modelObjectWithDictionary:[dict objectForKey:kMblogUser]];
            self.textTagTips = [self objectOrNilForKey:kMblogTextTagTips fromDictionary:dict];
            self.commentsCount = [[self objectOrNilForKey:kMblogCommentsCount fromDictionary:dict] doubleValue];
            self.thumbnailPic = [self objectOrNilForKey:kMblogThumbnailPic fromDictionary:dict];
            self.source = [self objectOrNilForKey:kMblogSource fromDictionary:dict];
            self.sourceAllowclick = [[self objectOrNilForKey:kMblogSourceAllowclick fromDictionary:dict] doubleValue];
            self.bizFeature = [[self objectOrNilForKey:kMblogBizFeature fromDictionary:dict] doubleValue];
            self.positiveRecomFlag = [[self objectOrNilForKey:kMblogPositiveRecomFlag fromDictionary:dict] doubleValue];
            self.bmiddlePic = [self objectOrNilForKey:kMblogBmiddlePic fromDictionary:dict];
            self.visible = [Visible modelObjectWithDictionary:[dict objectForKey:kMblogVisible]];
            self.appid = [[self objectOrNilForKey:kMblogAppid fromDictionary:dict] doubleValue];
            self.mid = [self objectOrNilForKey:kMblogMid fromDictionary:dict];
            self.cardid = [self objectOrNilForKey:kMblogCardid fromDictionary:dict];
            self.repostsCount = [[self objectOrNilForKey:kMblogRepostsCount fromDictionary:dict] doubleValue];
            self.userType = [[self objectOrNilForKey:kMblogUserType fromDictionary:dict] doubleValue];
            self.attitudesCount = [[self objectOrNilForKey:kMblogAttitudesCount fromDictionary:dict] doubleValue];
            self.picIds = [self objectOrNilForKey:kMblogPicIds fromDictionary:dict];
            self.mlevel = [[self objectOrNilForKey:kMblogMlevel fromDictionary:dict] doubleValue];
            self.rid = [self objectOrNilForKey:kMblogRid fromDictionary:dict];
            self.picStatus = [self objectOrNilForKey:kMblogPicStatus fromDictionary:dict];
    NSObject *receivedUrlStruct = [dict objectForKey:kMblogUrlStruct];
    NSMutableArray *parsedUrlStruct = [NSMutableArray array];
    if ([receivedUrlStruct isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedUrlStruct) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedUrlStruct addObject:[UrlStruct modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedUrlStruct isKindOfClass:[NSDictionary class]]) {
       [parsedUrlStruct addObject:[UrlStruct modelObjectWithDictionary:(NSDictionary *)receivedUrlStruct]];
    }

    self.urlStruct = [NSArray arrayWithArray:parsedUrlStruct];
            self.pid = [[self objectOrNilForKey:kMblogPid fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithBool:self.favorited] forKey:kMblogFavorited];
    [mutableDict setValue:self.originalPic forKey:kMblogOriginalPic];
    [mutableDict setValue:[NSNumber numberWithDouble:self.attitudesStatus] forKey:kMblogAttitudesStatus];
    [mutableDict setValue:self.createdAt forKey:kMblogCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mblogIdentifier] forKey:kMblogId];
    [mutableDict setValue:[NSNumber numberWithBool:self.isLongText] forKey:kMblogIsLongText];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTopicStruct] forKey:kMblogTopicStruct];
    [mutableDict setValue:self.text forKey:kMblogText];
    [mutableDict setValue:self.idstr forKey:kMblogIdstr];
    [mutableDict setValue:self.bid forKey:kMblogBid];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPics] forKey:kMblogPics];
    [mutableDict setValue:[NSNumber numberWithDouble:self.likeCount] forKey:kMblogLikeCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdTimestamp] forKey:kMblogCreatedTimestamp];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sourceType] forKey:kMblogSourceType];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHotWeiboTags] forKey:kMblogHotWeiboTags];
    [mutableDict setValue:[self.retweetedStatus dictionaryRepresentation] forKey:kMblogRetweetedStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.textLength] forKey:kMblogTextLength];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kMblogUser];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTextTagTips] forKey:kMblogTextTagTips];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kMblogCommentsCount];
    [mutableDict setValue:self.thumbnailPic forKey:kMblogThumbnailPic];
    [mutableDict setValue:self.source forKey:kMblogSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sourceAllowclick] forKey:kMblogSourceAllowclick];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bizFeature] forKey:kMblogBizFeature];
    [mutableDict setValue:[NSNumber numberWithDouble:self.positiveRecomFlag] forKey:kMblogPositiveRecomFlag];
    [mutableDict setValue:self.bmiddlePic forKey:kMblogBmiddlePic];
    [mutableDict setValue:[self.visible dictionaryRepresentation] forKey:kMblogVisible];
    [mutableDict setValue:[NSNumber numberWithDouble:self.appid] forKey:kMblogAppid];
    [mutableDict setValue:self.mid forKey:kMblogMid];
    [mutableDict setValue:self.cardid forKey:kMblogCardid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.repostsCount] forKey:kMblogRepostsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.userType] forKey:kMblogUserType];
    [mutableDict setValue:[NSNumber numberWithDouble:self.attitudesCount] forKey:kMblogAttitudesCount];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPicIds] forKey:kMblogPicIds];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mlevel] forKey:kMblogMlevel];
    [mutableDict setValue:self.rid forKey:kMblogRid];
    [mutableDict setValue:self.picStatus forKey:kMblogPicStatus];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForUrlStruct] forKey:kMblogUrlStruct];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pid] forKey:kMblogPid];

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

    self.favorited = [aDecoder decodeBoolForKey:kMblogFavorited];
    self.originalPic = [aDecoder decodeObjectForKey:kMblogOriginalPic];
    self.attitudesStatus = [aDecoder decodeDoubleForKey:kMblogAttitudesStatus];
    self.createdAt = [aDecoder decodeObjectForKey:kMblogCreatedAt];
    self.mblogIdentifier = [aDecoder decodeDoubleForKey:kMblogId];
    self.isLongText = [aDecoder decodeBoolForKey:kMblogIsLongText];
    self.topicStruct = [aDecoder decodeObjectForKey:kMblogTopicStruct];
    self.text = [aDecoder decodeObjectForKey:kMblogText];
    self.idstr = [aDecoder decodeObjectForKey:kMblogIdstr];
    self.bid = [aDecoder decodeObjectForKey:kMblogBid];
    self.pics = [aDecoder decodeObjectForKey:kMblogPics];
    self.likeCount = [aDecoder decodeDoubleForKey:kMblogLikeCount];
    self.createdTimestamp = [aDecoder decodeDoubleForKey:kMblogCreatedTimestamp];
    self.sourceType = [aDecoder decodeDoubleForKey:kMblogSourceType];
    self.hotWeiboTags = [aDecoder decodeObjectForKey:kMblogHotWeiboTags];
    self.retweetedStatus = [aDecoder decodeObjectForKey:kMblogRetweetedStatus];
    self.textLength = [aDecoder decodeDoubleForKey:kMblogTextLength];
    self.user = [aDecoder decodeObjectForKey:kMblogUser];
    self.textTagTips = [aDecoder decodeObjectForKey:kMblogTextTagTips];
    self.commentsCount = [aDecoder decodeDoubleForKey:kMblogCommentsCount];
    self.thumbnailPic = [aDecoder decodeObjectForKey:kMblogThumbnailPic];
    self.source = [aDecoder decodeObjectForKey:kMblogSource];
    self.sourceAllowclick = [aDecoder decodeDoubleForKey:kMblogSourceAllowclick];
    self.bizFeature = [aDecoder decodeDoubleForKey:kMblogBizFeature];
    self.positiveRecomFlag = [aDecoder decodeDoubleForKey:kMblogPositiveRecomFlag];
    self.bmiddlePic = [aDecoder decodeObjectForKey:kMblogBmiddlePic];
    self.visible = [aDecoder decodeObjectForKey:kMblogVisible];
    self.appid = [aDecoder decodeDoubleForKey:kMblogAppid];
    self.mid = [aDecoder decodeObjectForKey:kMblogMid];
    self.cardid = [aDecoder decodeObjectForKey:kMblogCardid];
    self.repostsCount = [aDecoder decodeDoubleForKey:kMblogRepostsCount];
    self.userType = [aDecoder decodeDoubleForKey:kMblogUserType];
    self.attitudesCount = [aDecoder decodeDoubleForKey:kMblogAttitudesCount];
    self.picIds = [aDecoder decodeObjectForKey:kMblogPicIds];
    self.mlevel = [aDecoder decodeDoubleForKey:kMblogMlevel];
    self.rid = [aDecoder decodeObjectForKey:kMblogRid];
    self.picStatus = [aDecoder decodeObjectForKey:kMblogPicStatus];
    self.urlStruct = [aDecoder decodeObjectForKey:kMblogUrlStruct];
    self.pid = [aDecoder decodeDoubleForKey:kMblogPid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeBool:_favorited forKey:kMblogFavorited];
    [aCoder encodeObject:_originalPic forKey:kMblogOriginalPic];
    [aCoder encodeDouble:_attitudesStatus forKey:kMblogAttitudesStatus];
    [aCoder encodeObject:_createdAt forKey:kMblogCreatedAt];
    [aCoder encodeDouble:_mblogIdentifier forKey:kMblogId];
    [aCoder encodeBool:_isLongText forKey:kMblogIsLongText];
    [aCoder encodeObject:_topicStruct forKey:kMblogTopicStruct];
    [aCoder encodeObject:_text forKey:kMblogText];
    [aCoder encodeObject:_idstr forKey:kMblogIdstr];
    [aCoder encodeObject:_bid forKey:kMblogBid];
    [aCoder encodeObject:_pics forKey:kMblogPics];
    [aCoder encodeDouble:_likeCount forKey:kMblogLikeCount];
    [aCoder encodeDouble:_createdTimestamp forKey:kMblogCreatedTimestamp];
    [aCoder encodeDouble:_sourceType forKey:kMblogSourceType];
    [aCoder encodeObject:_hotWeiboTags forKey:kMblogHotWeiboTags];
    [aCoder encodeObject:_retweetedStatus forKey:kMblogRetweetedStatus];
    [aCoder encodeDouble:_textLength forKey:kMblogTextLength];
    [aCoder encodeObject:_user forKey:kMblogUser];
    [aCoder encodeObject:_textTagTips forKey:kMblogTextTagTips];
    [aCoder encodeDouble:_commentsCount forKey:kMblogCommentsCount];
    [aCoder encodeObject:_thumbnailPic forKey:kMblogThumbnailPic];
    [aCoder encodeObject:_source forKey:kMblogSource];
    [aCoder encodeDouble:_sourceAllowclick forKey:kMblogSourceAllowclick];
    [aCoder encodeDouble:_bizFeature forKey:kMblogBizFeature];
    [aCoder encodeDouble:_positiveRecomFlag forKey:kMblogPositiveRecomFlag];
    [aCoder encodeObject:_bmiddlePic forKey:kMblogBmiddlePic];
    [aCoder encodeObject:_visible forKey:kMblogVisible];
    [aCoder encodeDouble:_appid forKey:kMblogAppid];
    [aCoder encodeObject:_mid forKey:kMblogMid];
    [aCoder encodeObject:_cardid forKey:kMblogCardid];
    [aCoder encodeDouble:_repostsCount forKey:kMblogRepostsCount];
    [aCoder encodeDouble:_userType forKey:kMblogUserType];
    [aCoder encodeDouble:_attitudesCount forKey:kMblogAttitudesCount];
    [aCoder encodeObject:_picIds forKey:kMblogPicIds];
    [aCoder encodeDouble:_mlevel forKey:kMblogMlevel];
    [aCoder encodeObject:_rid forKey:kMblogRid];
    [aCoder encodeObject:_picStatus forKey:kMblogPicStatus];
    [aCoder encodeObject:_urlStruct forKey:kMblogUrlStruct];
    [aCoder encodeDouble:_pid forKey:kMblogPid];
}

- (id)copyWithZone:(NSZone *)zone
{
    Mblog *copy = [[Mblog alloc] init];
    
    if (copy) {

        copy.favorited = self.favorited;
        copy.originalPic = [self.originalPic copyWithZone:zone];
        copy.attitudesStatus = self.attitudesStatus;
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.mblogIdentifier = self.mblogIdentifier;
        copy.isLongText = self.isLongText;
        copy.topicStruct = [self.topicStruct copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.idstr = [self.idstr copyWithZone:zone];
        copy.bid = [self.bid copyWithZone:zone];
        copy.pics = [self.pics copyWithZone:zone];
        copy.likeCount = self.likeCount;
        copy.createdTimestamp = self.createdTimestamp;
        copy.sourceType = self.sourceType;
        copy.hotWeiboTags = [self.hotWeiboTags copyWithZone:zone];
        copy.retweetedStatus = [self.retweetedStatus copyWithZone:zone];
        copy.textLength = self.textLength;
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
        copy.cardid = [self.cardid copyWithZone:zone];
        copy.repostsCount = self.repostsCount;
        copy.userType = self.userType;
        copy.attitudesCount = self.attitudesCount;
        copy.picIds = [self.picIds copyWithZone:zone];
        copy.mlevel = self.mlevel;
        copy.rid = [self.rid copyWithZone:zone];
        copy.picStatus = [self.picStatus copyWithZone:zone];
        copy.urlStruct = [self.urlStruct copyWithZone:zone];
        copy.pid = self.pid;
    }
    
    return copy;
}


@end
