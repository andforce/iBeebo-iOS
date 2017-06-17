//
//  RetweetedStatus.m
//
//  Created by   on 2017/6/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "RetweetedStatus.h"
#import "PageInfo.h"
#import "User.h"
#import "Pics.h"
#import "Visible.h"


NSString *const kRetweetedStatusAttitudesCount = @"attitudes_count";
NSString *const kRetweetedStatusSource = @"source";
NSString *const kRetweetedStatusTextLength = @"textLength";
NSString *const kRetweetedStatusHasActionTypeCard = @"hasActionTypeCard";
NSString *const kRetweetedStatusPageInfo = @"page_info";
NSString *const kRetweetedStatusMid = @"mid";
NSString *const kRetweetedStatusGifIds = @"gif_ids";
NSString *const kRetweetedStatusOriginalPic = @"original_pic";
NSString *const kRetweetedStatusCardid = @"cardid";
NSString *const kRetweetedStatusCommentsCount = @"comments_count";
NSString *const kRetweetedStatusIsLongText = @"isLongText";
NSString *const kRetweetedStatusRepostsCount = @"reposts_count";
NSString *const kRetweetedStatusIsShowBulletin = @"is_show_bulletin";
NSString *const kRetweetedStatusThumbnailPic = @"thumbnail_pic";
NSString *const kRetweetedStatusFavorited = @"favorited";
NSString *const kRetweetedStatusBmiddlePic = @"bmiddle_pic";
NSString *const kRetweetedStatusId = @"id";
NSString *const kRetweetedStatusUser = @"user";
NSString *const kRetweetedStatusPics = @"pics";
NSString *const kRetweetedStatusText = @"text";
NSString *const kRetweetedStatusCreatedAt = @"created_at";
NSString *const kRetweetedStatusPicIds = @"pic_ids";
NSString *const kRetweetedStatusVisible = @"visible";
NSString *const kRetweetedStatusPicStatus = @"picStatus";
NSString *const kRetweetedStatusBid = @"bid";


@interface RetweetedStatus ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RetweetedStatus

@synthesize attitudesCount = _attitudesCount;
@synthesize source = _source;
@synthesize textLength = _textLength;
@synthesize hasActionTypeCard = _hasActionTypeCard;
@synthesize pageInfo = _pageInfo;
@synthesize mid = _mid;
@synthesize gifIds = _gifIds;
@synthesize originalPic = _originalPic;
@synthesize cardid = _cardid;
@synthesize commentsCount = _commentsCount;
@synthesize isLongText = _isLongText;
@synthesize repostsCount = _repostsCount;
@synthesize isShowBulletin = _isShowBulletin;
@synthesize thumbnailPic = _thumbnailPic;
@synthesize favorited = _favorited;
@synthesize bmiddlePic = _bmiddlePic;
@synthesize retweetedStatusIdentifier = _retweetedStatusIdentifier;
@synthesize user = _user;
@synthesize pics = _pics;
@synthesize text = _text;
@synthesize createdAt = _createdAt;
@synthesize picIds = _picIds;
@synthesize visible = _visible;
@synthesize picStatus = _picStatus;
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
            self.attitudesCount = [[self objectOrNilForKey:kRetweetedStatusAttitudesCount fromDictionary:dict] doubleValue];
            self.source = [self objectOrNilForKey:kRetweetedStatusSource fromDictionary:dict];
            self.textLength = [[self objectOrNilForKey:kRetweetedStatusTextLength fromDictionary:dict] doubleValue];
            self.hasActionTypeCard = [[self objectOrNilForKey:kRetweetedStatusHasActionTypeCard fromDictionary:dict] doubleValue];
            self.pageInfo = [PageInfo modelObjectWithDictionary:[dict objectForKey:kRetweetedStatusPageInfo]];
            self.mid = [self objectOrNilForKey:kRetweetedStatusMid fromDictionary:dict];
            self.gifIds = [self objectOrNilForKey:kRetweetedStatusGifIds fromDictionary:dict];
            self.originalPic = [self objectOrNilForKey:kRetweetedStatusOriginalPic fromDictionary:dict];
            self.cardid = [self objectOrNilForKey:kRetweetedStatusCardid fromDictionary:dict];
            self.commentsCount = [[self objectOrNilForKey:kRetweetedStatusCommentsCount fromDictionary:dict] doubleValue];
            self.isLongText = [[self objectOrNilForKey:kRetweetedStatusIsLongText fromDictionary:dict] boolValue];
            self.repostsCount = [[self objectOrNilForKey:kRetweetedStatusRepostsCount fromDictionary:dict] doubleValue];
            self.isShowBulletin = [[self objectOrNilForKey:kRetweetedStatusIsShowBulletin fromDictionary:dict] doubleValue];
            self.thumbnailPic = [self objectOrNilForKey:kRetweetedStatusThumbnailPic fromDictionary:dict];
            self.favorited = [[self objectOrNilForKey:kRetweetedStatusFavorited fromDictionary:dict] boolValue];
            self.bmiddlePic = [self objectOrNilForKey:kRetweetedStatusBmiddlePic fromDictionary:dict];
            self.retweetedStatusIdentifier = [self objectOrNilForKey:kRetweetedStatusId fromDictionary:dict];
            self.user = [User modelObjectWithDictionary:[dict objectForKey:kRetweetedStatusUser]];
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
            self.text = [self objectOrNilForKey:kRetweetedStatusText fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kRetweetedStatusCreatedAt fromDictionary:dict];
            self.picIds = [self objectOrNilForKey:kRetweetedStatusPicIds fromDictionary:dict];
            self.visible = [Visible modelObjectWithDictionary:[dict objectForKey:kRetweetedStatusVisible]];
            self.picStatus = [self objectOrNilForKey:kRetweetedStatusPicStatus fromDictionary:dict];
            self.bid = [self objectOrNilForKey:kRetweetedStatusBid fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.attitudesCount] forKey:kRetweetedStatusAttitudesCount];
    [mutableDict setValue:self.source forKey:kRetweetedStatusSource];
    [mutableDict setValue:[NSNumber numberWithDouble:self.textLength] forKey:kRetweetedStatusTextLength];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hasActionTypeCard] forKey:kRetweetedStatusHasActionTypeCard];
    [mutableDict setValue:[self.pageInfo dictionaryRepresentation] forKey:kRetweetedStatusPageInfo];
    [mutableDict setValue:self.mid forKey:kRetweetedStatusMid];
    [mutableDict setValue:self.gifIds forKey:kRetweetedStatusGifIds];
    [mutableDict setValue:self.originalPic forKey:kRetweetedStatusOriginalPic];
    [mutableDict setValue:self.cardid forKey:kRetweetedStatusCardid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.commentsCount] forKey:kRetweetedStatusCommentsCount];
    [mutableDict setValue:[NSNumber numberWithBool:self.isLongText] forKey:kRetweetedStatusIsLongText];
    [mutableDict setValue:[NSNumber numberWithDouble:self.repostsCount] forKey:kRetweetedStatusRepostsCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isShowBulletin] forKey:kRetweetedStatusIsShowBulletin];
    [mutableDict setValue:self.thumbnailPic forKey:kRetweetedStatusThumbnailPic];
    [mutableDict setValue:[NSNumber numberWithBool:self.favorited] forKey:kRetweetedStatusFavorited];
    [mutableDict setValue:self.bmiddlePic forKey:kRetweetedStatusBmiddlePic];
    [mutableDict setValue:self.retweetedStatusIdentifier forKey:kRetweetedStatusId];
    [mutableDict setValue:[self.user dictionaryRepresentation] forKey:kRetweetedStatusUser];
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
    [mutableDict setValue:self.text forKey:kRetweetedStatusText];
    [mutableDict setValue:self.createdAt forKey:kRetweetedStatusCreatedAt];
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
    [mutableDict setValue:[self.visible dictionaryRepresentation] forKey:kRetweetedStatusVisible];
    [mutableDict setValue:self.picStatus forKey:kRetweetedStatusPicStatus];
    [mutableDict setValue:self.bid forKey:kRetweetedStatusBid];

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

    self.attitudesCount = [aDecoder decodeDoubleForKey:kRetweetedStatusAttitudesCount];
    self.source = [aDecoder decodeObjectForKey:kRetweetedStatusSource];
    self.textLength = [aDecoder decodeDoubleForKey:kRetweetedStatusTextLength];
    self.hasActionTypeCard = [aDecoder decodeDoubleForKey:kRetweetedStatusHasActionTypeCard];
    self.pageInfo = [aDecoder decodeObjectForKey:kRetweetedStatusPageInfo];
    self.mid = [aDecoder decodeObjectForKey:kRetweetedStatusMid];
    self.gifIds = [aDecoder decodeObjectForKey:kRetweetedStatusGifIds];
    self.originalPic = [aDecoder decodeObjectForKey:kRetweetedStatusOriginalPic];
    self.cardid = [aDecoder decodeObjectForKey:kRetweetedStatusCardid];
    self.commentsCount = [aDecoder decodeDoubleForKey:kRetweetedStatusCommentsCount];
    self.isLongText = [aDecoder decodeBoolForKey:kRetweetedStatusIsLongText];
    self.repostsCount = [aDecoder decodeDoubleForKey:kRetweetedStatusRepostsCount];
    self.isShowBulletin = [aDecoder decodeDoubleForKey:kRetweetedStatusIsShowBulletin];
    self.thumbnailPic = [aDecoder decodeObjectForKey:kRetweetedStatusThumbnailPic];
    self.favorited = [aDecoder decodeBoolForKey:kRetweetedStatusFavorited];
    self.bmiddlePic = [aDecoder decodeObjectForKey:kRetweetedStatusBmiddlePic];
    self.retweetedStatusIdentifier = [aDecoder decodeObjectForKey:kRetweetedStatusId];
    self.user = [aDecoder decodeObjectForKey:kRetweetedStatusUser];
    self.pics = [aDecoder decodeObjectForKey:kRetweetedStatusPics];
    self.text = [aDecoder decodeObjectForKey:kRetweetedStatusText];
    self.createdAt = [aDecoder decodeObjectForKey:kRetweetedStatusCreatedAt];
    self.picIds = [aDecoder decodeObjectForKey:kRetweetedStatusPicIds];
    self.visible = [aDecoder decodeObjectForKey:kRetweetedStatusVisible];
    self.picStatus = [aDecoder decodeObjectForKey:kRetweetedStatusPicStatus];
    self.bid = [aDecoder decodeObjectForKey:kRetweetedStatusBid];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_attitudesCount forKey:kRetweetedStatusAttitudesCount];
    [aCoder encodeObject:_source forKey:kRetweetedStatusSource];
    [aCoder encodeDouble:_textLength forKey:kRetweetedStatusTextLength];
    [aCoder encodeDouble:_hasActionTypeCard forKey:kRetweetedStatusHasActionTypeCard];
    [aCoder encodeObject:_pageInfo forKey:kRetweetedStatusPageInfo];
    [aCoder encodeObject:_mid forKey:kRetweetedStatusMid];
    [aCoder encodeObject:_gifIds forKey:kRetweetedStatusGifIds];
    [aCoder encodeObject:_originalPic forKey:kRetweetedStatusOriginalPic];
    [aCoder encodeObject:_cardid forKey:kRetweetedStatusCardid];
    [aCoder encodeDouble:_commentsCount forKey:kRetweetedStatusCommentsCount];
    [aCoder encodeBool:_isLongText forKey:kRetweetedStatusIsLongText];
    [aCoder encodeDouble:_repostsCount forKey:kRetweetedStatusRepostsCount];
    [aCoder encodeDouble:_isShowBulletin forKey:kRetweetedStatusIsShowBulletin];
    [aCoder encodeObject:_thumbnailPic forKey:kRetweetedStatusThumbnailPic];
    [aCoder encodeBool:_favorited forKey:kRetweetedStatusFavorited];
    [aCoder encodeObject:_bmiddlePic forKey:kRetweetedStatusBmiddlePic];
    [aCoder encodeObject:_retweetedStatusIdentifier forKey:kRetweetedStatusId];
    [aCoder encodeObject:_user forKey:kRetweetedStatusUser];
    [aCoder encodeObject:_pics forKey:kRetweetedStatusPics];
    [aCoder encodeObject:_text forKey:kRetweetedStatusText];
    [aCoder encodeObject:_createdAt forKey:kRetweetedStatusCreatedAt];
    [aCoder encodeObject:_picIds forKey:kRetweetedStatusPicIds];
    [aCoder encodeObject:_visible forKey:kRetweetedStatusVisible];
    [aCoder encodeObject:_picStatus forKey:kRetweetedStatusPicStatus];
    [aCoder encodeObject:_bid forKey:kRetweetedStatusBid];
}

- (id)copyWithZone:(NSZone *)zone
{
    RetweetedStatus *copy = [[RetweetedStatus alloc] init];
    
    if (copy) {

        copy.attitudesCount = self.attitudesCount;
        copy.source = [self.source copyWithZone:zone];
        copy.textLength = self.textLength;
        copy.hasActionTypeCard = self.hasActionTypeCard;
        copy.pageInfo = [self.pageInfo copyWithZone:zone];
        copy.mid = [self.mid copyWithZone:zone];
        copy.gifIds = [self.gifIds copyWithZone:zone];
        copy.originalPic = [self.originalPic copyWithZone:zone];
        copy.cardid = [self.cardid copyWithZone:zone];
        copy.commentsCount = self.commentsCount;
        copy.isLongText = self.isLongText;
        copy.repostsCount = self.repostsCount;
        copy.isShowBulletin = self.isShowBulletin;
        copy.thumbnailPic = [self.thumbnailPic copyWithZone:zone];
        copy.favorited = self.favorited;
        copy.bmiddlePic = [self.bmiddlePic copyWithZone:zone];
        copy.retweetedStatusIdentifier = [self.retweetedStatusIdentifier copyWithZone:zone];
        copy.user = [self.user copyWithZone:zone];
        copy.pics = [self.pics copyWithZone:zone];
        copy.text = [self.text copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.picIds = [self.picIds copyWithZone:zone];
        copy.visible = [self.visible copyWithZone:zone];
        copy.picStatus = [self.picStatus copyWithZone:zone];
        copy.bid = [self.bid copyWithZone:zone];
    }
    
    return copy;
}


@end
