//
//  HotMblog.m
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HotMblog.h"
#import "HotPageInfo.h"
#import "HotButtons.h"
#import "HotUser.h"
#import "HotPics.h"
#import "HotVisible.h"
#import "HotMblogButtons.h"


NSString *const kHotMblogBid = @"bid";
NSString *const kHotMblogAttitudesCount = @"attitudes_count";
NSString *const kHotMblogSource = @"source";
NSString *const kHotMblogTextLength = @"textLength";
NSString *const kHotMblogPageInfo = @"page_info";
NSString *const kHotMblogIdstr = @"idstr";
NSString *const kHotMblogMid = @"mid";
NSString *const kHotMblogButtons = @"buttons";
NSString *const kHotMblogRecommendSource = @"recommend_source";
NSString *const kHotMblogFromCateid = @"from_cateid";
NSString *const kHotMblogCommentsCount = @"comments_count";
NSString *const kHotMblogOriginalPic = @"original_pic";
NSString *const kHotMblogCardid = @"cardid";
NSString *const kHotMblogIsLongText = @"isLongText";
NSString *const kHotMblogRepostsCount = @"reposts_count";
NSString *const kHotMblogSyncMblog = @"sync_mblog";
NSString *const kHotMblogThumbnailPic = @"thumbnail_pic";
NSString *const kHotMblogFavorited = @"favorited";
NSString *const kHotMblogBmiddlePic = @"bmiddle_pic";
NSString *const kHotMblogId = @"id";
NSString *const kHotMblogUser = @"user";
NSString *const kHotMblogTopicId = @"topic_id";
NSString *const kHotMblogPics = @"pics";
NSString *const kHotMblogText = @"text";
NSString *const kHotMblogIsImportedTopic = @"is_imported_topic";
NSString *const kHotMblogCreatedAt = @"created_at";
NSString *const kHotMblogVisible = @"visible";
NSString *const kHotMblogPicStatus = @"picStatus";
NSString *const kHotMblogMblogButtons = @"mblog_buttons";
NSString *const kHotMblogRid = @"rid";


@interface HotMblog ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotMblog

@synthesize bid = _bid;
@synthesize attitudesCount = _attitudesCount;
@synthesize source = _source;
@synthesize textLength = _textLength;
@synthesize pageInfo = _pageInfo;
@synthesize idstr = _idstr;
@synthesize mid = _mid;
@synthesize buttons = _buttons;
@synthesize recommendSource = _recommendSource;
@synthesize fromCateid = _fromCateid;
@synthesize commentsCount = _commentsCount;
@synthesize originalPic = _originalPic;
@synthesize cardid = _cardid;
@synthesize isLongText = _isLongText;
@synthesize repostsCount = _repostsCount;
@synthesize syncMblog = _syncMblog;
@synthesize thumbnailPic = _thumbnailPic;
@synthesize favorited = _favorited;
@synthesize bmiddlePic = _bmiddlePic;
@synthesize mblogIdentifier = _mblogIdentifier;
@synthesize user = _user;
@synthesize topicId = _topicId;
@synthesize pics = _pics;
@synthesize text = _text;
@synthesize isImportedTopic = _isImportedTopic;
@synthesize createdAt = _createdAt;
@synthesize visible = _visible;
@synthesize picStatus = _picStatus;
@synthesize mblogButtons = _mblogButtons;
@synthesize rid = _rid;


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
            self.bid = [self objectOrNilForKey:kHotMblogBid fromDictionary:dict];
            self.attitudesCount = [[self objectOrNilForKey:kHotMblogAttitudesCount fromDictionary:dict] doubleValue];
            self.source = [self objectOrNilForKey:kHotMblogSource fromDictionary:dict];
            self.textLength = [[self objectOrNilForKey:kHotMblogTextLength fromDictionary:dict] doubleValue];
            self.pageInfo = [HotPageInfo modelObjectWithDictionary:[dict objectForKey:kHotMblogPageInfo]];
            self.idstr = [self objectOrNilForKey:kHotMblogIdstr fromDictionary:dict];
            self.mid = [self objectOrNilForKey:kHotMblogMid fromDictionary:dict];
    NSObject *receivedHotButtons = [dict objectForKey:kHotMblogButtons];
    NSMutableArray *parsedHotButtons = [NSMutableArray array];
    if ([receivedHotButtons isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHotButtons) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHotButtons addObject:[HotButtons modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHotButtons isKindOfClass:[NSDictionary class]]) {
       [parsedHotButtons addObject:[HotButtons modelObjectWithDictionary:(NSDictionary *)receivedHotButtons]];
    }

    self.buttons = [NSArray arrayWithArray:parsedHotButtons];
            self.recommendSource = [[self objectOrNilForKey:kHotMblogRecommendSource fromDictionary:dict] doubleValue];
            self.fromCateid = [self objectOrNilForKey:kHotMblogFromCateid fromDictionary:dict];
            self.commentsCount = [[self objectOrNilForKey:kHotMblogCommentsCount fromDictionary:dict] doubleValue];
            self.originalPic = [self objectOrNilForKey:kHotMblogOriginalPic fromDictionary:dict];
            self.cardid = [self objectOrNilForKey:kHotMblogCardid fromDictionary:dict];
            self.isLongText = [[self objectOrNilForKey:kHotMblogIsLongText fromDictionary:dict] boolValue];
            self.repostsCount = [[self objectOrNilForKey:kHotMblogRepostsCount fromDictionary:dict] doubleValue];
            self.syncMblog = [[self objectOrNilForKey:kHotMblogSyncMblog fromDictionary:dict] boolValue];
            self.thumbnailPic = [self objectOrNilForKey:kHotMblogThumbnailPic fromDictionary:dict];
            self.favorited = [[self objectOrNilForKey:kHotMblogFavorited fromDictionary:dict] boolValue];
            self.bmiddlePic = [self objectOrNilForKey:kHotMblogBmiddlePic fromDictionary:dict];
            self.mblogIdentifier = [self objectOrNilForKey:kHotMblogId fromDictionary:dict];
            self.user = [HotUser modelObjectWithDictionary:[dict objectForKey:kHotMblogUser]];
            self.topicId = [self objectOrNilForKey:kHotMblogTopicId fromDictionary:dict];
    NSObject *receivedHotPics = [dict objectForKey:kHotMblogPics];
    NSMutableArray *parsedHotPics = [NSMutableArray array];
    if ([receivedHotPics isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHotPics) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHotPics addObject:[HotPics modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHotPics isKindOfClass:[NSDictionary class]]) {
       [parsedHotPics addObject:[HotPics modelObjectWithDictionary:(NSDictionary *)receivedHotPics]];
    }

    self.pics = [NSArray arrayWithArray:parsedHotPics];
            self.text = [self objectOrNilForKey:kHotMblogText fromDictionary:dict];
            self.isImportedTopic = [[self objectOrNilForKey:kHotMblogIsImportedTopic fromDictionary:dict] boolValue];
            self.createdAt = [self objectOrNilForKey:kHotMblogCreatedAt fromDictionary:dict];
            self.visible = [HotVisible modelObjectWithDictionary:[dict objectForKey:kHotMblogVisible]];
            self.picStatus = [self objectOrNilForKey:kHotMblogPicStatus fromDictionary:dict];
    NSObject *receivedHotMblogButtons = [dict objectForKey:kHotMblogMblogButtons];
    NSMutableArray *parsedHotMblogButtons = [NSMutableArray array];
    if ([receivedHotMblogButtons isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedHotMblogButtons) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedHotMblogButtons addObject:[HotMblogButtons modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedHotMblogButtons isKindOfClass:[NSDictionary class]]) {
       [parsedHotMblogButtons addObject:[HotMblogButtons modelObjectWithDictionary:(NSDictionary *)receivedHotMblogButtons]];
    }

    self.mblogButtons = [NSArray arrayWithArray:parsedHotMblogButtons];
            self.rid = [self objectOrNilForKey:kHotMblogRid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.bid forKey:kHotMblogBid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.attitudesCount] forKey:kHotMblogAttitudesCount];
    [mutableDict setValue:self.source forKey:kHotMblogSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.textLength] forKey:kHotMblogTextLength];
    [mutableDict setValue:[self.pageInfo dictionaryRepresentation] forKey:kHotMblogPageInfo];
    [mutableDict setValue:self.idstr forKey:kHotMblogIdstr];
    [mutableDict setValue:self.mid forKey:kHotMblogMid];
    NSMutableArray *tempArrayForButtons = [NSMutableArray array];
    for (NSObject *subArrayObject in self.buttons) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForButtons addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForButtons addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForButtons] forKey:kHotMblogButtons];
    [mutableDict setValue:[NSNumber numberWithDouble:self.recommendSource] forKey:kHotMblogRecommendSource];
    [mutableDict setValue:self.fromCateid forKey:kHotMblogFromCateid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kHotMblogCommentsCount];
    [mutableDict setValue:self.originalPic forKey:kHotMblogOriginalPic];
    [mutableDict setValue:self.cardid forKey:kHotMblogCardid];
    [mutableDict setValue:[NSNumber numberWithBool:self.isLongText] forKey:kHotMblogIsLongText];
    [mutableDict setValue:[NSNumber numberWithDouble:self.repostsCount] forKey:kHotMblogRepostsCount];
    [mutableDict setValue:[NSNumber numberWithBool:self.syncMblog] forKey:kHotMblogSyncMblog];
    [mutableDict setValue:self.thumbnailPic forKey:kHotMblogThumbnailPic];
    [mutableDict setValue:[NSNumber numberWithBool:self.favorited] forKey:kHotMblogFavorited];
    [mutableDict setValue:self.bmiddlePic forKey:kHotMblogBmiddlePic];
    [mutableDict setValue:self.mblogIdentifier forKey:kHotMblogId];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kHotMblogUser];
    [mutableDict setValue:self.topicId forKey:kHotMblogTopicId];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPics] forKey:kHotMblogPics];
    [mutableDict setValue:self.text forKey:kHotMblogText];
    [mutableDict setValue:[NSNumber numberWithBool:self.isImportedTopic] forKey:kHotMblogIsImportedTopic];
    [mutableDict setValue:self.createdAt forKey:kHotMblogCreatedAt];
    [mutableDict setValue:[self.visible dictionaryRepresentation] forKey:kHotMblogVisible];
    [mutableDict setValue:self.picStatus forKey:kHotMblogPicStatus];
    NSMutableArray *tempArrayForMblogButtons = [NSMutableArray array];
    for (NSObject *subArrayObject in self.mblogButtons) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForMblogButtons addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForMblogButtons addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForMblogButtons] forKey:kHotMblogMblogButtons];
    [mutableDict setValue:self.rid forKey:kHotMblogRid];

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

    self.bid = [aDecoder decodeObjectForKey:kHotMblogBid];
    self.attitudesCount = [aDecoder decodeDoubleForKey:kHotMblogAttitudesCount];
    self.source = [aDecoder decodeObjectForKey:kHotMblogSource];
    self.textLength = [aDecoder decodeDoubleForKey:kHotMblogTextLength];
    self.pageInfo = [aDecoder decodeObjectForKey:kHotMblogPageInfo];
    self.idstr = [aDecoder decodeObjectForKey:kHotMblogIdstr];
    self.mid = [aDecoder decodeObjectForKey:kHotMblogMid];
    self.buttons = [aDecoder decodeObjectForKey:kHotMblogButtons];
    self.recommendSource = [aDecoder decodeDoubleForKey:kHotMblogRecommendSource];
    self.fromCateid = [aDecoder decodeObjectForKey:kHotMblogFromCateid];
    self.commentsCount = [aDecoder decodeDoubleForKey:kHotMblogCommentsCount];
    self.originalPic = [aDecoder decodeObjectForKey:kHotMblogOriginalPic];
    self.cardid = [aDecoder decodeObjectForKey:kHotMblogCardid];
    self.isLongText = [aDecoder decodeBoolForKey:kHotMblogIsLongText];
    self.repostsCount = [aDecoder decodeDoubleForKey:kHotMblogRepostsCount];
    self.syncMblog = [aDecoder decodeBoolForKey:kHotMblogSyncMblog];
    self.thumbnailPic = [aDecoder decodeObjectForKey:kHotMblogThumbnailPic];
    self.favorited = [aDecoder decodeBoolForKey:kHotMblogFavorited];
    self.bmiddlePic = [aDecoder decodeObjectForKey:kHotMblogBmiddlePic];
    self.mblogIdentifier = [aDecoder decodeObjectForKey:kHotMblogId];
    self.user = [aDecoder decodeObjectForKey:kHotMblogUser];
    self.topicId = [aDecoder decodeObjectForKey:kHotMblogTopicId];
    self.pics = [aDecoder decodeObjectForKey:kHotMblogPics];
    self.text = [aDecoder decodeObjectForKey:kHotMblogText];
    self.isImportedTopic = [aDecoder decodeBoolForKey:kHotMblogIsImportedTopic];
    self.createdAt = [aDecoder decodeObjectForKey:kHotMblogCreatedAt];
    self.visible = [aDecoder decodeObjectForKey:kHotMblogVisible];
    self.picStatus = [aDecoder decodeObjectForKey:kHotMblogPicStatus];
    self.mblogButtons = [aDecoder decodeObjectForKey:kHotMblogMblogButtons];
    self.rid = [aDecoder decodeObjectForKey:kHotMblogRid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_bid forKey:kHotMblogBid];
    [aCoder encodeDouble:_attitudesCount forKey:kHotMblogAttitudesCount];
    [aCoder encodeObject:_source forKey:kHotMblogSource];
    [aCoder encodeDouble:_textLength forKey:kHotMblogTextLength];
    [aCoder encodeObject:_pageInfo forKey:kHotMblogPageInfo];
    [aCoder encodeObject:_idstr forKey:kHotMblogIdstr];
    [aCoder encodeObject:_mid forKey:kHotMblogMid];
    [aCoder encodeObject:_buttons forKey:kHotMblogButtons];
    [aCoder encodeDouble:_recommendSource forKey:kHotMblogRecommendSource];
    [aCoder encodeObject:_fromCateid forKey:kHotMblogFromCateid];
    [aCoder encodeDouble:_commentsCount forKey:kHotMblogCommentsCount];
    [aCoder encodeObject:_originalPic forKey:kHotMblogOriginalPic];
    [aCoder encodeObject:_cardid forKey:kHotMblogCardid];
    [aCoder encodeBool:_isLongText forKey:kHotMblogIsLongText];
    [aCoder encodeDouble:_repostsCount forKey:kHotMblogRepostsCount];
    [aCoder encodeBool:_syncMblog forKey:kHotMblogSyncMblog];
    [aCoder encodeObject:_thumbnailPic forKey:kHotMblogThumbnailPic];
    [aCoder encodeBool:_favorited forKey:kHotMblogFavorited];
    [aCoder encodeObject:_bmiddlePic forKey:kHotMblogBmiddlePic];
    [aCoder encodeObject:_mblogIdentifier forKey:kHotMblogId];
    [aCoder encodeObject:_user forKey:kHotMblogUser];
    [aCoder encodeObject:_topicId forKey:kHotMblogTopicId];
    [aCoder encodeObject:_pics forKey:kHotMblogPics];
    [aCoder encodeObject:_text forKey:kHotMblogText];
    [aCoder encodeBool:_isImportedTopic forKey:kHotMblogIsImportedTopic];
    [aCoder encodeObject:_createdAt forKey:kHotMblogCreatedAt];
    [aCoder encodeObject:_visible forKey:kHotMblogVisible];
    [aCoder encodeObject:_picStatus forKey:kHotMblogPicStatus];
    [aCoder encodeObject:_mblogButtons forKey:kHotMblogMblogButtons];
    [aCoder encodeObject:_rid forKey:kHotMblogRid];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotMblog *copy = [[HotMblog alloc] init];
    
    if (copy) {

        copy.bid = [self.bid copyWithZone:zone];
        copy.attitudesCount = self.attitudesCount;
        copy.source = [self.source copyWithZone:zone];
        copy.textLength = self.textLength;
        copy.pageInfo = [self.pageInfo copyWithZone:zone];
        copy.idstr = [self.idstr copyWithZone:zone];
        copy.mid = [self.mid copyWithZone:zone];
        copy.buttons = [self.buttons copyWithZone:zone];
        copy.recommendSource = self.recommendSource;
        copy.fromCateid = [self.fromCateid copyWithZone:zone];
        copy.commentsCount = self.commentsCount;
        copy.originalPic = [self.originalPic copyWithZone:zone];
        copy.cardid = [self.cardid copyWithZone:zone];
        copy.isLongText = self.isLongText;
        copy.repostsCount = self.repostsCount;
        copy.syncMblog = self.syncMblog;
        copy.thumbnailPic = [self.thumbnailPic copyWithZone:zone];
        copy.favorited = self.favorited;
        copy.bmiddlePic = [self.bmiddlePic copyWithZone:zone];
        copy.mblogIdentifier = [self.mblogIdentifier copyWithZone:zone];
        copy.user = [self.user copyWithZone:zone];
        copy.topicId = [self.topicId copyWithZone:zone];
        copy.pics = [self.pics copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.isImportedTopic = self.isImportedTopic;
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.visible = [self.visible copyWithZone:zone];
        copy.picStatus = [self.picStatus copyWithZone:zone];
        copy.mblogButtons = [self.mblogButtons copyWithZone:zone];
        copy.rid = [self.rid copyWithZone:zone];
    }
    
    return copy;
}


@end
