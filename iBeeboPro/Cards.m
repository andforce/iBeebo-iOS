//
//  Cards.m
//
//  Created by   on 2017/6/17
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "Cards.h"
#import "PicInfo.h"


NSString *const kCardsPagePic = @"page_pic";
NSString *const kCardsTypeIcon = @"type_icon";
NSString *const kCardsPicInfo = @"pic_info";
NSString *const kCardsContent2 = @"content2";
NSString *const kCardsType = @"type";
NSString *const kCardsPageUrl = @"page_url";
NSString *const kCardsContent1 = @"content1";
NSString *const kCardsPageTitle = @"page_title";


@interface Cards ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Cards

@synthesize pagePic = _pagePic;
@synthesize typeIcon = _typeIcon;
@synthesize picInfo = _picInfo;
@synthesize content2 = _content2;
@synthesize type = _type;
@synthesize pageUrl = _pageUrl;
@synthesize content1 = _content1;
@synthesize pageTitle = _pageTitle;


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
            self.pagePic = [self objectOrNilForKey:kCardsPagePic fromDictionary:dict];
            self.typeIcon = [self objectOrNilForKey:kCardsTypeIcon fromDictionary:dict];
            self.picInfo = [PicInfo modelObjectWithDictionary:[dict objectForKey:kCardsPicInfo]];
            self.content2 = [self objectOrNilForKey:kCardsContent2 fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kCardsType fromDictionary:dict] doubleValue];
            self.pageUrl = [self objectOrNilForKey:kCardsPageUrl fromDictionary:dict];
            self.content1 = [self objectOrNilForKey:kCardsContent1 fromDictionary:dict];
            self.pageTitle = [self objectOrNilForKey:kCardsPageTitle fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.pagePic forKey:kCardsPagePic];
    [mutableDict setValue:self.typeIcon forKey:kCardsTypeIcon];
    [mutableDict setValue:[self.picInfo dictionaryRepresentation] forKey:kCardsPicInfo];
    [mutableDict setValue:self.content2 forKey:kCardsContent2];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kCardsType];
    [mutableDict setValue:self.pageUrl forKey:kCardsPageUrl];
    [mutableDict setValue:self.content1 forKey:kCardsContent1];
    [mutableDict setValue:self.pageTitle forKey:kCardsPageTitle];

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

    self.pagePic = [aDecoder decodeObjectForKey:kCardsPagePic];
    self.typeIcon = [aDecoder decodeObjectForKey:kCardsTypeIcon];
    self.picInfo = [aDecoder decodeObjectForKey:kCardsPicInfo];
    self.content2 = [aDecoder decodeObjectForKey:kCardsContent2];
    self.type = [aDecoder decodeDoubleForKey:kCardsType];
    self.pageUrl = [aDecoder decodeObjectForKey:kCardsPageUrl];
    self.content1 = [aDecoder decodeObjectForKey:kCardsContent1];
    self.pageTitle = [aDecoder decodeObjectForKey:kCardsPageTitle];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pagePic forKey:kCardsPagePic];
    [aCoder encodeObject:_typeIcon forKey:kCardsTypeIcon];
    [aCoder encodeObject:_picInfo forKey:kCardsPicInfo];
    [aCoder encodeObject:_content2 forKey:kCardsContent2];
    [aCoder encodeDouble:_type forKey:kCardsType];
    [aCoder encodeObject:_pageUrl forKey:kCardsPageUrl];
    [aCoder encodeObject:_content1 forKey:kCardsContent1];
    [aCoder encodeObject:_pageTitle forKey:kCardsPageTitle];
}

- (id)copyWithZone:(NSZone *)zone
{
    Cards *copy = [[Cards alloc] init];
    
    if (copy) {

        copy.pagePic = [self.pagePic copyWithZone:zone];
        copy.typeIcon = [self.typeIcon copyWithZone:zone];
        copy.picInfo = [self.picInfo copyWithZone:zone];
        copy.content2 = [self.content2 copyWithZone:zone];
        copy.type = self.type;
        copy.pageUrl = [self.pageUrl copyWithZone:zone];
        copy.content1 = [self.content1 copyWithZone:zone];
        copy.pageTitle = [self.pageTitle copyWithZone:zone];
    }
    
    return copy;
}


@end
