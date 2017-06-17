//
//  Mblog.m
//
//  Created by   on 2017/6/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Mblog.h"
#import "PageInfo.h"
#import "RetweetedStatus.h"
#import "User.h"
#import "Pics.h"
#import "Visible.h"


NSString *const kMblogRawText = @"raw_text";
NSString *const kMblogAttitudesCount = @"attitudes_count";
NSString *const kMblogSource = @"source";
NSString *const kMblogHasActionTypeCard = @"hasActionTypeCard";
NSString *const kMblogTextLength = @"textLength";
NSString *const kMblogMid = @"mid";
NSString *const kMblogGifIds = @"gif_ids";
NSString *const kMblogPageInfo = @"page_info";
NSString *const kMblogOriginalPic = @"original_pic";
NSString *const kMblogRetweetedStatus = @"retweeted_status";
NSString *const kMblogCommentsCount = @"comments_count";
NSString *const kMblogCardid = @"cardid";
NSString *const kMblogIsLongText = @"isLongText";
NSString *const kMblogRepostsCount = @"reposts_count";
NSString *const kMblogIsShowBulletin = @"is_show_bulletin";
NSString *const kMblogFavorited = @"favorited";
NSString *const kMblogThumbnailPic = @"thumbnail_pic";
NSString *const kMblogBmiddlePic = @"bmiddle_pic";
NSString *const kMblogId = @"id";
NSString *const kMblogUser = @"user";
NSString *const kMblogMlevelSource = @"mlevelSource";
NSString *const kMblogPics = @"pics";
NSString *const kMblogText = @"text";
NSString *const kMblogPid = @"pid";
NSString *const kMblogCreatedAt = @"created_at";
NSString *const kMblogVisible = @"visible";
NSString *const kMblogPicIds = @"pic_ids";
NSString *const kMblogPicStatus = @"picStatus";
NSString *const kMblogRid = @"rid";
NSString *const kMblogBid = @"bid";


@interface Mblog ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Mblog

@synthesize rawText = _rawText;
@synthesize attitudesCount = _attitudesCount;
@synthesize source = _source;
@synthesize hasActionTypeCard = _hasActionTypeCard;
@synthesize textLength = _textLength;
@synthesize mid = _mid;
@synthesize gifIds = _gifIds;
@synthesize pageInfo = _pageInfo;
@synthesize originalPic = _originalPic;
@synthesize retweetedStatus = _retweetedStatus;
@synthesize commentsCount = _commentsCount;
@synthesize cardid = _cardid;
@synthesize isLongText = _isLongText;
@synthesize repostsCount = _repostsCount;
@synthesize isShowBulletin = _isShowBulletin;
@synthesize favorited = _favorited;
@synthesize thumbnailPic = _thumbnailPic;
@synthesize bmiddlePic = _bmiddlePic;
@synthesize mblogIdentifier = _mblogIdentifier;
@synthesize user = _user;
@synthesize mlevelSource = _mlevelSource;
@synthesize pics = _pics;
@synthesize text = _text;
@synthesize pid = _pid;
@synthesize createdAt = _createdAt;
@synthesize visible = _visible;
@synthesize picIds = _picIds;
@synthesize picStatus = _picStatus;
@synthesize rid = _rid;
@synthesize bid = _bid;


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
            self.rawText = [self objectOrNilForKey:kMblogRawText fromDictionary:dict];
            self.attitudesCount = [[self objectOrNilForKey:kMblogAttitudesCount fromDictionary:dict] doubleValue];
            self.source = [self objectOrNilForKey:kMblogSource fromDictionary:dict];
            self.hasActionTypeCard = [[self objectOrNilForKey:kMblogHasActionTypeCard fromDictionary:dict] doubleValue];
            self.textLength = [[self objectOrNilForKey:kMblogTextLength fromDictionary:dict] doubleValue];
            self.mid = [self objectOrNilForKey:kMblogMid fromDictionary:dict];
            self.gifIds = [self objectOrNilForKey:kMblogGifIds fromDictionary:dict];
            self.pageInfo = [PageInfo modelObjectWithDictionary:[dict objectForKey:kMblogPageInfo]];
            self.originalPic = [self objectOrNilForKey:kMblogOriginalPic fromDictionary:dict];
            self.retweetedStatus = [RetweetedStatus modelObjectWithDictionary:[dict objectForKey:kMblogRetweetedStatus]];
            self.commentsCount = [[self objectOrNilForKey:kMblogCommentsCount fromDictionary:dict] doubleValue];
            self.cardid = [self objectOrNilForKey:kMblogCardid fromDictionary:dict];
            self.isLongText = [[self objectOrNilForKey:kMblogIsLongText fromDictionary:dict] boolValue];
            self.repostsCount = [[self objectOrNilForKey:kMblogRepostsCount fromDictionary:dict] doubleValue];
            self.isShowBulletin = [[self objectOrNilForKey:kMblogIsShowBulletin fromDictionary:dict] doubleValue];
            self.favorited = [[self objectOrNilForKey:kMblogFavorited fromDictionary:dict] boolValue];
            self.thumbnailPic = [self objectOrNilForKey:kMblogThumbnailPic fromDictionary:dict];
            self.bmiddlePic = [self objectOrNilForKey:kMblogBmiddlePic fromDictionary:dict];
            self.mblogIdentifier = [self objectOrNilForKey:kMblogId fromDictionary:dict];
            self.user = [User modelObjectWithDictionary:[dict objectForKey:kMblogUser]];
            self.mlevelSource = [self objectOrNilForKey:kMblogMlevelSource fromDictionary:dict];
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
            self.text = [self objectOrNilForKey:kMblogText fromDictionary:dict];
            self.pid = [[self objectOrNilForKey:kMblogPid fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kMblogCreatedAt fromDictionary:dict];
            self.visible = [Visible modelObjectWithDictionary:[dict objectForKey:kMblogVisible]];
            self.picIds = [self objectOrNilForKey:kMblogPicIds fromDictionary:dict];
            self.picStatus = [self objectOrNilForKey:kMblogPicStatus fromDictionary:dict];
            self.rid = [self objectOrNilForKey:kMblogRid fromDictionary:dict];
            self.bid = [self objectOrNilForKey:kMblogBid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.rawText forKey:kMblogRawText];
    [mutableDict setValue:[NSNumber numberWithDouble:self.attitudesCount] forKey:kMblogAttitudesCount];
    [mutableDict setValue:self.source forKey:kMblogSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasActionTypeCard] forKey:kMblogHasActionTypeCard];
    [mutableDict setValue:[NSNumber numberWithDouble:self.textLength] forKey:kMblogTextLength];
    [mutableDict setValue:self.mid forKey:kMblogMid];
    [mutableDict setValue:self.gifIds forKey:kMblogGifIds];
    [mutableDict setValue:[self.pageInfo dictionaryRepresentation] forKey:kMblogPageInfo];
    [mutableDict setValue:self.originalPic forKey:kMblogOriginalPic];
    [mutableDict setValue:[self.retweetedStatus dictionaryRepresentation] forKey:kMblogRetweetedStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kMblogCommentsCount];
    [mutableDict setValue:self.cardid forKey:kMblogCardid];
    [mutableDict setValue:[NSNumber numberWithBool:self.isLongText] forKey:kMblogIsLongText];
    [mutableDict setValue:[NSNumber numberWithDouble:self.repostsCount] forKey:kMblogRepostsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isShowBulletin] forKey:kMblogIsShowBulletin];
    [mutableDict setValue:[NSNumber numberWithBool:self.favorited] forKey:kMblogFavorited];
    [mutableDict setValue:self.thumbnailPic forKey:kMblogThumbnailPic];
    [mutableDict setValue:self.bmiddlePic forKey:kMblogBmiddlePic];
    [mutableDict setValue:self.mblogIdentifier forKey:kMblogId];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kMblogUser];
    [mutableDict setValue:self.mlevelSource forKey:kMblogMlevelSource];
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
    [mutableDict setValue:self.text forKey:kMblogText];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pid] forKey:kMblogPid];
    [mutableDict setValue:self.createdAt forKey:kMblogCreatedAt];
    [mutableDict setValue:[self.visible dictionaryRepresentation] forKey:kMblogVisible];
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
    [mutableDict setValue:self.picStatus forKey:kMblogPicStatus];
    [mutableDict setValue:self.rid forKey:kMblogRid];
    [mutableDict setValue:self.bid forKey:kMblogBid];

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

    self.rawText = [aDecoder decodeObjectForKey:kMblogRawText];
    self.attitudesCount = [aDecoder decodeDoubleForKey:kMblogAttitudesCount];
    self.source = [aDecoder decodeObjectForKey:kMblogSource];
    self.hasActionTypeCard = [aDecoder decodeDoubleForKey:kMblogHasActionTypeCard];
    self.textLength = [aDecoder decodeDoubleForKey:kMblogTextLength];
    self.mid = [aDecoder decodeObjectForKey:kMblogMid];
    self.gifIds = [aDecoder decodeObjectForKey:kMblogGifIds];
    self.pageInfo = [aDecoder decodeObjectForKey:kMblogPageInfo];
    self.originalPic = [aDecoder decodeObjectForKey:kMblogOriginalPic];
    self.retweetedStatus = [aDecoder decodeObjectForKey:kMblogRetweetedStatus];
    self.commentsCount = [aDecoder decodeDoubleForKey:kMblogCommentsCount];
    self.cardid = [aDecoder decodeObjectForKey:kMblogCardid];
    self.isLongText = [aDecoder decodeBoolForKey:kMblogIsLongText];
    self.repostsCount = [aDecoder decodeDoubleForKey:kMblogRepostsCount];
    self.isShowBulletin = [aDecoder decodeDoubleForKey:kMblogIsShowBulletin];
    self.favorited = [aDecoder decodeBoolForKey:kMblogFavorited];
    self.thumbnailPic = [aDecoder decodeObjectForKey:kMblogThumbnailPic];
    self.bmiddlePic = [aDecoder decodeObjectForKey:kMblogBmiddlePic];
    self.mblogIdentifier = [aDecoder decodeObjectForKey:kMblogId];
    self.user = [aDecoder decodeObjectForKey:kMblogUser];
    self.mlevelSource = [aDecoder decodeObjectForKey:kMblogMlevelSource];
    self.pics = [aDecoder decodeObjectForKey:kMblogPics];
    self.text = [aDecoder decodeObjectForKey:kMblogText];
    self.pid = [aDecoder decodeDoubleForKey:kMblogPid];
    self.createdAt = [aDecoder decodeObjectForKey:kMblogCreatedAt];
    self.visible = [aDecoder decodeObjectForKey:kMblogVisible];
    self.picIds = [aDecoder decodeObjectForKey:kMblogPicIds];
    self.picStatus = [aDecoder decodeObjectForKey:kMblogPicStatus];
    self.rid = [aDecoder decodeObjectForKey:kMblogRid];
    self.bid = [aDecoder decodeObjectForKey:kMblogBid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_rawText forKey:kMblogRawText];
    [aCoder encodeDouble:_attitudesCount forKey:kMblogAttitudesCount];
    [aCoder encodeObject:_source forKey:kMblogSource];
    [aCoder encodeDouble:_hasActionTypeCard forKey:kMblogHasActionTypeCard];
    [aCoder encodeDouble:_textLength forKey:kMblogTextLength];
    [aCoder encodeObject:_mid forKey:kMblogMid];
    [aCoder encodeObject:_gifIds forKey:kMblogGifIds];
    [aCoder encodeObject:_pageInfo forKey:kMblogPageInfo];
    [aCoder encodeObject:_originalPic forKey:kMblogOriginalPic];
    [aCoder encodeObject:_retweetedStatus forKey:kMblogRetweetedStatus];
    [aCoder encodeDouble:_commentsCount forKey:kMblogCommentsCount];
    [aCoder encodeObject:_cardid forKey:kMblogCardid];
    [aCoder encodeBool:_isLongText forKey:kMblogIsLongText];
    [aCoder encodeDouble:_repostsCount forKey:kMblogRepostsCount];
    [aCoder encodeDouble:_isShowBulletin forKey:kMblogIsShowBulletin];
    [aCoder encodeBool:_favorited forKey:kMblogFavorited];
    [aCoder encodeObject:_thumbnailPic forKey:kMblogThumbnailPic];
    [aCoder encodeObject:_bmiddlePic forKey:kMblogBmiddlePic];
    [aCoder encodeObject:_mblogIdentifier forKey:kMblogId];
    [aCoder encodeObject:_user forKey:kMblogUser];
    [aCoder encodeObject:_mlevelSource forKey:kMblogMlevelSource];
    [aCoder encodeObject:_pics forKey:kMblogPics];
    [aCoder encodeObject:_text forKey:kMblogText];
    [aCoder encodeDouble:_pid forKey:kMblogPid];
    [aCoder encodeObject:_createdAt forKey:kMblogCreatedAt];
    [aCoder encodeObject:_visible forKey:kMblogVisible];
    [aCoder encodeObject:_picIds forKey:kMblogPicIds];
    [aCoder encodeObject:_picStatus forKey:kMblogPicStatus];
    [aCoder encodeObject:_rid forKey:kMblogRid];
    [aCoder encodeObject:_bid forKey:kMblogBid];
}

- (id)copyWithZone:(NSZone *)zone
{
    Mblog *copy = [[Mblog alloc] init];
    
    if (copy) {

        copy.rawText = [self.rawText copyWithZone:zone];
        copy.attitudesCount = self.attitudesCount;
        copy.source = [self.source copyWithZone:zone];
        copy.hasActionTypeCard = self.hasActionTypeCard;
        copy.textLength = self.textLength;
        copy.mid = [self.mid copyWithZone:zone];
        copy.gifIds = [self.gifIds copyWithZone:zone];
        copy.pageInfo = [self.pageInfo copyWithZone:zone];
        copy.originalPic = [self.originalPic copyWithZone:zone];
        copy.retweetedStatus = [self.retweetedStatus copyWithZone:zone];
        copy.commentsCount = self.commentsCount;
        copy.cardid = [self.cardid copyWithZone:zone];
        copy.isLongText = self.isLongText;
        copy.repostsCount = self.repostsCount;
        copy.isShowBulletin = self.isShowBulletin;
        copy.favorited = self.favorited;
        copy.thumbnailPic = [self.thumbnailPic copyWithZone:zone];
        copy.bmiddlePic = [self.bmiddlePic copyWithZone:zone];
        copy.mblogIdentifier = [self.mblogIdentifier copyWithZone:zone];
        copy.user = [self.user copyWithZone:zone];
        copy.mlevelSource = [self.mlevelSource copyWithZone:zone];
        copy.pics = [self.pics copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.pid = self.pid;
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.visible = [self.visible copyWithZone:zone];
        copy.picIds = [self.picIds copyWithZone:zone];
        copy.picStatus = [self.picStatus copyWithZone:zone];
        copy.rid = [self.rid copyWithZone:zone];
        copy.bid = [self.bid copyWithZone:zone];
    }
    
    return copy;
}


@end
