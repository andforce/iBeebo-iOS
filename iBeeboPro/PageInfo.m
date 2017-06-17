//
//  PageInfo.m
//
//  Created by   on 2017/6/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "PageInfo.h"
#import "Author.h"
#import "PicInfo.h"
#import "MediaInfo.h"
#import "Cards.h"


NSString *const kPageInfoPageDesc = @"page_desc";
NSString *const kPageInfoAuthor = @"author";
NSString *const kPageInfoContent1 = @"content1";
NSString *const kPageInfoType = @"type";
NSString *const kPageInfoObjectType = @"object_type";
NSString *const kPageInfoPageUrl = @"page_url";
NSString *const kPageInfoIcon = @"icon";
NSString *const kPageInfoPageTitle = @"page_title";
NSString *const kPageInfoContent2 = @"content2";
NSString *const kPageInfoPicInfo = @"pic_info";
NSString *const kPageInfoMediaInfo = @"media_info";
NSString *const kPageInfoPagePic = @"page_pic";
NSString *const kPageInfoCards = @"cards";


@interface PageInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PageInfo

@synthesize pageDesc = _pageDesc;
@synthesize author = _author;
@synthesize content1 = _content1;
@synthesize type = _type;
@synthesize objectType = _objectType;
@synthesize pageUrl = _pageUrl;
@synthesize icon = _icon;
@synthesize pageTitle = _pageTitle;
@synthesize content2 = _content2;
@synthesize picInfo = _picInfo;
@synthesize mediaInfo = _mediaInfo;
@synthesize pagePic = _pagePic;
@synthesize cards = _cards;


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
            self.pageDesc = [self objectOrNilForKey:kPageInfoPageDesc fromDictionary:dict];
            self.author = [Author modelObjectWithDictionary:[dict objectForKey:kPageInfoAuthor]];
            self.content1 = [self objectOrNilForKey:kPageInfoContent1 fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kPageInfoType fromDictionary:dict] doubleValue];
            self.objectType = [self objectOrNilForKey:kPageInfoObjectType fromDictionary:dict];
            self.pageUrl = [self objectOrNilForKey:kPageInfoPageUrl fromDictionary:dict];
            self.icon = [self objectOrNilForKey:kPageInfoIcon fromDictionary:dict];
            self.pageTitle = [self objectOrNilForKey:kPageInfoPageTitle fromDictionary:dict];
            self.content2 = [self objectOrNilForKey:kPageInfoContent2 fromDictionary:dict];
            self.picInfo = [PicInfo modelObjectWithDictionary:[dict objectForKey:kPageInfoPicInfo]];
            self.mediaInfo = [MediaInfo modelObjectWithDictionary:[dict objectForKey:kPageInfoMediaInfo]];
            self.pagePic = [self objectOrNilForKey:kPageInfoPagePic fromDictionary:dict];
    NSObject *receivedCards = [dict objectForKey:kPageInfoCards];
    NSMutableArray *parsedCards = [NSMutableArray array];
    if ([receivedCards isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedCards) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedCards addObject:[Cards modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedCards isKindOfClass:[NSDictionary class]]) {
       [parsedCards addObject:[Cards modelObjectWithDictionary:(NSDictionary *)receivedCards]];
    }

    self.cards = [NSArray arrayWithArray:parsedCards];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.pageDesc forKey:kPageInfoPageDesc];
    [mutableDict setValue:[self.author dictionaryRepresentation] forKey:kPageInfoAuthor];
    [mutableDict setValue:self.content1 forKey:kPageInfoContent1];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kPageInfoType];
    [mutableDict setValue:self.objectType forKey:kPageInfoObjectType];
    [mutableDict setValue:self.pageUrl forKey:kPageInfoPageUrl];
    [mutableDict setValue:self.icon forKey:kPageInfoIcon];
    [mutableDict setValue:self.pageTitle forKey:kPageInfoPageTitle];
    [mutableDict setValue:self.content2 forKey:kPageInfoContent2];
    [mutableDict setValue:[self.picInfo dictionaryRepresentation] forKey:kPageInfoPicInfo];
    [mutableDict setValue:[self.mediaInfo dictionaryRepresentation] forKey:kPageInfoMediaInfo];
    [mutableDict setValue:self.pagePic forKey:kPageInfoPagePic];
    NSMutableArray *tempArrayForCards = [NSMutableArray array];
    for (NSObject *subArrayObject in self.cards) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForCards addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForCards addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForCards] forKey:kPageInfoCards];

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

    self.pageDesc = [aDecoder decodeObjectForKey:kPageInfoPageDesc];
    self.author = [aDecoder decodeObjectForKey:kPageInfoAuthor];
    self.content1 = [aDecoder decodeObjectForKey:kPageInfoContent1];
    self.type = [aDecoder decodeDoubleForKey:kPageInfoType];
    self.objectType = [aDecoder decodeObjectForKey:kPageInfoObjectType];
    self.pageUrl = [aDecoder decodeObjectForKey:kPageInfoPageUrl];
    self.icon = [aDecoder decodeObjectForKey:kPageInfoIcon];
    self.pageTitle = [aDecoder decodeObjectForKey:kPageInfoPageTitle];
    self.content2 = [aDecoder decodeObjectForKey:kPageInfoContent2];
    self.picInfo = [aDecoder decodeObjectForKey:kPageInfoPicInfo];
    self.mediaInfo = [aDecoder decodeObjectForKey:kPageInfoMediaInfo];
    self.pagePic = [aDecoder decodeObjectForKey:kPageInfoPagePic];
    self.cards = [aDecoder decodeObjectForKey:kPageInfoCards];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageDesc forKey:kPageInfoPageDesc];
    [aCoder encodeObject:_author forKey:kPageInfoAuthor];
    [aCoder encodeObject:_content1 forKey:kPageInfoContent1];
    [aCoder encodeDouble:_type forKey:kPageInfoType];
    [aCoder encodeObject:_objectType forKey:kPageInfoObjectType];
    [aCoder encodeObject:_pageUrl forKey:kPageInfoPageUrl];
    [aCoder encodeObject:_icon forKey:kPageInfoIcon];
    [aCoder encodeObject:_pageTitle forKey:kPageInfoPageTitle];
    [aCoder encodeObject:_content2 forKey:kPageInfoContent2];
    [aCoder encodeObject:_picInfo forKey:kPageInfoPicInfo];
    [aCoder encodeObject:_mediaInfo forKey:kPageInfoMediaInfo];
    [aCoder encodeObject:_pagePic forKey:kPageInfoPagePic];
    [aCoder encodeObject:_cards forKey:kPageInfoCards];
}

- (id)copyWithZone:(NSZone *)zone
{
    PageInfo *copy = [[PageInfo alloc] init];
    
    if (copy) {

        copy.pageDesc = [self.pageDesc copyWithZone:zone];
        copy.author = [self.author copyWithZone:zone];
        copy.content1 = [self.content1 copyWithZone:zone];
        copy.type = self.type;
        copy.objectType = [self.objectType copyWithZone:zone];
        copy.pageUrl = [self.pageUrl copyWithZone:zone];
        copy.icon = [self.icon copyWithZone:zone];
        copy.pageTitle = [self.pageTitle copyWithZone:zone];
        copy.content2 = [self.content2 copyWithZone:zone];
        copy.picInfo = [self.picInfo copyWithZone:zone];
        copy.mediaInfo = [self.mediaInfo copyWithZone:zone];
        copy.pagePic = [self.pagePic copyWithZone:zone];
        copy.cards = [self.cards copyWithZone:zone];
    }
    
    return copy;
}


@end
