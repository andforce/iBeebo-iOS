//
//  HotPageInfo.m
//
//  Created by   on 2017/6/19
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import "HotPageInfo.h"
#import "HotMediaInfo.h"
#import "HotPagePic.h"


NSString *const kHotPageInfoPageTitle = @"page_title";
NSString *const kHotPageInfoMediaInfo = @"media_info";
NSString *const kHotPageInfoContent2 = @"content2";
NSString *const kHotPageInfoType = @"type";
NSString *const kHotPageInfoContent1 = @"content1";
NSString *const kHotPageInfoPageUrl = @"page_url";
NSString *const kHotPageInfoPagePic = @"page_pic";


@interface HotPageInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation HotPageInfo

@synthesize pageTitle = _pageTitle;
@synthesize mediaInfo = _mediaInfo;
@synthesize content2 = _content2;
@synthesize type = _type;
@synthesize content1 = _content1;
@synthesize pageUrl = _pageUrl;
@synthesize pagePic = _pagePic;


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
            self.pageTitle = [self objectOrNilForKey:kHotPageInfoPageTitle fromDictionary:dict];
            self.mediaInfo = [HotMediaInfo modelObjectWithDictionary:[dict objectForKey:kHotPageInfoMediaInfo]];
            self.content2 = [self objectOrNilForKey:kHotPageInfoContent2 fromDictionary:dict];
            self.type = [self objectOrNilForKey:kHotPageInfoType fromDictionary:dict];
            self.content1 = [self objectOrNilForKey:kHotPageInfoContent1 fromDictionary:dict];
            self.pageUrl = [self objectOrNilForKey:kHotPageInfoPageUrl fromDictionary:dict];
            self.pagePic = [HotPagePic modelObjectWithDictionary:[dict objectForKey:kHotPageInfoPagePic]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.pageTitle forKey:kHotPageInfoPageTitle];
    [mutableDict setValue:[self.mediaInfo dictionaryRepresentation] forKey:kHotPageInfoMediaInfo];
    [mutableDict setValue:self.content2 forKey:kHotPageInfoContent2];
    [mutableDict setValue:self.type forKey:kHotPageInfoType];
    [mutableDict setValue:self.content1 forKey:kHotPageInfoContent1];
    [mutableDict setValue:self.pageUrl forKey:kHotPageInfoPageUrl];
    [mutableDict setValue:[self.pagePic dictionaryRepresentation] forKey:kHotPageInfoPagePic];

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

    self.pageTitle = [aDecoder decodeObjectForKey:kHotPageInfoPageTitle];
    self.mediaInfo = [aDecoder decodeObjectForKey:kHotPageInfoMediaInfo];
    self.content2 = [aDecoder decodeObjectForKey:kHotPageInfoContent2];
    self.type = [aDecoder decodeObjectForKey:kHotPageInfoType];
    self.content1 = [aDecoder decodeObjectForKey:kHotPageInfoContent1];
    self.pageUrl = [aDecoder decodeObjectForKey:kHotPageInfoPageUrl];
    self.pagePic = [aDecoder decodeObjectForKey:kHotPageInfoPagePic];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageTitle forKey:kHotPageInfoPageTitle];
    [aCoder encodeObject:_mediaInfo forKey:kHotPageInfoMediaInfo];
    [aCoder encodeObject:_content2 forKey:kHotPageInfoContent2];
    [aCoder encodeObject:_type forKey:kHotPageInfoType];
    [aCoder encodeObject:_content1 forKey:kHotPageInfoContent1];
    [aCoder encodeObject:_pageUrl forKey:kHotPageInfoPageUrl];
    [aCoder encodeObject:_pagePic forKey:kHotPageInfoPagePic];
}

- (id)copyWithZone:(NSZone *)zone
{
    HotPageInfo *copy = [[HotPageInfo alloc] init];
    
    if (copy) {

        copy.pageTitle = [self.pageTitle copyWithZone:zone];
        copy.mediaInfo = [self.mediaInfo copyWithZone:zone];
        copy.content2 = [self.content2 copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.content1 = [self.content1 copyWithZone:zone];
        copy.pageUrl = [self.pageUrl copyWithZone:zone];
        copy.pagePic = [self.pagePic copyWithZone:zone];
    }
    
    return copy;
}


@end
