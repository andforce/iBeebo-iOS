//
//  HotPageInfo.m
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HotPageInfo.h"
#import "HotPagePic.h"
#import "HotMediaInfo.h"


NSString *const kHotPageInfoPageUrl = @"page_url";
NSString *const kHotPageInfoPagePic = @"page_pic";
NSString *const kHotPageInfoIcon = @"icon";
NSString *const kHotPageInfoContent2 = @"content2";
NSString *const kHotPageInfoType = @"type";
NSString *const kHotPageInfoMediaInfo = @"media_info";
NSString *const kHotPageInfoContent1 = @"content1";
NSString *const kHotPageInfoPageTitle = @"page_title";


@interface HotPageInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotPageInfo

@synthesize pageUrl = _pageUrl;
@synthesize pagePic = _pagePic;
@synthesize icon = _icon;
@synthesize content2 = _content2;
@synthesize type = _type;
@synthesize mediaInfo = _mediaInfo;
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
            self.pageUrl = [self objectOrNilForKey:kHotPageInfoPageUrl fromDictionary:dict];
            self.pagePic = [HotPagePic modelObjectWithDictionary:[dict objectForKey:kHotPageInfoPagePic]];
            self.icon = [self objectOrNilForKey:kHotPageInfoIcon fromDictionary:dict];
            self.content2 = [self objectOrNilForKey:kHotPageInfoContent2 fromDictionary:dict];
            self.type = [self objectOrNilForKey:kHotPageInfoType fromDictionary:dict];
            self.mediaInfo = [HotMediaInfo modelObjectWithDictionary:[dict objectForKey:kHotPageInfoMediaInfo]];
            self.content1 = [self objectOrNilForKey:kHotPageInfoContent1 fromDictionary:dict];
            self.pageTitle = [self objectOrNilForKey:kHotPageInfoPageTitle fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.pageUrl forKey:kHotPageInfoPageUrl];
    [mutableDict setValue:[self.pagePic dictionaryRepresentation] forKey:kHotPageInfoPagePic];
    [mutableDict setValue:self.icon forKey:kHotPageInfoIcon];
    [mutableDict setValue:self.content2 forKey:kHotPageInfoContent2];
    [mutableDict setValue:self.type forKey:kHotPageInfoType];
    [mutableDict setValue:[self.mediaInfo dictionaryRepresentation] forKey:kHotPageInfoMediaInfo];
    [mutableDict setValue:self.content1 forKey:kHotPageInfoContent1];
    [mutableDict setValue:self.pageTitle forKey:kHotPageInfoPageTitle];

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

    self.pageUrl = [aDecoder decodeObjectForKey:kHotPageInfoPageUrl];
    self.pagePic = [aDecoder decodeObjectForKey:kHotPageInfoPagePic];
    self.icon = [aDecoder decodeObjectForKey:kHotPageInfoIcon];
    self.content2 = [aDecoder decodeObjectForKey:kHotPageInfoContent2];
    self.type = [aDecoder decodeObjectForKey:kHotPageInfoType];
    self.mediaInfo = [aDecoder decodeObjectForKey:kHotPageInfoMediaInfo];
    self.content1 = [aDecoder decodeObjectForKey:kHotPageInfoContent1];
    self.pageTitle = [aDecoder decodeObjectForKey:kHotPageInfoPageTitle];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageUrl forKey:kHotPageInfoPageUrl];
    [aCoder encodeObject:_pagePic forKey:kHotPageInfoPagePic];
    [aCoder encodeObject:_icon forKey:kHotPageInfoIcon];
    [aCoder encodeObject:_content2 forKey:kHotPageInfoContent2];
    [aCoder encodeObject:_type forKey:kHotPageInfoType];
    [aCoder encodeObject:_mediaInfo forKey:kHotPageInfoMediaInfo];
    [aCoder encodeObject:_content1 forKey:kHotPageInfoContent1];
    [aCoder encodeObject:_pageTitle forKey:kHotPageInfoPageTitle];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotPageInfo *copy = [[HotPageInfo alloc] init];
    
    if (copy) {

        copy.pageUrl = [self.pageUrl copyWithZone:zone];
        copy.pagePic = [self.pagePic copyWithZone:zone];
        copy.icon = [self.icon copyWithZone:zone];
        copy.content2 = [self.content2 copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.mediaInfo = [self.mediaInfo copyWithZone:zone];
        copy.content1 = [self.content1 copyWithZone:zone];
        copy.pageTitle = [self.pageTitle copyWithZone:zone];
    }
    
    return copy;
}


@end
