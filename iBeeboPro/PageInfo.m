//
//  PageInfo.m
//
//  Created by   on 16/7/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "PageInfo.h"
#import "Actionlog.h"


NSString *const kPageInfoPageDesc = @"page_desc";
NSString *const kPageInfoPageId = @"page_id";
NSString *const kPageInfoActionlog = @"actionlog";
NSString *const kPageInfoContent1 = @"content1";
NSString *const kPageInfoType = @"type";
NSString *const kPageInfoObjectType = @"object_type";
NSString *const kPageInfoTips = @"tips";
NSString *const kPageInfoContent2 = @"content2";
NSString *const kPageInfoPageTitle = @"page_title";
NSString *const kPageInfoPageUrl = @"page_url";
NSString *const kPageInfoObjectId = @"object_id";
NSString *const kPageInfoPagePic = @"page_pic";


@interface PageInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation PageInfo

@synthesize pageDesc = _pageDesc;
@synthesize pageId = _pageId;
@synthesize actionlog = _actionlog;
@synthesize content1 = _content1;
@synthesize type = _type;
@synthesize objectType = _objectType;
@synthesize tips = _tips;
@synthesize content2 = _content2;
@synthesize pageTitle = _pageTitle;
@synthesize pageUrl = _pageUrl;
@synthesize objectId = _objectId;
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
            self.pageDesc = [self objectOrNilForKey:kPageInfoPageDesc fromDictionary:dict];
            self.pageId = [self objectOrNilForKey:kPageInfoPageId fromDictionary:dict];
            self.actionlog = [Actionlog modelObjectWithDictionary:[dict objectForKey:kPageInfoActionlog]];
            self.content1 = [self objectOrNilForKey:kPageInfoContent1 fromDictionary:dict];
            self.type = [[self objectOrNilForKey:kPageInfoType fromDictionary:dict] doubleValue];
            self.objectType = [self objectOrNilForKey:kPageInfoObjectType fromDictionary:dict];
            self.tips = [self objectOrNilForKey:kPageInfoTips fromDictionary:dict];
            self.content2 = [self objectOrNilForKey:kPageInfoContent2 fromDictionary:dict];
            self.pageTitle = [self objectOrNilForKey:kPageInfoPageTitle fromDictionary:dict];
            self.pageUrl = [self objectOrNilForKey:kPageInfoPageUrl fromDictionary:dict];
            self.objectId = [self objectOrNilForKey:kPageInfoObjectId fromDictionary:dict];
            self.pagePic = [self objectOrNilForKey:kPageInfoPagePic fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.pageDesc forKey:kPageInfoPageDesc];
    [mutableDict setValue:self.pageId forKey:kPageInfoPageId];
    [mutableDict setValue:[self.actionlog dictionaryRepresentation] forKey:kPageInfoActionlog];
    [mutableDict setValue:self.content1 forKey:kPageInfoContent1];
    [mutableDict setValue:[NSNumber numberWithDouble:self.type] forKey:kPageInfoType];
    [mutableDict setValue:self.objectType forKey:kPageInfoObjectType];
    [mutableDict setValue:self.tips forKey:kPageInfoTips];
    [mutableDict setValue:self.content2 forKey:kPageInfoContent2];
    [mutableDict setValue:self.pageTitle forKey:kPageInfoPageTitle];
    [mutableDict setValue:self.pageUrl forKey:kPageInfoPageUrl];
    [mutableDict setValue:self.objectId forKey:kPageInfoObjectId];
    [mutableDict setValue:self.pagePic forKey:kPageInfoPagePic];

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
    self.pageId = [aDecoder decodeObjectForKey:kPageInfoPageId];
    self.actionlog = [aDecoder decodeObjectForKey:kPageInfoActionlog];
    self.content1 = [aDecoder decodeObjectForKey:kPageInfoContent1];
    self.type = [aDecoder decodeDoubleForKey:kPageInfoType];
    self.objectType = [aDecoder decodeObjectForKey:kPageInfoObjectType];
    self.tips = [aDecoder decodeObjectForKey:kPageInfoTips];
    self.content2 = [aDecoder decodeObjectForKey:kPageInfoContent2];
    self.pageTitle = [aDecoder decodeObjectForKey:kPageInfoPageTitle];
    self.pageUrl = [aDecoder decodeObjectForKey:kPageInfoPageUrl];
    self.objectId = [aDecoder decodeObjectForKey:kPageInfoObjectId];
    self.pagePic = [aDecoder decodeObjectForKey:kPageInfoPagePic];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pageDesc forKey:kPageInfoPageDesc];
    [aCoder encodeObject:_pageId forKey:kPageInfoPageId];
    [aCoder encodeObject:_actionlog forKey:kPageInfoActionlog];
    [aCoder encodeObject:_content1 forKey:kPageInfoContent1];
    [aCoder encodeDouble:_type forKey:kPageInfoType];
    [aCoder encodeObject:_objectType forKey:kPageInfoObjectType];
    [aCoder encodeObject:_tips forKey:kPageInfoTips];
    [aCoder encodeObject:_content2 forKey:kPageInfoContent2];
    [aCoder encodeObject:_pageTitle forKey:kPageInfoPageTitle];
    [aCoder encodeObject:_pageUrl forKey:kPageInfoPageUrl];
    [aCoder encodeObject:_objectId forKey:kPageInfoObjectId];
    [aCoder encodeObject:_pagePic forKey:kPageInfoPagePic];
}

- (id)copyWithZone:(NSZone *)zone
{
    PageInfo *copy = [[PageInfo alloc] init];
    
    if (copy) {

        copy.pageDesc = [self.pageDesc copyWithZone:zone];
        copy.pageId = [self.pageId copyWithZone:zone];
        copy.actionlog = [self.actionlog copyWithZone:zone];
        copy.content1 = [self.content1 copyWithZone:zone];
        copy.type = self.type;
        copy.objectType = [self.objectType copyWithZone:zone];
        copy.tips = [self.tips copyWithZone:zone];
        copy.content2 = [self.content2 copyWithZone:zone];
        copy.pageTitle = [self.pageTitle copyWithZone:zone];
        copy.pageUrl = [self.pageUrl copyWithZone:zone];
        copy.objectId = [self.objectId copyWithZone:zone];
        copy.pagePic = [self.pagePic copyWithZone:zone];
    }
    
    return copy;
}


@end
